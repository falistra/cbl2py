# poetry add antlr4-python3-runtime
antlr4 -Dlanguage=Python3 CobolPreprocessor.g4 -visitor # -o dist
# antlr4 -Dlanguage=Python3 Cobol.g4 -visitor # -o dist