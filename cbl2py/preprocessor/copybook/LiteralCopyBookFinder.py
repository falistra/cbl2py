import os
from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

class LiteralCopyBookFinder:

    def findCopyBook(self, params : CobolParserParams, ctx:  CobolPreprocessorParser.LiteralContext) :
        if (params.getCopyBookFiles()):
            for copyBookFile in params.getCopyBookFiles():
                if (self.isMatchingCopyBook(copyBookFile, None, ctx)) :
                    return copyBookFile;

        if (params.getCopyBookDirectories()):
            for copyBookDirectory in params.getCopyBookDirectories():
                validCopyBook = self.findCopyBookInDirectory(copyBookDirectory, ctx);

                if (validCopyBook):
                    return validCopyBook
        return None

    def findCopyBookInDirectory(self, copyBooksDirectory, ctx : CobolPreprocessorParser.LiteralContext):
        try:
            for copyBookCandidate in os.listdir(copyBooksDirectory): # copyBooksDirectory.listFiles():
                if (self.isMatchingCopyBook(copyBookCandidate, copyBooksDirectory, ctx)):
                    return copyBookCandidate
        except Exception as e:
            pass
            # LOG.warn(e.getMessage(), e)
        return None
    
    def isMatchingCopyBook(self, copyBookCandidate, cobolCopyDir,  ctx : CobolPreprocessorParser.FilenameContext):
        copyBookIdentifier : str = ctx.getText().replace('"', '').replace("\\", "/")

        if (not cobolCopyDir):
            return self.isMatchingCopyBookRelative(copyBookCandidate, copyBookIdentifier)
        else :
            return self.isMatchingCopyBookAbsolute(copyBookCandidate, cobolCopyDir, copyBookIdentifier)

    def isMatchingCopyBookAbsolute(self, copyBookCandidate, cobolCopyDir, copyBookIdentifier):
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
