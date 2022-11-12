from antlr4 import *
from antlr4.BufferedTokenStream import BufferedTokenStream
from antlr4.Token import Token
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.asg.util.StringBuffer import StringBuffer

# from cbl2py.preprocessor.document.CobolHiddenTokenCollectorListener import CobolHiddenTokenCollectorListener

from cbl2py.antlr4.CobolPreprocessorListener import CobolPreprocessorListener

class CobolHiddenTokenCollectorListener(CobolPreprocessorListener):
    
    def __init__(self,tokens):
        self.firstTerminal : bool = True
        self.outputBuffer : StringBuffer = StringBuffer()
        self.tokens : BufferedTokenStream = tokens

    def read(self):
        return self.outputBuffer.toString()

    def visitTerminal(self, node : TerminalNode):
        if (not self.firstTerminal):
            tokPos : int = node.getSourceInterval()[0] # .a
            self.outputBuffer.append(TokenUtils.getHiddenTokensToLeft(tokPos, self.tokens))

        if (not TokenUtils.isEOF(node)):
            text : str = node.getText()
            self.outputBuffer.append(text)

        self.firstTerminal = False


class TokenUtils:

    @classmethod
    def getHiddenTokensToLeft(cls, tokPos : int, tokens : BufferedTokenStream):
        refChannel : list[Token] = tokens.getHiddenTokensToLeft(tokPos, CobolPreprocessorLexer.HIDDEN)
        sb : StringBuffer = StringBuffer()

        if (refChannel):
            refToken : Token
            for refToken in refChannel:
                text: str = refToken.text  # getText()
                sb.append(text)
        
        return sb.toString()

    @classmethod
    def getTextIncludingHiddenTokens(cls, ctx, tokens : BufferedTokenStream):
        listener : CobolHiddenTokenCollectorListener = CobolHiddenTokenCollectorListener(tokens)
        walker : ParseTreeWalker = ParseTreeWalker()
        walker.walk(listener, ctx);

        return listener.read()

    @classmethod
    def isEOF(cls, node : TerminalNode):
        return Token.EOF == node.getSymbol().type # .getType()
