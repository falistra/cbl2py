from cbl2py.transpiler.Main import Main

# import logging
    
def test_hw():
    cobolfilename = "./tests/cobol/HelloWorld.cbl"
    copybookdirectory = './tests/cobol/cpy' 
    pythonfilename = "./tests/python/HelloWorld.py" 
    outpreprocessorfile = False
    Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)

