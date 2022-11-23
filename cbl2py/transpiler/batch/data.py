from cbl2py.antlr4.CobolParser import CobolParser
from cbl2py.transpiler.batch.utilities import normalize_ident as norm

import logging
LOG = logging.getLogger()

class Variable():
    def __init__(self,level,name,picture,value):
        self.level = level
        self.name = name
        self.picture = picture
        self.value = value
        self.children = []

def XData(ctx:CobolParser.DataDescriptionEntryFormat1Context):
    lunghezza = None
    for pc in ctx.dataPictureClause():
        if pc.pictureString():
            for pch_ in pc.pictureString().pictureChars():
                # if (pch_.IDENTIFIER()):
                #     print(pch_.IDENTIFIER().getText().upper())
                if (pch_.integerLiteral()):
                    lunghezza = pch_.integerLiteral().getText()
                    

    value = None
    if (ctx.dataValueClause()):
        for vc in ctx.dataValueClause():
            if (vc.dataValueInterval()):
                for vci in vc.dataValueInterval():
                    if (vci.dataValueIntervalFrom()):
                        if (vci.dataValueIntervalFrom().literal()):
                            if (vci.dataValueIntervalFrom().literal().figurativeConstant()):
                                fc = vci.dataValueIntervalFrom().literal().figurativeConstant().getText()
                                if (fc == "SPACES"):
                                    value = f'" "*{lunghezza}'
                                elif (fc == "ZERO"):
                                    value = '0'
                            else:
                                value = vci.dataValueIntervalFrom().literal().getText()

    if ctx.INTEGERLITERAL:
        level = ctx.INTEGERLITERAL
    elif ctx.LEVEL_NUMBER_77:
        level = ctx.LEVEL_NUMBER_77
    else:
        level = None
    if level:
        try:
            level = int(level().getText())
        except:
            pass 

    if ctx.dataName:
        name = ctx.dataName()
    else:
        name = None
    if name:
        name = norm(name.getText())
    return Variable(level,name,lunghezza,value)
