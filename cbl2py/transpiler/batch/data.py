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
    # dir_ctx = dir(ctx)
    # for p in dir_ctx:
    #     LOG.debug(p)
    
    if (ctx.dataRedefinesClause()):
        LOG.debug("dataRedefinesClause")
    # elif (ctx.dataIntegerStringClause()):
    #     LOG.debug("dataIntegerStringClause")
    # elif (ctx.dataExternalClause()):
    #     LOG.debug("dataExternalClause")
    # elif (ctx.dataGlobalClause()):
    #     LOG.debug("dataGlobalClause")
    # elif (ctx.dataTypeDefClause()):
    #     LOG.debug("dataTypeDefClause")
    # elif (ctx.dataThreadLocalClause()):
    #     LOG.debug("dataThreadLocalClause")
    # elif (ctx.dataPictureClause()):
    #     LOG.debug("dataPictureClause")
    # elif (ctx.dataCommonOwnLocalClause()):
    #     LOG.debug("dataCommonOwnLocalClause")
    # elif (ctx.dataTypeClause()):
    #     LOG.debug("dataPictureClause")
    # elif (ctx.dataTypeClause()):
    #     LOG.debug("dataPictureClause")
    # elif (ctx.dataUsingClause()):
    #     LOG.debug("dataUsingClause")
    # elif (ctx.dataUsageClause()):
    #     LOG.debug("dataUsageClause")
    # elif (ctx.dataReceivedByClause()):
    #     LOG.debug("dataReceivedByClause")
    # elif (ctx.dataOccursClause()):
    #     LOG.debug("dataOccursClause")
    # elif (ctx.dataSignClause()):
    #     LOG.debug("dataSignClause")
    # elif (ctx.dataSynchronizedClause()):
    #     LOG.debug("dataSynchronizedClause")
    # elif (ctx.dataJustifiedClause()):
    #     LOG.debug("dataJustifiedClause")
    # elif (ctx.dataBlankWhenZeroClause()):
    #     LOG.debug("dataBlankWhenZeroClause")
    # elif (ctx.dataWithLowerBoundsClause()):
    #     LOG.debug("dataWithLowerBoundsClause")
    # elif (ctx.dataAlignedClause()):
    #     LOG.debug("dataAlignedClause")
    # elif (ctx.dataRecordAreaClause()):
    #     LOG.debug("dataRecordAreaClause")
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
    elif (ctx.dataRedefinesClause()):
        LOG.debug("dataRedefinesClause")

    if ctx.INTEGERLITERAL:
        level = ctx.INTEGERLITERAL
        # LOG.debug(level)
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
