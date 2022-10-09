FILE_TEST_NAME = './tests/cobol/ASSSVSRT.cbl'

from antlr4 import *
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

from cbl2py.preprocessor.ListenerImplementation import ListenerImplementation

def test_visitor_no_operation():
    with open(FILE_TEST_NAME, encoding='utf8') as cobolCodeFile:
        cobolCode = cobolCodeFile.read()
        data =  InputStream(cobolCode)
        # lexer
        lexer = CobolPreprocessorLexer(data)
        stream = CommonTokenStream(lexer)
        # parser
        parser = CobolPreprocessorParser(stream)
        tree = parser.startRule()
        # evaluator

        preprocess = ListenerImplementation(params=[],tokens=[])
        walker = ParseTreeWalker()
        walker.walk(preprocess, tree)
