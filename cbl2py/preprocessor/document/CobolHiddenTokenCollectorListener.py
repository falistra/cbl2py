from antlr4 import *
from cbl2py.asg.util.StringBuffer import StringBuffer
from antlr4.BufferedTokenStream import BufferedTokenStream
from cbl2py.preprocessor.util.TokenUtils import TokenUtils

class CobolHiddenTokenCollectorListener:
    
    def __init__(self,tokens):
        self.firstTerminal : bool = True
        self.outputBuffer : StringBuffer = StringBuffer()
        self.tokens : BufferedTokenStream = tokens

    def read(self):
        return self.outputBuffer.toString()

    def visitTerminal(self, node : TerminalNode):
        if (not self.firstTerminal):
            tokPos : int = node.getSourceInterval().a
            self.outputBuffer.append(TokenUtils.getHiddenTokensToLeft(tokPos, self.tokens))

        if (not TokenUtils.isEOF(node)):
            text : str = node.getText()
            self.outputBuffer.append(text)

        self.firstTerminal = False

    