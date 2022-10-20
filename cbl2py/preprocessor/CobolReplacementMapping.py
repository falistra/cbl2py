from antlr4 import BufferedTokenStream
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser 


# from cbl2py.preprocessor.TokenUtils import TokenUtils

from antlr4 import Token

from antlr4 import ParseTreeWalker
from antlr4 import TerminalNode
from antlr4 import BufferedTokenStream

from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
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

class CobolReplacementMapping:
    
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


    def __init__(self):
        self.replaceable : CobolPreprocessorParser.ReplaceableContext
        self.replacement : CobolPreprocessorParser.ReplacementContext

    def compareTo(self, o ):
        return o.replaceable.getText().length() - self.replaceable.getText().length()

    def extractPseudoText(self, pseudoTextCtx : CobolPreprocessorParser.PseudoTextContext, tokens : BufferedTokenStream):
        pseudoText : str=  TokenUtils.getTextIncludingHiddenTokens(pseudoTextCtx,tokens).trim()
        content : str = pseudoText.replace("^==", "").replace("==$", "").trim()
        return content

	# /**
	#  * Whitespace in Cobol replaceables matches line breaks. Hence, the replaceable
	#  * search str has to be enhanced to a regex, which is returned by this
	#  * function.
	#  */

    def getRegexFromReplaceable(self, replaceable : str):
        result : str
        if (replaceable == None):
            result = None
        else :
            parts : list[str] = replaceable.split() # The str.split() method without an argument splits on whitespace
            regexParts : list[str]
            regexSeparator = "[\\r\\n\\s]+"

            for part in parts:
                regexParts.append(part) #  Pattern.quote(part)
            
            result = regexSeparator.join(regexParts)
        return result



