FILE_TEST_NAME = "./tests/HelloWorld.cbl" # './tests/cobol/ASSSVSRT.cbl'

from antlr4 import *
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

from cbl2py.preprocessor.ListenerImplementation import ListenerImplementation
from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor
from cbl2py.asg.params.CobolParserParams import CobolParserParams

# def test_visitor_no_operation():
#     with open(FILE_TEST_NAME, encoding='utf8') as cobolCodeFile:
#         cobolCode = cobolCodeFile.read()
#         data =  InputStream(cobolCode)
#         # lexer
#         lexer = CobolPreprocessorLexer(data)
#         stream = CommonTokenStream(lexer)
#         # parser
#         parser = CobolPreprocessorParser(stream)
#         tree = parser.startRule()
#         # evaluator

#         preprocess = ListenerImplementation(params=[],tokens=[])
#         walker = ParseTreeWalker()
#         walker.walk(preprocess, tree)

def test_preprocessorImpl():
    with open(FILE_TEST_NAME, encoding='utf8') as cobolCodeFile:
        cobolCode = cobolCodeFile.read()    
        pp = CobolPreprocessor()
        params = CobolParserParams()
        params.setCopyBookDirectories(['./tests/cobol/cpy/'])
        out = pp.process(cobolCode,params)
        print(out)
