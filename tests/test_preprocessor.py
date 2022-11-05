FILE_TEST_NAME = "./tests/HelloWorld.cbl" # './tests/cobol/ASSSVSRT.cbl'
COBOL_COPY_DIR = "./tests/cobol/cpy/"

from antlr4 import *
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

from cbl2py.preprocessor.ListenerImplementation import ListenerImplementation
from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor
from cbl2py.asg.params.CobolParserParams import CobolParserParams

from cbl2py.antlr4.CobolLexer import CobolLexer
from cbl2py.antlr4.CobolParser import CobolParser
from cbl2py.antlr4.CobolListener import CobolListener

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


from cbl2py.main import Main

    
def test_preprocessorImpl():
    Main(FILE_TEST_NAME,FILE_TEST_NAME)
