import re
import typing

from cbl2py.preprocessor.CobolLine import CobolLine
from cbl2py.preprocessor.CobolLineRewriter import CobolLineRewriter
from cbl2py.preprocessor.CobolLineTypeEnum import CobolLineTypeEnum
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens

class CobolInlineCommentEntriesNormalizer(CobolLineRewriter):
    
    denormalizedCommentEntryRegex : str= "\\*>[^ ]"
    pattern : typing.Pattern  = re.compile(denormalizedCommentEntryRegex)


    def processLine(self, line : CobolLine ) -> CobolLine:
        matcher: typing.Match = self.pattern.match(line)
        result: CobolLine
        if (not matcher):
            result = line
        else:
            newContentArea : str= line.getContentArea().replace(CobolPreprocessorTokens.COMMENT_TAG,\
					CobolPreprocessorTokens.COMMENT_TAG + CobolPreprocessorTokens.WS)
            result = CobolLine.copyCobolLineWithContentArea(newContentArea, line)
        return result

    def processLines(self, lines : list[CobolLine]) -> list[CobolLine]:
        result : list[CobolLine] = []
        line : CobolLine
        for line in lines:
            processedLine : CobolLine = self.processLine(line)
            result.add(processedLine)
        return result