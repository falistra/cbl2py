from cbl2py.antlr4.CobolListener import CobolListener
from cbl2py.antlr4.CobolParser import CobolParser
from cbl2py.transpiler.batch.utilities import normalize_ident as norm
from cbl2py.transpiler.batch.data import XData

import logging
LOG = logging.getLogger()

class Batch(CobolListener):
    def __init__(self, *args, **kwargs):
        self.outPythonFileName = kwargs["pythonfilename"] # params
        self.outPythonFile = open(self.outPythonFileName,'w')
        super(CobolListener, self).__init__()

    # Enter a parse tree produced by CobolParser#startRule.
    def enterStartRule(self, ctx:CobolParser.StartRuleContext):
        self.indent = 0
        self.tab = '    '
        self.functions = {}
        self.data = []

    # Enter a parse tree produced by CobolParser#programIdParagraph.
    def enterProgramIdParagraph(self, ctx:CobolParser.ProgramIdParagraphContext):
        self.PROGRAM_ID = norm(ctx.programName().getText())
        self.currentFunction = self.currentCall = norm(self.PROGRAM_ID)
        self.indent += 1 
        self.functions[self.currentFunction] = {
            "body" : []
        }

    # Enter a parse tree produced by CobolParser#dataDescriptionEntryFormat1.
    def enterDataDescriptionEntryFormat1(self, ctx:CobolParser.DataDescriptionEntryFormat1Context):
        self.data.append(XData(ctx))


    # Enter a parse tree produced by CobolParser#performProcedureStatement.
    def enterPerformProcedureStatement(self, ctx:CobolParser.PerformProcedureStatementContext):
        call = norm(ctx.procedureName()[0].paragraphName().getText())
        code = f"self.{call}()"
        self.functions[self.currentFunction]["body"].append(code)
 
    # Enter a parse tree produced by CobolParser#paragraph.
    def enterParagraph(self, ctx:CobolParser.ParagraphContext):
        para = norm(ctx.paragraphName().getText())
        if not ( ("EX_"+ self.currentFunction) ==  para):
            self.currentFunction = para
            self.functions[self.currentFunction] = {
                "body" : [],
                "start-line" : ctx.paragraphName().start.line
            }

    # Enter a parse tree produced by CobolParser#displayStatement.
    def enterDisplayStatement(self, ctx:CobolParser.DisplayStatementContext):
        operands = []
        for o in ctx.displayOperand():
            if (o.identifier()):
                operands.append(f"self.{norm(o.getText())}")
            if (o.literal()):
                operands.append(o.getText())
        self.functions[self.currentFunction]["body"].append(
            f"print({','.join(operands)})"
        )

    # Enter a parse tree produced by CobolParser#moveStatement.
    def enterMoveStatement(self, ctx:CobolParser.MoveStatementContext):
        moveToStatement = ctx.moveToStatement()
        if (moveToStatement):
            moveToSendingArea = moveToStatement.moveToSendingArea()
            to_ids = moveToStatement.identifier()
            code = []
            for id in to_ids:
                to_id = norm(id.getText())
                value = "None"
                if (moveToSendingArea.identifier()):
                    value = f"self.{norm(moveToSendingArea.getText())}"
                elif (moveToSendingArea.literal()):
                    value = moveToSendingArea.getText()
                code += [f"self.{to_id} = {value}"]
            self.functions[self.currentFunction]["body"] += code

    # Enter a parse tree produced by CobolParser#acceptStatement.
    def enterAcceptStatement(self, ctx:CobolParser.AcceptStatementContext):
        accept_id = norm(ctx.identifier().getText())
        # attenzione potrebbe essere nella function generale non in self.functions 
        code = [
            f"self.{accept_id} = input()"
        ]
        self.functions[self.currentFunction]["body"] += code

    # Exit a parse tree produced by CobolParser#startRule.
    def exitStartRule(self, ctx:CobolParser.StartRuleContext):
        indent = f'\n{self.indent*self.tab}'
        codeData = [f"self.{v.name} = {v.value}\n" for v in self.data]  
        code = f"""
class Program():
    def __init__(self):
        {f"{2*self.tab}".join(codeData)}
        """
        self.outPythonFile.write(code)

        for function in self.functions:
            bodylines = self.functions[function]['body']
            bodylines = [f'{(self.indent+1)*self.tab}'+line for line in  bodylines]
            if bodylines:
                body = '\n'.join(bodylines) 
            else:
                body = f'{(self.indent+1)*self.tab}'+"pass"
            comment = f"\t# Linea Source Cobol: {self.functions[function].get('start-line','non definita')}"
            code = f"\n{self.indent*self.tab}def {function}(self):{comment}\n{body}\n"
            self.outPythonFile.write(code)

        code = f"""
if __name__ == "__main__":
    program = Program()
    program.{self.PROGRAM_ID}()   
        """
        self.outPythonFile.write(code)
        self.outPythonFile.close()
