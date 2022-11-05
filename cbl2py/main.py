import typer

from cbl2py.transpiler.Main import Main

def driver(
  cobolfilename: str = typer.Option("./tests/HelloWorld.cbl", prompt=False),
  copybookdirectory: str = typer.Option('./tests/cobol/cpy/', prompt=False),
  pythonfilename: str = typer.Option('./tests/python/HelloWorld.py', prompt=False)
):
  Main(cobolfilename, copybookdirectory, pythonfilename)
  
def run():
  typer.run(driver)

if __name__ == "__main__":
    run()