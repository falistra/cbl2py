from antlr4 import Token
from antlr4 import BufferedTokenStream
from antlr4 import TerminalNode
from cbl2py.asg.util.StringBuffer import StringBuffer

from cbl2py.preprocessor.TokenUtils import TokenUtils
from cbl2py.antlr4.CobolPreprocessorListener import CobolPreprocessorListener

class CobolHiddenTokenCollectorListener(CobolPreprocessorListener):

    def __init__(self, tokens : BufferedTokenStream):
        self.firstTerminal : bool = True
        self.outputBuffer : StringBuffer = StringBuffer()
        self.tokens : BufferedTokenStream = tokens 

    def read(self) -> str:
        return self.outputBuffer.toString()

    def visitTerminal(self, node : TerminalNode):
        if (not self.firstTerminal):
            tokPos : int = node.getSourceInterval().a
            self.outputBuffer.append(TokenUtils.getHiddenTokensToLeft(tokPos, self.tokens))
        
        if (not TokenUtils.isEOF(node)):
            text: str = node.getText()
            self.outputBuffer.append(text)
            self.firstTerminal = False