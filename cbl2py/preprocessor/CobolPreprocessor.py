import typing
from typing import TextIO

from cbl2py.preprocessor.CobolCommentEntriesMarker import CobolCommentEntriesMarker

from cbl2py.preprocessor.CobolDocumentParser import CobolDocumentParser
from cbl2py.preprocessor.CobolInlineCommentEntriesNormalizer import CobolInlineCommentEntriesNormalizer
from cbl2py.preprocessor.CobolLineIndicatorProcessor import CobolLineIndicatorProcessor
from cbl2py.preprocessor.CobolLineReader import CobolLineReader
from cbl2py.preprocessor.CobolLineWriter import CobolLineWriter
from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.preprocessor.CobolLine import CobolLine


class CobolPreprocessor:

    def createCommentEntriesMarker(self) -> CobolCommentEntriesMarker:
        return  CobolCommentEntriesMarker()

    def createDocumentParser(self) -> CobolDocumentParser:
        return  CobolDocumentParser()
	
    def createInlineCommentEntriesNormalizer(self) -> CobolInlineCommentEntriesNormalizer:
        return  CobolInlineCommentEntriesNormalizer()
	
    def createLineIndicatorProcessor(self) -> CobolLineIndicatorProcessor:
        return  CobolLineIndicatorProcessor()
	
    def createLineReader(self) -> CobolLineReader:
        return  CobolLineReader()
	
    def createLineWriter(self) -> CobolLineWriter :
        return  CobolLineWriter()

    def parseDocument(self, lines : list[CobolLine] , params  : CobolParserParams) -> str:
        code = self.createLineWriter().serialize(lines)
        result = self.createDocumentParser().processLines(code, params)
        return result
 
    @typing.overload
    def process(self, cobolFile: TextIO, params : CobolParserParams) -> str:
        cobolFileContent : str = cobolFile.toString()
        result = self.process(cobolFileContent, params)
        return result

    @typing.overload
    def process(self, source: str, params) -> str:
        lines : list[CobolLine] = self.readLines(source, params)
        rewrittenLines : list[CobolLine] = self.rewriteLines(lines)
        result : str = self.parseDocument(rewrittenLines, params)
        return result

    def readLines(self, cobolCode: str , params) -> list:
        lines = self.createLineReader().processLines(cobolCode, params)

    def rewriteLines(self,lines: list) -> list:
        # /**
        #  * Normalizes lines of given COBOL source code, so that comment entries can be
        #  * parsed and lines have a unified line format.
        #  */
        lineIndicatorProcessedLines = self.createLineIndicatorProcessor().processLines(lines)
        normalizedInlineCommentEntriesLines = self.createInlineCommentEntriesNormalizer().processLines(lineIndicatorProcessedLines)
        result = self.createCommentEntriesMarker().processLines(normalizedInlineCommentEntriesLines)
        return result

