from antlr4 import Token

from antlr4 import ParseTreeWalker
from antlr4 import TerminalNode
from antlr4 import BufferedTokenStream

from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.preprocessor.CobolHiddenTokenCollectorListener import CobolHiddenTokenCollectorListener
from cbl2py.asg.util.StringBuffer import StringBuffer


class TokenUtils :

    @classmethod
    def getHiddenTokensToLeft(tokPos : int, tokens: BufferedTokenStream) -> str:
        refChannel : list[Token] = tokens.getHiddenTokensToLeft(tokPos, CobolPreprocessorLexer.HIDDEN)
        sb : StringBuffer = StringBuffer()

        if (not refChannel == None):
            for refToken in refChannel:
                text : str = refToken.getText()
                sb.append(text)
        return sb.toString()

    @classmethod
    def getTextIncludingHiddenTokens(ctx , tokens : BufferedTokenStream):
        listener : CobolHiddenTokenCollectorListener = CobolHiddenTokenCollectorListener(tokens)
        walker : ParseTreeWalker = ParseTreeWalker()
        walker.walk(listener, ctx)
        return listener.read()

    @classmethod
    def isEOF(node : TerminalNode):
        return Token.EOF == node.getSymbol().getType()