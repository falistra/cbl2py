import typer
import logging
import cbl2py.LoggingConfig
from cbl2py.transpiler.Main import Main

def driver(
  cobolfilename: str = typer.Option("./tests/cobol/READVE3.cbl", prompt=False),
  copybookdirectory: str = typer.Option('./tests/cobol/cpy', prompt=False),
  pythonfilename: str = typer.Option('./tests/python/READVE3.py', prompt=False),
  loglevel: str = typer.Option('debug', prompt=False),
  outpreprocessorfile: bool = typer.Option(False, prompt=False),
):
  if (loglevel == 'debug'):
    logging.getLogger().setLevel(logging.DEBUG)
  elif (loglevel == 'info'):
    logging.getLogger().setLevel(logging.INFO)
  elif (loglevel == 'warnig'):
    logging.getLogger().setLevel(logging.WARING)
  else:
    logging.getLogger().setLevel(logging.ERROR)
 
  logging.info(f" Test {cobolfilename}")
  Main(cobolfilename, copybookdirectory, pythonfilename, outPreprocessoFile = outpreprocessorfile)
  
def run():
  typer.run(driver)

if __name__ == "__main__":
  run()