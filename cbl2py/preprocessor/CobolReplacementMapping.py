from antlr4 import BufferedTokenStream
from cbl2py.antlr4.CobolPreprocessorParser import ReplaceableContext
from cbl2py.antlr4.CobolPreprocessorParser import ReplacementContext
from cbl2py.antlr4.CobolPreprocessorParser import PseudoTextContext

from cbl2py.preprocessor.TokenUtils import TokenUtils

class CobolReplacementMapping:
    
    def __init__(self):
        self.replaceable : ReplaceableContext
        self.replacement : ReplacementContext

    def compareTo(self, o ):
        return o.replaceable.getText().length() - self.replaceable.getText().length()

    def extractPseudoText(self, pseudoTextCtx : PseudoTextContext, tokens : BufferedTokenStream):
        pseudoText : str=  TokenUtils.getTextIncludingHiddenTokens(pseudoTextCtx,tokens).trim()
        content : str = pseudoText.replace("^==", "").replace("==$", "").trim()
        return content

	# /**
	#  * Whitespace in Cobol replaceables matches line breaks. Hence, the replaceable
	#  * search string has to be enhanced to a regex, which is returned by this
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



