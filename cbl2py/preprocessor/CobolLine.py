from cbl2py.asg.params.CobolDialect import CobolDialect
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens
from cbl2py.preprocessor.CobolSourceFormatEnum import CobolSourceFormatEnum
from cbl2py.preprocessor.CobolLineTypeEnum import CobolLineTypeEnum
import string

class CobolLine():

    @classmethod
    def extractContentAreaA(contentArea: string) :
        return contentArea.substring(0, 4) if len(contentArea) > 4 else contentArea

    @classmethod
    def extractContentAreaB(contentArea: string) :
        return contentArea.substring(0, 4) if len(contentArea) > 4 else ""

    @classmethod
    def copyCobolLineWithContentArea(contentArea: string, line) :
        return CobolLine( 
            line.sequenceArea, 
            line.sequenceAreaOriginal, 
            line.indicatorArea,
			line.indicatorAreaOriginal, 
            CobolLine.extractContentAreaA(contentArea), 
            line.contentAreaAOriginal,
			CobolLine.extractContentAreaB(contentArea), 
            line.contentAreaBOriginal, 
            line.commentArea, 
            line.commentAreaOriginal,
			line.format, 
            line.dialect, 
            line.number, 
            line.type, 
            line.predecessor, 
            line.successor)

    @classmethod
    def copyCobolLineWithIndicatorAndContentArea(indicatorArea : string, contentArea: string, line):
            return CobolLine(
                line.sequenceArea, 
                line.sequenceAreaOriginal, 
                indicatorArea, 
                line.indicatorAreaOriginal,
				CobolLine.extractContentAreaA(contentArea), 
                line.contentAreaAOriginal, 
                CobolLine.extractContentAreaB(contentArea),
				line.contentAreaBOriginal,
                line.commentArea, 
                line.commentAreaOriginal, 
                line.format, 
                line.dialect,
				line.number, 
                line.type, 
                line.predecessor, 
                line.successor)

    @classmethod
    def copyCobolLineWithIndicatorArea(indicatorArea : string, contentArea: string, line):
            return CobolLine(
                line.sequenceArea, 
                line.sequenceAreaOriginal, 
                indicatorArea, 
                line.indicatorAreaOriginal,
				line.contentAreaA, 
                line.contentAreaAOriginal, 
                line.contentAreaB, 
                line.contentAreaBOriginal,
				line.commentArea, 
                line.commentAreaOriginal, 
                line.format, 
                line.dialect, 
                line.number, 
                line.type,
				line.predecessor, 
                line.successor)

    @classmethod
    def createBlankSequenceArea(format : CobolSourceFormatEnum):
        return "" if format is CobolSourceFormatEnum.TANDEM else CobolPreprocessorTokens.WS*6

    @classmethod
    def extractContentAreaA(contentArea: string):
        return contentArea.substring(0, 4) if len(contentArea) > 4 else contentArea

    @classmethod
    def extractContentAreaB(contentArea: string):
        return contentArea.substring(0, 4) if len(contentArea) > 4 else ""

    @classmethod
    def newCobolLine(self,sequenceArea, indicatorArea, contentAreaA, contentAreaB, commentArea,
			format, 
            dialect, 
            lineNumber, 
            type):
        return  CobolLine(
            sequenceArea, sequenceArea, 
            indicatorArea, indicatorArea, 
            contentAreaA, contentAreaA,
			contentAreaB, contentAreaB, 
            commentArea, commentArea, 
            format, dialect, 
            lineNumber, type, None, None)

    commentArea : string
    commentAreaOriginal : string 
    contentAreaA : string
    contentAreaAOriginal : string
    contentAreaB : string
    contentAreaBOriginal : string
    dialect : CobolDialect 
    format : CobolSourceFormatEnum
    indicatorArea : string
    indicatorAreaOriginal : string
    number : int
    # predecessor 
    sequenceArea : string
    sequenceAreaOriginal : string
    # successor 
    type : CobolLineTypeEnum 

    def __init__(self,
        sequenceArea: string, 
        sequenceAreaOriginal: string, 
        indicatorArea: string,
        indicatorAreaOriginal: string,
        contentAreaA: string,
        contentAreaAOriginal: string,
        contentAreaB: string,
        contentAreaBOriginal: string,
        commentArea: string,
        commentAreaOriginal: string,
        format: CobolSourceFormatEnum,
        dialect: CobolDialect,
		number: int,
        type: CobolLineTypeEnum,
        predecessor,
        successor):

        self.sequenceArea = sequenceArea
        self.indicatorArea = indicatorArea
        self.contentAreaA = contentAreaA
        self.contentAreaB = contentAreaB
        self.commentArea = commentArea

        self.sequenceAreaOriginal = sequenceAreaOriginal
        self.indicatorAreaOriginal = indicatorAreaOriginal
        self.contentAreaAOriginal = contentAreaAOriginal
        self.contentAreaBOriginal = contentAreaBOriginal
        self.commentAreaOriginal = commentAreaOriginal

        self.format = format
        self.dialect = dialect
        self.number = number
        self.type = type

        self.setPredecessor(predecessor)
        self.setSuccessor(successor)

    def getBlankSequenceArea(self) :
        return self.createBlankSequenceArea(self.format)

    def getCommentArea(self):
        return self.commentArea


    def  getCommentAreaOriginal(self):
        return self.commentAreaOriginal

    def  getContentArea(self):
        return self.contentAreaA + self.contentAreaB

    def  getContentAreaA(self):
        return self.contentAreaA

    def  getContentAreaAOriginal(self):
        return self.contentAreaAOriginal

    def  getContentAreaB(self):
        return self.contentAreaB

    def  getContentAreaBOriginal(self):
        return self.contentAreaBOriginal

    def getContentAreaOriginal(self) :
        return self.contentAreaAOriginal + self.contentAreaBOriginal

    def getDialect(self) :
        return self.dialect

    def getFormat(self) -> CobolSourceFormatEnum:
        return self.format

    def getIndicatorArea(self) :
        return self.indicatorArea

    def getIndicatorAreaOriginal(self) :
        return self.indicatorAreaOriginal

    def getNumber(self):
        return self.number

    def getPredecessor(self) :
        return self.predecessor

    def getSequenceArea(self):
        return self.sequenceArea

    def getSequenceAreaOriginal(self):
        return self.sequenceAreaOriginal

    def getSuccessor(self):
        return self.successor

    def getType(self) -> CobolLineTypeEnum:
        return self.type

    def serialize(self) -> string :
        return self.sequenceArea + self.indicatorArea + self.contentAreaA + self.contentAreaB + self.commentArea

    def setPredecessor(self, predecessor) :
        self.predecessor = predecessor
        if (not self.predecessor == None) :
            self.predecessor.successor = self

    def setSuccessor(self, successor) :
        self.successor = successor
        if (not self.successor == None):
            self.successor.predecessor = self

    def __str__(self):
        return self.serialize()