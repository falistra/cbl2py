
class Program():
    def __init__(self):
        self.WS_NUM1 = None
        self.WS_NUM2 = None
        self.WS_NUM3 = -123.45
        self.WS_NAME = 'ABCDEF'
        self.WS_ID = 'A121$'
        self.PROV_C_VET = " "*10

        
    def HELLO(self):	# Linea Source Cobol: non definita
        print(self.PROV_C_VET)
        print("WS-NUM1 : ",self.WS_NUM1)
        print("WS-NUM2 : ",self.WS_NUM2)
        print("WS-NUM3 : ",self.WS_NUM3)
        print("WS-NAME : ",self.WS_NAME)
        print("WS-ID : ",self.WS_ID)

if __name__ == "__main__":
    program = Program()
    program.HELLO()   
        