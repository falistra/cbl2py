import string

from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor
from cbl2py.preprocessor.CobolLine import CobolLine
from cbl2py.preprocessor.CobolLineTypeEnum import CobolLineTypeEnum
from cbl2py.asg.util.StringBuffer import StringBuffer

class CobolLineWriter:

    def serialize(self, lines: list[CobolLine]) -> string:
        sb : StringBuffer = StringBuffer()

        line : CobolLine 
        for line in lines:
            notContinuationLine : bool = not CobolLineTypeEnum.CONTINUATION.equals(line.getType())

        if (notContinuationLine) :
            if (line.getNumber() > 0) :
                sb.append(CobolPreprocessor.NEWLINE)

            sb.append(line.getBlankSequenceArea())
            sb.append(line.getIndicatorArea())

        sb.append(line.getContentArea())

        return sb.toString()
