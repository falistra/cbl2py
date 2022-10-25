import antlr4
class ThrowingErrorListener(antlr4.error.ErrorListener.ErrorListener): # ErrorListener

    # import io.proleap.cobol.asg.exception.CobolParserException;
	# @Override
	# public void syntaxError(final Recognizer<?, ?> recognizer, final Object offendingSymbol, final int line,
	# 		final int charPositionInLine, final String msg, final RecognitionException e) {
	# 	throw new CobolParserException("syntax error in line " + line + ":" + charPositionInLine + " " + msg);
	# }

	def __init__(self):
		super(antlr4.error.ErrorListener.ErrorListener, self).__init__()

	def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
		pass
