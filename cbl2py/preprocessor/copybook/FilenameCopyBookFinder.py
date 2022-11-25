import os
import os.path

import logging
LOG = logging.getLogger()

from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

class FilenameCopyBookFinder:

    def findCopyBook(self, params : CobolParserParams, ctx :  CobolPreprocessorParser.FilenameContext) :
        if (params.getCopyBookFiles()) :
            for copyBookFile in  params.getCopyBookFiles(): 
                if (self.isMatchingCopyBook(copyBookFile, None, ctx)) :
                    return copyBookFile

        if (params.getCopyBookDirectories()):
            for copyBookDirectory in params.getCopyBookDirectories():
                validCopyBook = self.findCopyBookInDirectory(copyBookDirectory,params, ctx)
                if (validCopyBook):
                    return validCopyBook
        return None

    def findCopyBookInDirectory(self, copyBooksDirectory, params : CobolParserParams , ctx : CobolPreprocessorParser.FilenameContext ):
        try:
            for copyBookCandidate in os.listdir(copyBooksDirectory): # copyBooksDirectory.listFiles():
                if (self.isMatchingCopyBook(copyBookCandidate, params, ctx)):
                    return open(os.path.join(copyBooksDirectory,copyBookCandidate)).read()
                    return copyBookCandidate
        except Exception as e:
            LOG.warn(f"{e.getMessage()}")
        return None

    def isMatchingCopyBook(self, copyBookCandidate, cobolCopyDir,  ctx : CobolPreprocessorParser.FilenameContext):
        copyBookIdentifier : str = ctx.getText()
        if (not cobolCopyDir):
            return self.isMatchingCopyBookRelative(copyBookCandidate, copyBookIdentifier)
        else :
            return self.isMatchingCopyBookAbsolute(copyBookCandidate, cobolCopyDir, copyBookIdentifier)

    def isMatchingCopyBookAbsolute(self, copyBookCandidate, cobolCopyDir, copyBookIdentifier):
        return copyBookCandidate.casefold() == copyBookIdentifier.casefold()

        copyBookCandidateAbsolutePath = os.path.abspath(copyBookCandidate)
		# final Path copyBookIdentifierAbsolutePath = Paths.get(cobolCopyDir.getAbsolutePath(), copyBookIdentifier)
        copyBookIdentifierAbsolutePath = os.path.abspath(cobolCopyDir)
        return copyBookIdentifierAbsolutePath.casefold() == copyBookCandidateAbsolutePath.casefold()
		# final boolean result = copyBookIdentifierAbsolutePath.toString()
		# 		.equalsIgnoreCase(copyBookCandidateAbsolutePath.toString());

    def isMatchingCopyBookRelative(copyBookCandidate, copyBookIdentifier) :
        copyBookCandidateAbsolutePath = os.path.abspath(copyBookCandidate)
		# final Path copyBookIdentifierRelativePath = Paths.get("/" + copyBookIdentifier).normalize();
        copyBookIdentifierRelativePath = os.path.abspath("/" + copyBookIdentifier)
        result = copyBookCandidateAbsolutePath.lower().endswith(copyBookIdentifierRelativePath.lower())
        return result
