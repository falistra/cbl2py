from cbl2py.antlr4.CobolListener import CobolListener
from cbl2py.antlr4.CobolParser import CobolParser
from cbl2py.transpiler.listerners.utilities import normalize_ident as norm

class Batch(CobolListener):
    def __init__(self, *args, **kwargs):
        self.outPythonFileName = kwargs["pythonfilename"] # params
        super(CobolListener, self).__init__()

    # Enter a parse tree produced by CobolParser#startRule.
    def enterStartRule(self, ctx:CobolParser.StartRuleContext):
        self.outPythonFile = open(self.outPythonFileName,'w')
        self.indent = 0
        self.tab = '    '
        self.functions = {}
        # self.outPythonFile.write(code)


    # Enter a parse tree produced by CobolParser#programIdParagraph.
    def enterProgramIdParagraph(self, ctx:CobolParser.ProgramIdParagraphContext):
        self.PROGRAM_ID = norm(ctx.programName().getText())
        code = f"\ndef {self.PROGRAM_ID}():\n{self.tab}pass\n"        
        self.outPythonFile.write(code)
        self.indent += 1

    # Enter a parse tree produced by CobolParser#performProcedureStatement.
    def enterPerformProcedureStatement(self, ctx:CobolParser.PerformProcedureStatementContext):
        self.currentCall = norm(ctx.procedureName()[0].paragraphName().getText())
        self.functions[self.currentCall] = {
            "body" : f"\n{self.indent*self.tab}pass"
        }
        code = f"{self.indent*self.tab}{self.currentCall}()\n"
        self.outPythonFile.write(code)


    # Enter a parse tree produced by CobolParser#paragraphs.
    def enterParagraphs(self, ctx:CobolParser.ParagraphsContext):
        print(ctx.paragraph()[0].paragraphName().getText())


    # Exit a parse tree produced by CobolParser#startRule.
    def exitStartRule(self, ctx:CobolParser.StartRuleContext):

        for function in self.functions:
            code = f"\ndef {function}():{self.functions[function]['body']}\n"
            self.outPythonFile.write(code)

        code = f"""
if __name__ == "__main__":
    {self.PROGRAM_ID}()   
        """
        self.outPythonFile.write(code)
        self.outPythonFile.close()
