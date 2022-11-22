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

def test_DataType_3():
    cobolfilename = "./tests/cobol/DataType_3.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/DataType_3.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)
