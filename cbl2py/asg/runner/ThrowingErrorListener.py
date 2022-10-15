import antlr4.error.ErrorListener as ErrorListener

class ThrowingErrorListener(ErrorListener):

    # import io.proleap.cobol.asg.exception.CobolParserException;
	# @Override
	# public void syntaxError(final Recognizer<?, ?> recognizer, final Object offendingSymbol, final int line,
	# 		final int charPositionInLine, final String msg, final RecognitionException e) {
	# 	throw new CobolParserException("syntax error in line " + line + ":" + charPositionInLine + " " + msg);
	# }

    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        pass
