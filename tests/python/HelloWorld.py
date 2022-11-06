
class Program():
        
    def IDSAMPLE(self):	# Linea Source Cobol: non definita
        self.ELABORA()
        self.TTLOCK()
        self.LEGGI_PARAMDT()
        self.AGG_DPARAM()
        self.TTUNLOCK()

    def ELABORA(self):	# Linea Source Cobol: 14
        print("PROGR. SESS. ==> ",self.PROGRESSIVO_SESSIONE)
        print("Vuoi scalare la Giacenza Virtuale ? (S o N )  ")
        self.FLAG_VIRTUALE = input()
        self.FLAG_SORTER = "S"
        self.OK_MAG = 0
        print("   ")
        print("Vuoi allocare ? (S o N )  ")
        self.FLAG_ALLOCAZIONE = input()
        print("Cod Allocazione")
        self.COD_ALLOC_IN = input()

    def LEGGI_PARAMDT(self):	# Linea Source Cobol: 34
        self.W_NOME_DATA_SET = "DPARAM;"
        self.W_NOME_CAMPO = "C-AZIENDA;"
        self.W_VALORE_CAMPO_HW = 0
        self.TTDBFIND()

    def TTLOCK(self):	# Linea Source Cobol: 49
        pass

if __name__ == "__main__":
    program = Program()
    program.IDSAMPLE()   
        