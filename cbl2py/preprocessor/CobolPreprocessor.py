import string
import typing
from typing import TextIO
import re

from cbl2py.preprocessor.CobolCommentEntriesMarker import CobolCommentEntriesMarker
from cbl2py.preprocessor.CobolDocumentParser import CobolDocumentParser
from cbl2py.preprocessor.CobolInlineCommentEntriesNormalizer import CobolInlineCommentEntriesNormalizer
from cbl2py.preprocessor.CobolLineIndicatorProcessor import CobolLineIndicatorProcessor
from cbl2py.preprocessor.CobolLineReader import CobolLineReader
from cbl2py.preprocessor.CobolLineWriter import CobolLineWriter

from enum import Enum

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

    def parseDocument(self, lines, params) -> string:
        code = self.createLineWriter().serialize(lines)
        result = self.createDocumentParser().processLines(code, params)
        return result
 
    @typing.overload
    def process(self, source: TextIO, params) -> string:
   		# final Charset charset = params.getCharset()

		# LOG.info("Preprocessing file {} with line format {} and charset {}.", cobolFile.getName(), params.getFormat(),
		# 		charset)

		# final String cobolFileContent = Files.readString(cobolFile.toPath(), charset)
		# final String result = process(cobolFileContent, params)
		# return result
        ...
    @typing.overload
    def process(self, source: string, params) -> string:
		# final List<CobolLine> lines = readLines(cobolCode, params)
		# final List<CobolLine> rewrittenLines = rewriteLines(lines)
		# final String result = parseDocument(rewrittenLines, params)
		# return result
        ...
    def process(self, source, params) -> string:
        return ""

    def readLines(self, cobolCode: string , params) -> list:
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

