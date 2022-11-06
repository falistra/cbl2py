from antlr4 import *
from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor
from cbl2py.asg.params.CobolParserParams import CobolParserParams

from cbl2py.antlr4.CobolLexer import CobolLexer
from cbl2py.antlr4.CobolParser import CobolParser
from cbl2py.transpiler.listerners.interpreter import Interpreter
from cbl2py.transpiler.listerners.batchcode import Batch

def Main(cobolfilename,copybookdirectory,pythonfilename):
    with open(cobolfilename, encoding='utf8') as cobolCodeFile:
        cobolCode : str = cobolCodeFile.read()    
        cobolPreprocessor= CobolPreprocessor()
        params = CobolParserParams()
        params.setCopyBookDirectories([copybookdirectory])
        outPreProcessor : str = cobolPreprocessor.process(cobolCode,params)
        # lexer
        data = InputStream(outPreProcessor)
        lexer = CobolLexer(data)
        stream = CommonTokenStream(lexer)
        # parser
        parser = CobolParser(stream)
        tree = parser.startRule()

        mycobollistener = Batch(pythonfilename = pythonfilename) # Interpreter()
        walker = ParseTreeWalker()
        walker.walk(mycobollistener, tree)