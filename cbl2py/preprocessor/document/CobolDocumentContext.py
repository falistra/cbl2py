from cbl2py.asg.util.StringBuffer import StringBuffer
from cbl2py.preprocessor.CobolReplacementMapping import CobolReplacementMapping
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser # ReplaceClauseContext

from antlr4.BufferedTokenStream import BufferedTokenStream

class CobolDocumentContext:

    def __init__(self) -> None:
        self.currentReplaceableReplacements : list[CobolReplacementMapping] = []
        self.outputBuffer : StringBuffer = StringBuffer()

    def read(self):
        return self.outputBuffer.toString()

    # /**
    # * Replaces replaceables with replacements.
	# */

    def replaceReplaceablesByReplacements(self, tokens:  BufferedTokenStream ) -> None :
        if not (self.currentReplaceableReplacements == None):
            # TODO LIST
            # self.currentReplaceableReplacements.sort()

            for replaceableReplacement in self.currentReplaceableReplacements :
                currentOutput : str = self.outputBuffer.toString()
                
                # TODO !!!!
                # replacedOutput = replaceableReplacement.replace(currentOutput, tokens)
                replacedOutput = ""
                
                
                
                self.outputBuffer =  StringBuffer()
                self.outputBuffer.append(replacedOutput)

    def storeReplaceablesAndReplacements(self, replaceClauses : list[CobolPreprocessorParser.ReplaceClauseContext] ) :
        if (replaceClauses == None):
            self.currentReplaceableReplacements = None
        else:
            self.currentReplaceableReplacements = []

            for  replaceClause in replaceClauses :
                replaceableReplacement = CobolReplacementMapping()
                replaceableReplacement.replaceable = replaceClause.replaceable()
                replaceableReplacement.replacement = replaceClause.replacement()
                self.currentReplaceableReplacements.append(replaceableReplacement)

    def write(self,text : str) -> None:
        self.outputBuffer.append(text)

