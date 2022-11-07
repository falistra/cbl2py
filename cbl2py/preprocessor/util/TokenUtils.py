from antlr4 import *
from antlr4.BufferedTokenStream import BufferedTokenStream
from antlr4.Token import Token
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.asg.util.StringBuffer import StringBuffer

from cbl2py.preprocessor.document.CobolHiddenTokenCollectorListener import CobolHiddenTokenCollectorListener

class TokenUtils:

    @classmethod
    def getHiddenTokensToLeft(tokPos : int, tokens : BufferedTokenStream):
        refChannel : list[Token] = tokens.getHiddenTokensToLeft(tokPos, CobolPreprocessorLexer.HIDDEN)
        sb : StringBuffer = StringBuffer()

        if (refChannel):
            refToken : Token
            for refToken in refChannel:
                text: str = refToken.getText()
                sb.append(text)
        
        return sb.toString()

    @classmethod
    def getTextIncludingHiddenTokens(ctx, tokens : BufferedTokenStream):
        listener : CobolHiddenTokenCollectorListener = CobolHiddenTokenCollectorListener(tokens)
        walker : ParseTreeWalker = ParseTreeWalker()
        walker.walk(listener, ctx);

        return listener.read()

    @classmethod
    def isEOF(node : TerminalNode) {
		return Token.EOF == node.getSymbol().getType()
	}