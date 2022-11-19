from cbl2py.transpiler.Main import Main

# import logging
    
def test_hw():
    cobolfilename = "./tests/cobol/HelloWorld.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/HelloWorld.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)

def test_DataType_1():
    cobolfilename = "./tests/cobol/DataType_1.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/DataType_1.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)
