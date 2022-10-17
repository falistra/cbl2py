import string
import re
import typing

from cbl2py.asg.params.CobolDialect import CobolDialect
from cbl2py.preprocessor.CobolLine import CobolLine
from cbl2py.preprocessor.CobolLineRewriter import CobolLineRewriter
from cbl2py.preprocessor.CobolLineTypeEnum import CobolLineTypeEnum
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens

class CobolCommentEntriesMarker(CobolLineRewriter):
    
    commentEntryTriggerLinePattern : typing.Pattern
    foundCommentEntryTriggerInPreviousLine : bool = False
    isInCommentEntry : bool = False

    triggersEnd = ["PROGRAM-ID.", "AUTHOR.", "INSTALLATION.", "DATE-WRITTEN.",\
			"DATE-COMPILED.", "SECURITY.", "ENVIRONMENT", "DATA.", "PROCEDURE." ]

    triggersStart = ["AUTHOR.", "INSTALLATION.", "DATE-WRITTEN.",\
			"DATE-COMPILED.", "SECURITY.", "REMARKS." ]

    def __init__(self):
        commentEntryTriggerLineFormat = "([ \\t]*)(" + string.join("|", self.triggersStart) + ")(.+)"
        self.commentEntryTriggerLinePattern = re.compile(commentEntryTriggerLineFormat,re.IGNORECASE)

    def buildMultiLineCommentEntryLine(self,line : CobolLine) -> CobolLine :
        return CobolLine.copyCobolLineWithIndicatorArea(CobolPreprocessorTokens.COMMENT_ENTRY_TAG + CobolPreprocessorTokens.WS,line)

	# /**
	#  * Escapes in a given line a potential comment entry.
	#  */

    def escapeCommentEntry(self, line : CobolLine ) -> CobolLine:
        result: CobolLine
        matcher: typing.Match = self.commentEntryTriggerLinePattern.match(line.getContentArea())
        if (matcher):
            whitespace = matcher.group(1);
            trigger = matcher.group(2);
            commentEntry = matcher.group(3);            
            newContentArea = whitespace + trigger + CobolPreprocessorTokens.WS\
				+ CobolPreprocessorTokens.COMMENT_ENTRY_TAG + commentEntry
            result = CobolLine.copyCobolLineWithContentArea(newContentArea, line)
        else:
            result = line
        return result

    def isInCommentEntry(self, line : CobolLine, isContentAreaAEmpty : bool,\
			isInOsvsCommentEntry : bool) -> bool :
        result : bool = (line.getType() == CobolLineTypeEnum.COMMENT) or isContentAreaAEmpty\
				or isInOsvsCommentEntry
        return result

	# /**
	#  * OSVS: The comment-entry can be contained in either area A or area B of the
	#  * comment-entry lines. However, the next occurrence in area A of any one of the
	#  * following COBOL words or phrases terminates the comment-entry and begin the
	#  * next paragraph or division.
	#  */

    def isInOsvsCommentEntry(self, line : CobolLine) -> bool :
        result : bool = CobolDialect.OSVS.equals(line.getDialect()) and not self.startsWithTrigger(line, self.triggersEnd)
        return result


    def processLine(self, line : CobolLine ) -> CobolLine:
        result : CobolLine

        if (line.getFormat().isCommentEntryMultiLine()) :
            result = self.processMultiLineCommentEntry(line)
        else :
            result = self.processSingleLineCommentEntry(line)
        return result

    def processLines(self, lines : list[CobolLine]) -> list[CobolLine]:
        result : list[CobolLine] = []
        line : CobolLine
        for line in lines:
            processedLine : CobolLine = self.processLine(line)
            result.add(processedLine)
        return result

	# /**
	#  * If the Compiler directive SOURCEFORMAT is specified as or defaulted to FIXED,
	#  * the comment-entry can be contained on one or more lines but is restricted to
	#  * area B of those lines; the next line commencing in area A begins the next
	#  * non-comment entry.
	#  */

    def processMultiLineCommentEntry(self, line : CobolLine ) -> CobolLine:
        foundCommentEntryTriggerInCurrentLine : bool = self.startsWithTrigger(line, self.triggersStart)
        result : CobolLine

        if (foundCommentEntryTriggerInCurrentLine) :
            result = self.escapeCommentEntry(line)
        elif (self.foundCommentEntryTriggerInPreviousLine or self.isInCommentEntry):
            isContentAreaAEmpty : bool = (line.getContentAreaA().trim() == "")
            isInOsvsCommentEntry : bool = self.isInOsvsCommentEntry(line)
            isInCommentEntry : bool = self.isInCommentEntry(line, isContentAreaAEmpty, isInOsvsCommentEntry)

            if (isInCommentEntry) :
                result = self.buildMultiLineCommentEntryLine(line)
        else:
            result = line
        
        self.foundCommentEntryTriggerInPreviousLine = foundCommentEntryTriggerInCurrentLine

        return result

    def processSingleLineCommentEntry(self, line : CobolLine ) -> CobolLine:

        foundCommentEntryTriggerInCurrentLine : bool = self.startsWithTrigger(line, self.triggersStart)
        result : CobolLine

        if foundCommentEntryTriggerInCurrentLine :
            result = self.escapeCommentEntry(line)
        else:
            result = line
        
        return result

    # 	/**
	#  * Checks, whether given line starts with a trigger keyword indicating a comment
	#  * entry.
	#  */

    def startsWithTrigger(self, line : CobolLine, triggers : list[str]) -> bool :
        contentAreaUpperCase : string = line.getContentArea().upper()

        result : bool = False
        trigger : string

        for trigger in triggers: 
            containsTrigger : bool = contentAreaUpperCase.trim().startsWith(trigger)

            if (containsTrigger) :
                result = True
                break

        return result


    