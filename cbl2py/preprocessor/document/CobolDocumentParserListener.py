# from ast import Str
import typing

from antlr4 import *


from antlr4.BufferedTokenStream import BufferedTokenStream

from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser
from cbl2py.antlr4.CobolPreprocessorListener import CobolPreprocessorListener
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens
from cbl2py.preprocessor.document.CobolDocumentContext import CobolDocumentContext
from cbl2py.preprocessor.CobolLine import CobolLine
from cbl2py.preprocessor.CobolPreprocessor import CobolPreprocessor

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
		self.contexts.append( CobolDocumentContext() )      
		super(CobolPreprocessorListener, self).__init__()

	def buildLines(self, text: str, linePrefix: str):
		sb : StringBuffer = StringBuffer()
		scanner : Scanner = Scanner(source=text)

		firstLine : bool = True
		line = scanner.next_line()
		
		while ( line ):
			if not firstLine:
				sb.append(CobolPreprocessorTokens.NEWLINE)
			
			trimmedLine : str = line.strip()
			prefixedLine : str = linePrefix + CobolPreprocessorTokens.WS + trimmedLine
			suffixedLine : str = prefixedLine.replace("(?i)(end-exec)", "$1 " + CobolPreprocessorTokens.EXEC_END_TAG)

			sb.append(suffixedLine)
			firstLine = False
			line = scanner.next_line()

		return sb.toString()

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
		# throw away COPY terminals
		self.pop();

		# a new context for the copy book content
		self.push();

		# 	/*
		# 	 * replacement phrase
		# 	 */
		# 	for (final ReplacingPhraseContext replacingPhrase : ctx.replacingPhrase()) {
		# 		context().storeReplaceablesAndReplacements(replacingPhrase.replaceClause());
		# 	}

		replacingPhrase : CobolPreprocessorParser.ReplacingPhraseContext = ctx.replacingPhrase()
		while ( replacingPhrase ):
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
		self.pop();

		# a new context for the CICS statement
		self.push();

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

	def exitExecSqlStatement(self, ctx : CobolPreprocessorParser.ExecSqlStatementContext) :
		# throw away EXEC SQL terminals
		self.pop()

		# a new context for the SQL statement
		self.push()

		text : str = TokenUtils.getTextIncludingHiddenTokens(ctx, self.tokens)
		linePrefix : str = CobolLine.createBlankSequenceArea(self.params.getFormat()) + CobolPreprocessorTokens.EXEC_SQL_TAG
		lines : str  = self.buildLines(text, linePrefix)

		self.context().write(lines)
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
			# LOG.warn("unknown copy book reference type {}", copySource);
			result = None
		return result


	def getCopyBookContent(self, copySource : CobolPreprocessorParser.CopySourceContext, params : CobolParserParams) :
		copyBook : typing.IO = self.findCopyBook(copySource, params)
		result : str

		if (not copyBook) :
			raise Exception("CobolPreprocessorException")
			# raise CobolPreprocessorException("Could not find copy book " + copySource.getText()
			# 		+ " in directory of COBOL input file or copy books param object.");
		else :
			try:
				result = CobolPreprocessor().process(copyBook, params)
			except Exception as e:
				result = None
				# LOG.warn(e.getMessage());
		return result


	def pop(self):
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
		tokPos : int  = node.getSourceInterval().a
		self.context().write(TokenUtils.getHiddenTokensToLeft(tokPos, self.tokens))

		if (not TokenUtils.isEOF(node)) :
			text : str = node.getText()
			self.context().write(text)
