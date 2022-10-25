from ast import Str
from antlr4 import *
import cbl2py


from cbl2py.antlr4.CobolPreprocessorParser import CobolPreprocessorParser
from cbl2py.antlr4.CobolPreprocessorListener import CobolPreprocessorListener
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens
from cbl2py.preprocessor.CobolDocumentContext import CobolDocumentContext
from cbl2py.asg.util.StringBuffer import StringBuffer
from cbl2py.asg.util.Scanner import Scanner

class ListenerImplementation(CobolPreprocessorListener):

	def __init__(self, *args, **kwargs):
		self.params = kwargs["params"] # params
		self.tokens = kwargs["tokens"] # tokens  
		self.contexts = []
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


# ===========================================================
# ===========================================================
# ===========================================================
# ===========================================================



	def context(self):
	# @Override
	# public CobolDocumentContext context() {
	# 	return contexts.peek();
	# }
		return self.context[-1]
	# protected CobolWordCopyBookFinder createCobolWordCopyBookFinder() {
	# 	return new CobolWordCopyBookFinderImpl();
	# }

	# protected FilenameCopyBookFinder createFilenameCopyBookFinder() {
	# 	return new FilenameCopyBookFinderImpl();
	# }

	# protected LiteralCopyBookFinder createLiteralCopyBookFinder() {
	# 	return new LiteralCopyBookFinderImpl();
	# }

	def enterCompilerOptions(self,ctx: CobolPreprocessorParser.CompilerOptionsContext ):
	# @Override
	# public void enterCompilerOptions(final CobolPreprocessorParser.CompilerOptionsContext ctx) {
	# 	// push a new context for COMPILER OPTIONS terminals
	# 	push();
	# }
		self.push()

	def enterCopyStatement(self,ctx: CobolPreprocessorParser.CopyStatementContext ):
	# @Override
	# public void enterCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {
	# 	// push a new context for COPY terminals
	# 	push();
	# }
		self.push()

	def enterEjectStatement(self,ctx: CobolPreprocessorParser.EjectStatementContext ):
	# @Override
	# public void enterEjectStatement(final CobolPreprocessorParser.EjectStatementContext ctx) {
	# 	push();
	# }
		self.push()

	# @Override
	# public void enterExecCicsStatement(final CobolPreprocessorParser.ExecCicsStatementContext ctx) {
	# 	// push a new context for SQL terminals
	# 	push();
	# }

	# @Override
	# public void enterExecSqlImsStatement(final CobolPreprocessorParser.ExecSqlImsStatementContext ctx) {
	# 	// push a new context for SQL IMS terminals
	# 	push();
	# }

	# @Override
	# public void enterExecSqlStatement(final CobolPreprocessorParser.ExecSqlStatementContext ctx) {
	# 	// push a new context for SQL terminals
	# 	push();
	# }

	# @Override
	# public void enterReplaceArea(final CobolPreprocessorParser.ReplaceAreaContext ctx) {
	# 	push();
	# }

	# @Override
	# public void enterReplaceByStatement(final CobolPreprocessorParser.ReplaceByStatementContext ctx) {
	# 	push();
	# }

	# @Override
	# public void enterReplaceOffStatement(final CobolPreprocessorParser.ReplaceOffStatementContext ctx) {
	# 	push();
	# }

	# @Override
	# public void enterSkipStatement(final CobolPreprocessorParser.SkipStatementContext ctx) {
	# 	push();
	# }

	# @Override
	# public void enterTitleStatement(final CobolPreprocessorParser.TitleStatementContext ctx) {
	# 	push();
	# }

	# @Override
	# public void exitCompilerOptions(final CobolPreprocessorParser.CompilerOptionsContext ctx) {
	# 	// throw away COMPILER OPTIONS terminals
	# 	pop();
	# }

	# @Override
	# public void exitCopyStatement(final CobolPreprocessorParser.CopyStatementContext ctx) {
	# 	// throw away COPY terminals
	# 	pop();

	# 	// a new context for the copy book content
	# 	push();

	# 	/*
	# 	 * replacement phrase
	# 	 */
	# 	for (final ReplacingPhraseContext replacingPhrase : ctx.replacingPhrase()) {
	# 		context().storeReplaceablesAndReplacements(replacingPhrase.replaceClause());
	# 	}

	# 	/*
	# 	 * copy the copy book
	# 	 */
	# 	final CopySourceContext copySource = ctx.copySource();
	# 	final String copyBookContent = getCopyBookContent(copySource, params);

	# 	if (copyBookContent != null) {
	# 		context().write(copyBookContent + CobolPreprocessor.NEWLINE);
	# 		context().replaceReplaceablesByReplacements(tokens);
	# 	}

	# 	final String content = context().read();
	# 	pop();

	# 	context().write(content);
	# }

	# @Override
	# public void exitEjectStatement(final CobolPreprocessorParser.EjectStatementContext ctx) {
	# 	// throw away eject statement
	# 	pop();
	# }

	# @Override
	# public void exitExecCicsStatement(final CobolPreprocessorParser.ExecCicsStatementContext ctx) {
	# 	// throw away EXEC CICS terminals
	# 	pop();

	# 	// a new context for the CICS statement
	# 	push();

	# 	/*
	# 	 * text
	# 	 */
	# 	final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
	# 	final String linePrefix = CobolLine.createBlankSequenceArea(params.getFormat())
	# 			+ CobolPreprocessor.EXEC_CICS_TAG;
	# 	final String lines = buildLines(text, linePrefix);

	# 	context().write(lines);

	# 	final String content = context().read();
	# 	pop();

	# 	context().write(content);
	# }

	# @Override
	# public void exitExecSqlImsStatement(final CobolPreprocessorParser.ExecSqlImsStatementContext ctx) {
	# 	// throw away EXEC SQLIMS terminals
	# 	pop();

	# 	// a new context for the SQLIMS statement
	# 	push();

	# 	/*
	# 	 * text
	# 	 */
	# 	final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
	# 	final String linePrefix = CobolLine.createBlankSequenceArea(params.getFormat())
	# 			+ CobolPreprocessor.EXEC_SQLIMS_TAG;
	# 	final String lines = buildLines(text, linePrefix);

	# 	context().write(lines);

	# 	final String content = context().read();
	# 	pop();

	# 	context().write(content);
	# }

	# @Override
	# public void exitExecSqlStatement(final CobolPreprocessorParser.ExecSqlStatementContext ctx) {
	# 	// throw away EXEC SQL terminals
	# 	pop();

	# 	// a new context for the SQL statement
	# 	push();

	# 	/*
	# 	 * text
	# 	 */
	# 	final String text = TokenUtils.getTextIncludingHiddenTokens(ctx, tokens);
	# 	final String linePrefix = CobolLine.createBlankSequenceArea(params.getFormat())
	# 			+ CobolPreprocessor.EXEC_SQL_TAG;
	# 	final String lines = buildLines(text, linePrefix);

	# 	context().write(lines);

	# 	final String content = context().read();
	# 	pop();

	# 	context().write(content);
	# }

	# @Override
	# public void exitReplaceArea(final CobolPreprocessorParser.ReplaceAreaContext ctx) {
	# 	/*
	# 	 * replacement phrase
	# 	 */
	# 	final List<ReplaceClauseContext> replaceClauses = ctx.replaceByStatement().replaceClause();
	# 	context().storeReplaceablesAndReplacements(replaceClauses);

	# 	context().replaceReplaceablesByReplacements(tokens);
	# 	final String content = context().read();

	# 	pop();
	# 	context().write(content);
	# }

	# @Override
	# public void exitReplaceByStatement(final CobolPreprocessorParser.ReplaceByStatementContext ctx) {
	# 	// throw away terminals
	# 	pop();
	# }

	# @Override
	# public void exitReplaceOffStatement(final CobolPreprocessorParser.ReplaceOffStatementContext ctx) {
	# 	// throw away REPLACE OFF terminals
	# 	pop();
	# }

	# @Override
	# public void exitSkipStatement(final CobolPreprocessorParser.SkipStatementContext ctx) {
	# 	// throw away skip statement
	# 	pop();
	# }

	# @Override
	# public void exitTitleStatement(final CobolPreprocessorParser.TitleStatementContext ctx) {
	# 	// throw away title statement
	# 	pop();
	# }

	# protected File findCopyBook(final CopySourceContext copySource, final CobolParserParams params) {
	# 	final File result;

	# 	if (copySource.cobolWord() != null) {
	# 		result = createCobolWordCopyBookFinder().findCopyBook(params, copySource.cobolWord());
	# 	} else if (copySource.literal() != null) {
	# 		result = createLiteralCopyBookFinder().findCopyBook(params, copySource.literal());
	# 	} else if (copySource.filename() != null) {
	# 		result = createFilenameCopyBookFinder().findCopyBook(params, copySource.filename());
	# 	} else {
	# 		LOG.warn("unknown copy book reference type {}", copySource);
	# 		result = null;
	# 	}

	# 	return result;
	# }

	# protected String getCopyBookContent(final CopySourceContext copySource, final CobolParserParams params) {
	# 	final File copyBook = findCopyBook(copySource, params);
	# 	String result;

	# 	if (copyBook == null) {
	# 		throw new CobolPreprocessorException("Could not find copy book " + copySource.getText()
	# 				+ " in directory of COBOL input file or copy books param object.");
	# 	} else {
	# 		try {
	# 			result = new CobolPreprocessorImpl().process(copyBook, params);
	# 		} catch (final IOException e) {
	# 			result = null;
	# 			LOG.warn(e.getMessage());
	# 		}
	# 	}

	# 	return result;
	# }


	def pop(self):
	# /**
	#  * Pops the current preprocessing context from the stack.
	#  */
	# protected CobolDocumentContext pop() {
	# 	return contexts.pop();
	# }
		return self.contexts.pop()

	def push(self):
	# /**
	#  * Pushes a new preprocessing context onto the stack.
	#  */
	# protected CobolDocumentContext push() {
	# 	return contexts.push(new CobolDocumentContext());
	# }
		return self.contexts # .append(CobolDocumentContext())

	# @Override
	# public void visitTerminal(final TerminalNode node) {
	# 	final int tokPos = node.getSourceInterval().a;
	# 	context().write(TokenUtils.getHiddenTokensToLeft(tokPos, tokens));

	# 	if (!TokenUtils.isEOF(node)) {
	# 		final String text = node.getText();
	# 		context().write(text);
	# 	}
	# }

	def enterCopySource(self, ctx:CobolPreprocessorParser.CopySourceContext):
		print('OK!')

