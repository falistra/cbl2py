import antlr4.CommonTokenStream

from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.preprocessor.CobolDocumentContext import CobolDocumentContext
from cbl2py.asg.util.StringBuffer import StringBuffer
from cbl2py.asg.util.Scanner import Scanner

class CobolDocumentParserListener:

    def __init__(self, params : CobolParserParams, tokens: antlr4.CommonTokenStream):
        self.contexts : list[CobolDocumentContext] = []
        self.params : CobolParserParams = params
        self.tokens = tokens
        self.contexts.append(CobolDocumentContext())

    def buildLines(self, text : str, linePrefix : str) -> str:
        sb : StringBuffer = StringBuffer()
        sb.append(text)
        scanner : Scanner = Scanner(source=text,delim='\n')
        firstLine :bool = True

        # while (scanner.hasNextLine()):

