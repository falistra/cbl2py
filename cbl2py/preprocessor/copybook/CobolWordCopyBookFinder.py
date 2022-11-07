import os
import os.path
from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

class CobolWordCopyBookFinder:

    def findCopyBook(self, params : CobolParserParams, ctx : CobolPreprocessorParser.CobolWordContext) :
        if (params.getCopyBookFiles()) :
            for copyBookFile  in  params.getCopyBookFiles():
                if (self.isMatchingCopyBook(copyBookFile, params, ctx)):
                    return copyBookFile

        if (params.getCopyBookDirectories()) :
            for copyBookDirectory in  params.getCopyBookDirectories() :
                validCopyBook = self.findCopyBookInDirectory(copyBookDirectory, params, ctx)
                if (validCopyBook) :
                    return validCopyBook

        return None

    def findCopyBookInDirectory(self, copyBooksDirectory, params : CobolParserParams , ctx : CobolPreprocessorParser.CobolWordContext):
        for copyBookCandidate in  os.listdir(copyBooksDirectory):
            if (self.isMatchingCopyBook(copyBookCandidate, params, ctx)):
                return copyBookCandidate
        return None

    def isMatchingCopyBook(self, copyBookCandidate, params : CobolParserParams, ctx : CobolPreprocessorParser.CobolWordContext):
        copyBookIdentifier : str = ctx.getText()

        if (params.getCopyBookExtensions()) : 
            for copyBookExtension in params.getCopyBookExtensions(): 
                if (self.isMatchingCopyBookWithExtension(copyBookCandidate, copyBookIdentifier, copyBookExtension)) :
                    return True
            return False
        else :
            return self.isMatchingCopyBookWithoutExtension(copyBookCandidate, copyBookIdentifier)

    def isMatchingCopyBookWithExtension(self,copyBookCandidate, copyBookIdentifier : str, copyBookExtension : str) :
		# copyBookFilename : str = C || copyBookExtension.isEmpty() ? copyBookIdentifier
		# 		: copyBookIdentifier + "." + copyBookExtension;
		
        if (copyBookExtension == "" or copyBookExtension == None):
            copyBookFilename = copyBookIdentifier
        else:
            copyBookFilename = copyBookIdentifier + "." + copyBookExtension

        copyBookCandidateName = copyBookCandidate.getName()
        return copyBookFilename.casefold() == copyBookCandidateName.casefold()

    def isMatchingCopyBookWithoutExtension(self, copyBookCandidate, copyBookIdentifier : str):
		# final String copyBookCandidateBaseName = FilenameUtils.getBaseName(copyBookCandidate.getName());
        copyBookCandidateBaseName = os.path.basename(copyBookCandidate.getName())
        return copyBookCandidateBaseName.casefold() == copyBookIdentifier.casefold()