import string
from enum import Enum
import typing

from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens
from cbl2py.preprocessor.CobolLineTypeEnum import CobolLineTypeEnum
from cbl2py.preprocessor.CobolSourceFormatEnum import CobolSourceFormatEnum
from cbl2py.preprocessor.CobolLine import CobolLine
from cbl2py.asg.params.CobolParserParams import CobolParserParams


class CobolLineReader:

    def processLines(self,lines : string , params : CobolParserParams) -> list:
        result = []
        for (lineNumber,currentLine) in enumerate(lines.splitlines()):
            currentCobolLine = self.parseLine(currentLine,lineNumber,params)
            result.append(currentCobolLine)
        return result

    def determineType(self,indicatorArea: string) -> CobolLineTypeEnum:

        switcher = {
            CobolPreprocessorTokens.CHAR_D    : CobolLineTypeEnum.DEBUG,
		    CobolPreprocessorTokens.CHAR_D_   : CobolLineTypeEnum.DEBUG,
            CobolPreprocessorTokens.CHAR_MINUS: CobolLineTypeEnum.CONTINUATION,
		    CobolPreprocessorTokens.CHAR_ASTERISK   : CobolLineTypeEnum.COMMENT,
            CobolPreprocessorTokens.CHAR_DOLLAR_SIGN   : CobolLineTypeEnum.COMPILER_DIRECTIVE,
		    CobolPreprocessorTokens.WS   : CobolLineTypeEnum.NORMAL
        }
        
        return switcher.get(indicatorArea,CobolLineTypeEnum.NORMAL)

    def parseLine(self, line: string, lineNumber: int, params : CobolParserParams) -> CobolLine:
        format : CobolSourceFormatEnum  = params.getFormat()
        pattern : typing.Pattern  = format.getPattern() # : Pattern
        matcher: typing.Match = pattern.match(line)

        if (not matcher):
            swither = {
                CobolSourceFormatEnum.FIXED : "Columns 1-6 sequence number, column 7 indicator area, columns 8-72 for areas A and B",
                CobolSourceFormatEnum.TANDEM : "Column 1 indicator area, columns 2 and all following for areas A and B",
                CobolSourceFormatEnum.VARIABLE : "Columns 1-6 sequence number, column 7 indicator area, columns 8 and all following for areas A and B"
            }
            formatDescription = swither.get(format,"")
            message : string = "Is " + params.getFormat() + " the correct line format (" + formatDescription + ")? Could not parse line " + (lineNumber + 1) + ": " + line

            raise Exception  # 		throw new CobolPreprocessorException(message);
        else:
            sequenceAreaGroup = matcher.group(1)
            indicatorAreaGroup = matcher.group(2)
            contentAreaAGroup = matcher.group(3)
            contentAreaBGroup = matcher.group(4)
            commentAreaGroup = matcher.group(5)

            sequenceArea = sequenceAreaGroup if sequenceAreaGroup else ""
            indicatorArea = indicatorAreaGroup if indicatorAreaGroup else ""
            contentAreaA = contentAreaAGroup if contentAreaAGroup else ""
            contentAreaB = contentAreaBGroup if contentAreaBGroup else ""
            commentArea = commentAreaGroup if commentAreaGroup else ""

            type : CobolLineTypeEnum  = self.determineType(indicatorArea)

            result = CobolLine.newCobolLine(sequenceArea, indicatorArea, contentAreaA, contentAreaB, commentArea,
					params.getFormat(), params.getDialect(), lineNumber, type)

        return result
