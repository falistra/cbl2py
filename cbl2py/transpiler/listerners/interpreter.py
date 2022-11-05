from cbl2py.antlr4.CobolListener import CobolListener
from cbl2py.antlr4.CobolParser import CobolParser

class Interpreter(CobolListener):
    # Enter a parse tree produced by CobolParser#displayStatement.
    def enterDisplayStatement(self, ctx:CobolParser.DisplayStatementContext):
        # print(dir(ctx))
        # print(ctx.toStringTree())
        # print(dir(((ctx.displayOperand()[0]).literal())))
        # msg = str(((ctx.displayOperand()[0]).literal()).NONNUMERICLITERAL())[1:-1] # toglie apici
        msg = (ctx.displayOperand()[0]).getText()[1:-1]
        print(msg)
        
        # print(dir(((ctx.displayOperand()[0]).literal()).NONNUMERICLITERAL().getSymbol()))
        # print(dir((ctx.displayOperand()[0]).literal().NONNUMERICLITERAL().getSymbol().getTokenSource()))

    def enterAcceptStatement(self, ctx:CobolParser.AcceptStatementContext):
        # print(dir(ctx.identifier().qualifiedDataName())) # .displayOperand()[0].identifier()))
        # print(ctx.identifier().qualifiedDataName().qualifiedDataNameFormat1()) # .displayOperand()[0].identifier()))
        print(ctx.identifier().getText()) # .displayOperand()[0].identifier()))
