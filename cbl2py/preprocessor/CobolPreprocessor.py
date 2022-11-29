import typing
import logging
LOG = logging.getLogger()

from antlr4 import *

from antlr4.BufferedTokenStream import BufferedTokenStream

from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser
from cbl2py.antlr4.CobolPreprocessorListener import CobolPreprocessorListener
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens
from cbl2py.preprocessor.document.CobolDocumentContext import CobolDocumentContext
from cbl2py.preprocessor.CobolLine import CobolLine

from cbl2py.preprocessor.copybook.CobolWordCopyBookFinder import CobolWordCopyBookFinder
from cbl2py.preprocessor.copybook.FilenameCopyBookFinder import FilenameCopyBookFinder
from cbl2py.preprocessor.copybook.LiteralCopyBookFinder import LiteralCopyBookFinder

from cbl2py.preprocessor.util.TokenUtils import TokenUtils

from cbl2py.asg.util.StringBuffer import StringBuffer
from cbl2py.asg.util.Scanner import Scanner
from cbl2py.asg.params.CobolParserParams import CobolParserParams

class CobolDocumentParserListener(CobolPreprocessorListener):

    def __init__(self, *args, **kwargs):
        self.params : CobolParserParams = kwargs["params"] # params
        self.tokens : BufferedTokenStream = kwargs["tokens"] # tokens  
        self.contexts : list[CobolDocumentContext] = []
        self.sqlVars : int = 0
        self.push()      
        super(CobolPreprocessorListener, self).__init__()

    def buildLines(self, text: str, linePrefix: str):
        lines = text.split('\n')
        outlines = []
        for line in lines:
            trimmedLine : str = line.strip()
            prefixedLine : str = linePrefix + CobolPreprocessorTokens.WS + trimmedLine
            suffixedLine : str = prefixedLine.replace("(?i)(end-exec)", "$1 " + CobolPreprocessorTokens.EXEC_END_TAG)
            outlines.append(suffixedLine)
        return '\n'.join(outlines)

    # def buildLinesZ(self, text: str, linePrefix: str):
    #     sb : StringBuffer = StringBuffer()
    #     scanner : Scanner = Scanner(source=text)

    #     firstLine : bool = True
    #     line = scanner.next_line()
        
    #     while ( line ):
    #         if not firstLine:
    #             sb.append(CobolPreprocessorTokens.NEWLINE)
            
    #         trimmedLine : str = line.strip()
    #         prefixedLine : str = linePrefix + CobolPreprocessorTokens.WS + trimmedLine
    #         suffixedLine : str = prefixedLine.replace("(?i)(end-exec)", "$1 " + CobolPreprocessorTokens.EXEC_END_TAG)

    #         sb.append(suffixedLine)
    #         firstLine = False
    #         line = scanner.next_line()

    #     return sb.toString()

    def context(self) -> CobolDocumentContext:
        if self.contexts:
                return self.contexts[-1]    # this will get the last element of stack
        else:
            return None

    def createCobolWordCopyBookFinder(self): 
        return CobolWordCopyBookFinder()

    def createFilenameCopyBookFinder(self): 
        return FilenameCopyBookFinder()

    def createLiteralCopyBookFinder(self): 
        return LiteralCopyBookFinder()

    def enterCompilerOptions(self,ctx: CobolPreprocessorParser.CompilerOptionsContext ):
        self.push()

    def enterCopyStatement(self,ctx: CobolPreprocessorParser.CopyStatementContext ):
        self.push()

    def enterEjectStatement(self,ctx: CobolPreprocessorParser.EjectStatementContext ):
        self.push()

    def enterExecCicsStatement(self,ctx: CobolPreprocessorParser.ExecCicsStatementContext ):
        # push a new context for SQL terminals
        self.push()

    def enterExecSqlImsStatement(self,ctx: CobolPreprocessorParser.ExecSqlImsStatementContext ):
        # push a new context for SQL IMS terminals
        self.push()

    def enterExecSqlStatement(self,ctx: CobolPreprocessorParser.ExecSqlStatementContext ):
        # push a new context for SQL IMS terminals
        self.push()


    def enterReplaceArea(self,ctx: CobolPreprocessorParser.ReplaceAreaContext ):
        self.push()

    def enterReplaceByStatement(self,ctx: CobolPreprocessorParser.ReplaceByStatementContext ):
        self.push()

    def enterReplaceOffStatement(self,ctx: CobolPreprocessorParser.ReplaceOffStatementContext ):
        self.push()

    def enterSkipStatement(self,ctx: CobolPreprocessorParser.SkipStatementContext):
        self.push()

    def enterTitleStatement(self,ctx: CobolPreprocessorParser.TitleStatementContext):
        self.push()

    def exitCompilerOptions(self,ctx: CobolPreprocessorParser.CompilerOptionsContext):
        self.pop()


    def exitCopyStatement(self,ctx: CobolPreprocessorParser.CopyStatementContext):
        self.pop()
        self.push()

        replacingPhraseList : CobolPreprocessorParser.ReplacingPhraseContext = ctx.replacingPhrase()
        for replacingPhrase in replacingPhraseList: 
            self.context().storeReplaceablesAndReplacements(replacingPhrase.replaceClause())
            replacingPhrase = ctx.replacingPhrase()
        # 	/*
        # 	 * copy the copy book
        # 	 */
        copySource : CobolPreprocessorParser.CopySourceContext = ctx.copySource()
        copyBookContent : str = self.getCopyBookContent(copySource, self.params)
        if (copyBookContent) :
            self.context().write(copyBookContent + CobolPreprocessorTokens.NEWLINE)
            self.context().replaceReplaceablesByReplacements(self.tokens)

        content : str = self.context().read()
        self.pop()
        self.context().write(content)

    def exitEjectStatement(self, ctx: CobolPreprocessorParser.EjectStatementContext) :
        self.pop()

    def exitExecCicsStatement(self, ctx: CobolPreprocessorParser.ExecCicsStatementContext ) :
        # throw away EXEC CICS terminals
        self.pop()

        # a new context for the CICS statement
        self.push()

        # 	/*
        # 	 * text
        # 	 */

        text : str = TokenUtils.getTextIncludingHiddenTokens(ctx, self.tokens)
        linePrefix : str = CobolLine.createBlankSequenceArea(self.params.getFormat()) + CobolPreprocessorTokens.EXEC_CICS_TAG
        lines : str  = self.buildLines(text, linePrefix)

        self.context().write(lines)
        content = self.context().read()
        self.pop()
        self.context().write(content)

    def exitExecSqlImsStatement(self, ctx: CobolPreprocessorParser.ExecSqlImsStatementContext):
        # throw away EXEC SQLIMS terminals
        self.pop()
        # a new context for the SQLIMS statement
        self.push()
        text : str = TokenUtils.getTextIncludingHiddenTokens(ctx, self.tokens)
        linePrefix : str = CobolLine.createBlankSequenceArea(self.params.getFormat()) + CobolPreprocessorTokens.EXEC_SQLIMS_TAG;
        lines : str = self.buildLines(text, linePrefix)
        self.context().write(lines)
        content : str = self.context().read()
        self.pop()
        self.context().write(content)

    def exitExecSqlStatement(self, ctx : CobolPreprocessorParser.ExecSqlStatementContext) :
        self.pop()

        if (ctx.includeSource()):
            self.push();
            copySource : CobolPreprocessorParser.CopySourceContext = ctx.includeSource().copySource()
            copyBookContent : str = self.getCopyBookContent(copySource, self.params)
            if (copyBookContent) :
                self.context().write(copyBookContent + CobolPreprocessorTokens.NEWLINE)
                self.context().replaceReplaceablesByReplacements(self.tokens)

            content : str = self.context().read()
            self.pop()
            self.context().write(content)

        if (ctx.charDataSql()):
            # a new context for the SQL statement
            self.push()
            text : str = TokenUtils.getTextIncludingHiddenTokens(ctx, self.tokens)
            sql = text # ctx.charDataSql().getText()
            sql = sql.replace("EXEC SQL","").replace("END-EXEC","")
            textPython = f"""\n# Cobol source line :  {ctx.start.line}
SQL{self.sqlVars} = \"\"\" {sql}\"\"\""""
            self.sqlVars = self.sqlVars + 1
            self.params.getPythonSQLfile().write(textPython)
            text = f"          EXECSQL SQL{self.sqlVars}"
            self.context().write(text) # (lines)
            content = self.context().read()
            self.pop()
            self.context().write(content)

    def exitReplaceArea(self, ctx: CobolPreprocessorParser.ReplaceAreaContext):
        # 	/*
        # 	 * replacement phrase
        # 	 */
        replaceClauses : list[CobolPreprocessorParser.ReplaceClauseContext] = ctx.replaceByStatement().replaceClause()
        self.context().storeReplaceablesAndReplacements(replaceClauses)
        self.context().replaceReplaceablesByReplacements(self.tokens)

        content : str = self.context().read()
        self.pop();
        self.context().write(content);

    def exitReplaceByStatement(self, ctx: CobolPreprocessorParser.ReplaceByStatementContext) :
        self.pop()

    def exitReplaceOffStatement(self, ctx: CobolPreprocessorParser.ReplaceOffStatementContext) :
        self.pop()

    def exitSkipStatement(self, ctx: CobolPreprocessorParser.SkipStatementContext) :
        self.pop()

    def exitTitleStatement(self, ctx: CobolPreprocessorParser.TitleStatementContext) :
        self.pop()

    def findCopyBook(self, copySource : CobolPreprocessorParser.CopySourceContext, params : CobolParserParams ) :
        result : typing.IO
        if (copySource.cobolWord()) :
            result = self.createCobolWordCopyBookFinder().findCopyBook(params, copySource.cobolWord())
        elif (copySource.literal()) :
            result = self.createLiteralCopyBookFinder().findCopyBook(params, copySource.literal())
        elif (copySource.filename()) :
            result = self.createFilenameCopyBookFinder().findCopyBook(params, copySource.filename())
        else:
            LOG.warn("unknown INCLUDE reference type {}", copySource);
            result = None
        return result


    def getCopyBookContent(self, copySource : CobolPreprocessorParser.CopySourceContext, params : CobolParserParams) :
        copyBook : str = self.findCopyBook(copySource, params)
        result : str

        if (not copyBook) :
            raise Exception("CobolPreprocessorException")
            # raise CobolPreprocessorException("Could not find copy book " + copySource.getText()
            # 		+ " in directory of COBOL input file or copy books param object.");
        else :
            try:
                result = f"      *>      ===PREPROCESSOR==>COPY {copySource.getText()} START\n"
                result += CobolPreprocessor().process(copyBook, params)
                result += f"\n      *>      ===PREPROCESSOR==>COPY {copySource.getText()} END\n"
            except Exception as e:
                result = None
                LOG.warn(e.getMessage());
        return result


    def pop(self) -> CobolDocumentContext :
        # /**
        #  * Pops the current preprocessing context from the stack.
        #  */
        return self.contexts.pop()

    def push(self):
        # /**
        #  * Pushes a new preprocessing context onto the stack.
        #  */
        return self.contexts.append(CobolDocumentContext())

    def visitTerminal(self, node: TerminalNode) :
        tokPos : int  = node.getSourceInterval()[0] # .a
        self.context().write(TokenUtils.getHiddenTokensToLeft(tokPos, self.tokens))

        if (not TokenUtils.isEOF(node)) :
            text : str = node.getText()
            self.context().write(text)


# =================================================================================



# =========================================================
from antlr4 import *

from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.asg.runner.ThrowingErrorListener import ThrowingErrorListener
# from cbl2py.preprocessor.document.CobolDocumentParserListener import CobolDocumentParserListener
from cbl2py.antlr4.CobolPreprocessorLexer import CobolPreprocessorLexer
from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser

class CobolDocumentParser:

    triggers = [ "cbl", "copy", "exec sql", "exec sqlims", "exec cics", "process",
            "replace", "eject", "skip1", "skip2", "skip3", "title" ]

    def containsTrigger(self, code: str, triggers:list[str]):
        codeLowerCase : str = code.lower()
        result : bool = False

        for trigger in triggers:
            if (trigger in codeLowerCase):
                result = True
                break
        return result

    @classmethod
    def createDocumentParserListener(cls, params : CobolParserParams, tokens: CommonTokenStream) -> CobolDocumentParserListener:
        return  CobolDocumentParserListener(params=params, tokens=tokens)

    def processLines(self, code: str , params : CobolParserParams) -> str:
        requiresProcessorExecution : bool = self.containsTrigger(code, self.triggers);
        result : str
        if (requiresProcessorExecution):
            result = self.processWithParser(code, params)
        else:
            result = code
        return result

    def processWithParser(self, code : str, params : CobolParserParams) -> str:
        # run lexer        
        data =  InputStream(code)
        lexer = CobolPreprocessorLexer(data)

        if (not params.getIgnoreSyntaxErrors()):
            # register an error listener, so that preprocessing stops on errors
            lexer.removeErrorListeners()
            lexer.addErrorListener(ThrowingErrorListener())

        # get a list of matched tokens
        tokens : CommonTokenStream  = CommonTokenStream(lexer)
        parser :  CobolPreprocessorParser  = CobolPreprocessorParser(tokens);

        if (not params.getIgnoreSyntaxErrors()):
            # register an error listener, so that preprocessing stops on errors
            parser.removeErrorListeners()
            parser.addErrorListener(ThrowingErrorListener())

        startRule = parser.startRule()

        listener : CobolDocumentParserListener = CobolDocumentParser.createDocumentParserListener(params, tokens)
        walker : ParseTreeWalker = ParseTreeWalker()
        walker.walk(listener, startRule)

        result : str = listener.context().read()
        return result

# ============================================================================
import typing
from typing import TextIO

from cbl2py.preprocessor.CobolCommentEntriesMarker import CobolCommentEntriesMarker
# from cbl2py.preprocessor.document.CobolDocumentParser import CobolDocumentParser
from cbl2py.preprocessor.CobolInlineCommentEntriesNormalizer import CobolInlineCommentEntriesNormalizer
from cbl2py.preprocessor.CobolLineIndicatorProcessor import CobolLineIndicatorProcessor
from cbl2py.preprocessor.CobolLineReader import CobolLineReader
from cbl2py.preprocessor.CobolLineWriter import CobolLineWriter
from cbl2py.asg.params.CobolParserParams import CobolParserParams
from cbl2py.preprocessor.CobolLine import CobolLine


class CobolPreprocessor:

    def createCommentEntriesMarker(self) -> CobolCommentEntriesMarker:
        return  CobolCommentEntriesMarker()

    def createDocumentParser(self) -> CobolDocumentParser:
        return  CobolDocumentParser()
    
    def createInlineCommentEntriesNormalizer(self) -> CobolInlineCommentEntriesNormalizer:
        return  CobolInlineCommentEntriesNormalizer()
    
    def createLineIndicatorProcessor(self) -> CobolLineIndicatorProcessor:
        return  CobolLineIndicatorProcessor()
    
    def createLineReader(self) -> CobolLineReader:
        return  CobolLineReader()
    
    def createLineWriter(self) -> CobolLineWriter :
        return  CobolLineWriter()

    def parseDocument(self, lines : list[CobolLine] , params  : CobolParserParams) -> str:
        code = self.createLineWriter().serialize(lines)
        result = self.createDocumentParser().processLines(code, params)
        return result
 
    def process(self, source: str, params) -> str:
        lines : list[CobolLine] = self.readLines(source, params)
        rewrittenLines : list[CobolLine] = self.rewriteLines(lines)
        result : str = self.parseDocument(rewrittenLines, params)
        return result

    def readLines(self, cobolCode: str , params) -> list[CobolLine]:
        lines = self.createLineReader().processLines(cobolCode, params)
        return lines

    def rewriteLines(self,lines: list) -> list:
        # /**
        #  * Normalizes lines of given COBOL source code, so that comment entries can be
        #  * parsed and lines have a unified line format.
        #  */
        lineIndicatorProcessedLines = self.createLineIndicatorProcessor().processLines(lines)
        normalizedInlineCommentEntriesLines = self.createInlineCommentEntriesNormalizer().processLines(lineIndicatorProcessedLines)
        result = self.createCommentEntriesMarker().processLines(normalizedInlineCommentEntriesLines)
        return result

