
class Program():
    def __init__(self):
        self.WS_NUM1 = 3.5
        self.WS_NAME = 'ABCD'
        self.WS_ID = 0

        
    def HELLO(self):	# Linea Source Cobol: non definita
        print("WS-NUM1 : ",self.WS_NUM1)
        print("WS-NAME : ",self.WS_NAME)
        print("WS-ID   : ",self.WS_ID)

if __name__ == "__main__":
    program = Program()
    program.HELLO()   
        