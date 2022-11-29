from cbl2py.transpiler.Main import Main

# import logging
    
def Ztest_hw():
    cobolfilename = "./tests/cobol/HelloWorld.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/HelloWorld.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)

def Ztest_DataType_1():
    cobolfilename = "./tests/cobol/DataType_1.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/DataType_1.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)


def Ztest_DataType_2():
    cobolfilename = "./tests/cobol/DataType_2.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/DataType_2.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)

def Ztest_DataType_3():
    cobolfilename = "./tests/cobol/DataType_3.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/DataType_3.py" 
    outpreprocessorfile = "./tests/cobol/DataType_3_pre.cbl"
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)

def Ztest_READVE3():
    cobolfilename = "./tests/cobol/READVE3.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/READVE3.py" 
    outpreprocessorfile = "./tests/cobol/READVE3_pre.cbl"
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)


def Ztest_ASSSVSRT():
    cobolfilename = "./tests/cobol/ASSSVSRT.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/ASSSVSRT.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)
