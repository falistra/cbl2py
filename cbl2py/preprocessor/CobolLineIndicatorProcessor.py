from cbl2py.preprocessor.CobolLine import CobolLine
from cbl2py.preprocessor.CobolLineRewriter import CobolLineRewriter
from cbl2py.preprocessor.CobolLineTypeEnum import CobolLineTypeEnum
from cbl2py.preprocessor.CobolPreprocessorTokens import CobolPreprocessorTokens

class CobolLineIndicatorProcessor(CobolLineRewriter):
    
    EMPTY_STRING : str = ""

    def isNextLineContinuation(self,line : CobolLine ) -> bool:
        return False if (line.getSuccessor() == None) else (CobolLineTypeEnum.CONTINUATION == (line.getSuccessor().getType()))

    def trimLeadingWhitespace(self, contentarea : str) -> str:
        return contentarea.replace("^\\s+", self.EMPTY_STRING)

    def trimTrailingWhitespace(self, contentarea : str) -> str:
        return contentarea.replace("\\s+$", self.EMPTY_STRING)


    def repairTrailingComma(self, contentArea : str) -> str:
		
        result : str
		# /*
		#  * repair trimmed whitespace after comma separator
		#  */
        if contentArea == "" :
            result = contentArea
        else:
            lastCharAtTrimmedLineArea = contentArea[-1]

            if (lastCharAtTrimmedLineArea == ',' or lastCharAtTrimmedLineArea == ';') :
                result = contentArea + CobolPreprocessorTokens.WS
            else :
                result = contentArea
        return result

    def rightTrimContentArea(self,contentarea : str) -> str:
        contentAreaWithTrimmedTrailingWhitespace : str = self.trimTrailingWhitespace(contentarea)
        return self.repairTrailingComma(contentAreaWithTrimmedTrailingWhitespace)

    def removeStringLiterals(self,contentArea : str) -> str:
        doubleQuoteLiteralPattern : str= "\"([^\"]|\"\"|'')*\""
        singleQuoteLiteralPattern : str= "'([^']|''|\"\")*'"
        return contentArea\
            .replace(doubleQuoteLiteralPattern, self.EMPTY_STRING)\
            .replace(singleQuoteLiteralPattern,self.EMPTY_STRING)

    def isEndingWithOpenLiteral(self, line : CobolLine) -> bool :
        contentArea : str= line.getContentAreaOriginal()
        contentAreaWithoutStringLiterals = self.removeStringLiterals(contentArea)
        return ("\"" in contentAreaWithoutStringLiterals) or ("'" in contentAreaWithoutStringLiterals)

    def conditionalRightTrimContentArea(self, line : CobolLine) -> str:

        result : str
        
        if (not self.isNextLineContinuation(line)) :
            result = self.rightTrimContentArea(line.getContentArea())
        else:
            if ( not self.isEndingWithOpenLiteral(line)):
                result = self.rightTrimContentArea(line.getContentArea())
            else:
                result = line.getContentArea()

        return result 

    def processLine(self, line : CobolLine ) -> CobolLine:
        conditionalRightTrimmedContentArea : str= self.conditionalRightTrimContentArea(line)
        result : CobolLine

        
        lineType : CobolLineTypeEnum = line.getType()

        if (lineType ==  CobolLineTypeEnum.DEBUG) :
                result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS, conditionalRightTrimmedContentArea, line),
        elif (lineType ==  CobolLineTypeEnum.CONTINUATION) :
            if (conditionalRightTrimmedContentArea == None) or (conditionalRightTrimmedContentArea == "") :
                result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS, self.EMPTY_STRING, line)
            else:
                if (line.getPredecessor() != None) and (line.getPredecessor().getContentAreaOriginal().endsWith("\"") \
                    or line.getPredecessor().getContentAreaOriginal().endsWith("'")):

                    trimmedContentArea = self.trimLeadingWhitespace(conditionalRightTrimmedContentArea)

                    # /**
                    #  * ... the continuation line by specification has to start with two consecutive
                    #  * quotation marks.
                    #  */                    

                    if (trimmedContentArea.startsWith("\"") or trimmedContentArea.startsWith("'")):
                        # /**
                        # * We have to remove the first quotation mark of the continuation line, the 1
                        # * quotation mark from the continued line and the 2 quotations marks from the
                        # * continuation line become 2 successive quotation marks.
                        # */
                        result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,\
                            self.trimLeadingChar(trimmedContentArea), line)
                    else:
					# /**
					#  * ... where we simply remove leading whitespace.
					#  */
                        result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,\
                                self.trimLeadingWhitespace(conditionalRightTrimmedContentArea), line);
                # /**
                # * If we are ending with an open literal ...
                # */
                elif (line.getPredecessor() != None and self.isEndingWithOpenLiteral(line.getPredecessor())) :
                        trimmedContentArea : str= self.trimLeadingWhitespace(conditionalRightTrimmedContentArea)

                        # /**
                        #  * ... the continuation line might start with a single quotation mark. This
                        #  * indicates, that the literal from the continued line stays open ...
                        #  */
                        if (self.trimmedContentArea.startsWith("\"") and self.trimmedContentArea.startsWith("'")) :
                            # /**
                            #  * so we are removing the leading quotation mark to keep the literal open.
                            #  */
                            result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,\
                                    self.trimLeadingChar(trimmedContentArea), line)
                        else:
                            result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,\
                                    conditionalRightTrimmedContentArea, line)
                # /**
                # * If we are ending with a closed literal and the continued line ends with a
                # * quotation mark ...
                # */
                elif (line.getPredecessor() != None and (line.getPredecessor().getContentArea().endsWith("\"") \
					or  line.getPredecessor().getContentArea().endsWith("'"))):
                    # /**
                    #  * ... prepend a whitespace to the continuation line
                    #  */
                    result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,\
                    CobolPreprocessorTokens.WS + self.trimLeadingWhitespace(conditionalRightTrimmedContentArea), line)
                else:
				# /**
				#  * ... trim leading whitespace.
				#  */
                    result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,\
						self.trimLeadingWhitespace(conditionalRightTrimmedContentArea), line)
        
        elif (lineType ==  CobolLineTypeEnum.COMMENT):
            result = CobolLine.copyCobolLineWithIndicatorAndContentArea(
                        CobolPreprocessorTokens.COMMENT_TAG + CobolPreprocessorTokens.WS,
                        conditionalRightTrimmedContentArea,line)

        elif (lineType ==  CobolLineTypeEnum.COMPILER_DIRECTIVE): 
            result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS, self.EMPTY_STRING, line)

        elif (lineType ==  CobolLineTypeEnum.NORMAL):
            result = CobolLine.copyCobolLineWithIndicatorAndContentArea(CobolPreprocessorTokens.WS,
					conditionalRightTrimmedContentArea, line)
        return result

    def processLines(self, lines : list[CobolLine]) -> list[CobolLine]:
        result : list[CobolLine] = []
        line : CobolLine
        for line in lines:
            processedLine : CobolLine = self.processLine(line)
            result.append(processedLine)
        return result