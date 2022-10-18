from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens

import typing
import re

class CobolSourceFormatEnum():

	FIXED = "(.{0,6})(?:" + CobolPreprocessorTokens.INDICATOR_FIELD + "(.{0,4})(.{0,61})(.*))?"
	TANDEM = "()(?:" + CobolPreprocessorTokens.INDICATOR_FIELD + "(.{0,4})(.*)())?"
	VARIABLE = "(.{0,6})(?:" + CobolPreprocessorTokens.INDICATOR_FIELD + "(.{0,4})(.*)())?"

	def __init__(self, regex: str, commentEntryMultiLine: bool):
		self.regex = regex
		self.pattern : typing.Pattern = re.compile(self.regex)
		self.commentEntryMultiLine = commentEntryMultiLine

	def getPattern(self) -> typing.Pattern :
		return self.pattern

	def getRegex(self) :
		return self.regex;

	def isCommentEntryMultiLine(self) :
		return self.commentEntryMultiLine