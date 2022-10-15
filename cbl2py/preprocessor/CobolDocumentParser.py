import string
from antlr4 import *

from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.asg.runner.ThrowingErrorListener import ThrowingErrorListener
from cbl2py.preprocessor.CobolDocumentParserListener import CobolDocumentParserListener
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

class CobolDocumentParser:

    triggers = [ "cbl", "copy", "exec sql", "exec sqlims", "exec cics", "process",
            "replace", "eject", "skip1", "skip2", "skip3", "title" ]

    def containsTrigger(self, code: string, triggers:list(string)):
        codeLowerCase : string = code.lower()
        result : bool = False

        for trigger in triggers:
            if (trigger in codeLowerCase):
                result = True
                break
        return result

    @classmethod
    def createDocumentParserListener(params : CobolParserParams, tokens: CommonTokenStream) -> CobolDocumentParserListener:
        return  CobolDocumentParserListener(params, tokens)

    def processLines(self, code: string , params : CobolParserParams) -> string:
        requiresProcessorExecution : bool = self.containsTrigger(code, self.triggers);
        result : string
        if (requiresProcessorExecution):
            result = self.processWithParser(code, params)
        else:
            result = code
        return result

    def processWithParser(self, code : string, params : CobolParserParams) -> string:
        # run lexer        
        data =  InputStream(code)
        lexer = CobolPreprocessorLexer(data)


        if (not params.getIgnoreSyntaxErrors()):
		    # register an error listener, so that preprocessing stops on errors
            lexer.removeErrorListeners()
            lexer.addErrorListener(ThrowingErrorListener())

        # get a list of matched tokens
        tokens : CommonTokenStream  = CommonTokenStream(lexer)
        parser :  CobolPreprocessorParser  = CobolPreprocessorParser(tokens);

        if (not params.getIgnoreSyntaxErrors()):
		    # register an error listener, so that preprocessing stops on errors
            parser.removeErrorListeners()
            parser.addErrorListener(ThrowingErrorListener())

        startRule = parser.startRule()

        listener : CobolDocumentParserListener = CobolDocumentParser.createDocumentParserListener(params, tokens)
        walker : ParseTreeWalker = ParseTreeWalker()
        walker.walk(listener, startRule)

        result : string = listener.context().read()
        return result