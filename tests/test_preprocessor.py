FILE_TEST_NAME = "./tests/cobol/HelloWorld.cbl" # './tests/cobol/ASSSVSRT.cbl'
# FILE_TEST_NAME = "./tests/cobol/HelloWorld.cbl" # './tests/cobol/ASSSVSRT.cbl'
FILE_OUT_PY = "./tests/python/HelloWorld.cbl" # './tests/cobol/ASSSVSRT.cbl'
COBOL_COPY_DIR = "./tests/cobol/cpy"

# from antlr4 import *
# from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
# from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

# from cbl2py.preprocessor.document.CobolDocumentParserListener import ListenerImplementation
# from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor
# from cbl2py.asg.params.CobolParserParams import CobolParserParams

# from cbl2py.antlr4.CobolLexer import CobolLexer
# from cbl2py.antlr4.CobolParser import CobolParser
# from cbl2py.antlr4.CobolListener import CobolListener

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
import logging
    
def Ztest_main():
    Main(FILE_TEST_NAME,FILE_TEST_NAME,FILE_OUT_PY)

from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor
from cbl2py.asg.params.CobolParserParams import CobolParserParams

def Ztest_preprocessor():
    logging.debug("======TEST PREPROCESSOR======")
        
    with open(FILE_TEST_NAME, encoding='utf8') as cobolCodeFile:
        cobolCode : str = cobolCodeFile.read()    
        cobolPreprocessor= CobolPreprocessor()
        params = CobolParserParams()
        params.setCopyBookDirectories([COBOL_COPY_DIR])
        params.setCopyBookFiles([COBOL_COPY_DIR])
        outPreProcessor : str = cobolPreprocessor.process(cobolCode,params)
        print(outPreProcessor)