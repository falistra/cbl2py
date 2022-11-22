
class Program():
    def __init__(self):
        self.WS_NUM1 = 3.5
        self.WS_NAME = 'ABCD'
        self.WS_ID = 0
        self.REC_BC = None
        self.C_MAT_S = None
        self.T_1 = None
        self.TAGLIA_S = None
        self.T_2 = None
        self.MAG_S = None
        self.T_3 = None
        self.SETTORE_S = None
        self.T_4 = None
        self.NOME_S = None
        self.T_5 = None
        self.PREZZO_S = None
        self.T_6 = None
        self.NOME_F_S = None
        self.T_7 = None
        self.COL_F_S = None
        self.T_8 = None
        self.TG_OUT_S = None
        self.T_9 = None
        self.BARUNI_S = None
        self.NTG_NTG = 10
        self.NTG_IN = None
        self.NTG_OUT = None

        
    def HELLO(self):	# Linea Source Cobol: non definita
        print("WS-NUM1 : ",self.WS_NUM1)
        print("WS-NAME : ",self.WS_NAME)
        print("WS-ID   : ",self.WS_ID)

if __name__ == "__main__":
    program = Program()
    program.HELLO()   
        