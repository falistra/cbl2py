import codecs
from cbl2py.asg.params.CobolDialect import CobolDialect
from cbl2py.preprocessor.CobolSourceFormatEnum import CobolSourceFormatEnum

class CobolParserParams() :
    charset = codecs.utf_8_decode # StandardCharsets.UTF_8
    copyBookDirectories : list # list<File> 
    copyBookExtensions : list # list<String> 
    copyBookFiles : list # list<File> 
    dialect: CobolDialect
    format : CobolSourceFormatEnum
    ignoreSyntaxErrors : bool 

    def getCharset(self) :
        return self.charset

    def getCopyBookDirectories(self) :
        return self.copyBookDirectories
    
    def getCopyBookExtensions(self) :
        return self.copyBookExtensions


    def getCopyBookFiles(self) :
        return self.copyBookFiles
        
    def getDialect(self) :
        return self.dialect

    def getFormat(self) :
        return self.format

    def getIgnoreSyntaxErrors(self) :
        return self.ignoreSyntaxErrors

    def setCharset(self, charset) :
        self.charset = charset

    def setCopyBookDirectories(self,copyBookDirectories) :
        self.copyBookDirectories = copyBookDirectories

    def setCopyBookExtensions(self,copyBookExtensions) :
        self.copyBookExtensions = copyBookExtensions

    def setCopyBookFiles(self, copyBookFiles):
        self.copyBookFiles = copyBookFiles

    def setDialect(self, dialect) :
        self.dialect = dialect
	
    def setFormat(self, format) :
        self.format = format

    def setIgnoreSyntaxErrors(self, ignoreSyntaxErrors) :
        self.ignoreSyntaxErrors = ignoreSyntaxErrors
	

