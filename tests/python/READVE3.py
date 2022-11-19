
class Program():
        
    def READVE3(self):	# Linea Source Cobol: non definita
        pass

    def INIZIO(self):	# Linea Source Cobol: 2868
        self.USCITA_PROGRAMMA = 0
        self.CONT = 0
        self.USCITA_DEVICE = 0
        self.AA_MM_GG_DDT = self.W_FORMATO_INTERNO
        self.TRATTA_DEV()
        self.S_SET_1()
        self.CARICA_B2C_NO_DT()
        self.TRATTA_IMPEGNATO()
        self.TRATTA_NEG()

    def FINE(self):	# Linea Source Cobol: 2891
        pass

    def TRATTA_DEV(self):	# Linea Source Cobol: 2897
        self.DEV_IN = SPACES
        print("Disp. USCITA >> ")
        self.DEV_IN = input()
        self.QD_LL_A = 2
        self.QD_LL_B = 2
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("Dest. USCITA Err. ",self.DEV_IN)
        self.USCITA_DEVICE = 1

    def TRATTA_IMPEGNATO(self):	# Linea Source Cobol: 2916
        self.DISIMPEGNA = SPACES
        print("Si vuole eliminare impegnato ?(SI/NO)")
        self.DISIMPEGNA = input()
        self.DISIMPEGNA = "SI"
        self.DISIMPEGNA = "NO"
        print("Input non valido.")

    def TRATTA_NEG(self):	# Linea Source Cobol: 2932
        self.IND_RIGA = 100
        self.OK_NEG = 0
        self.IND_PAG = 0
        self.PREZZO_TOT = 0
        self.VERIF_NEG()
        self.MAG_INPUT = SPACE
        self.VERIF_MAG()
        self.F_V_INPUT = SPACE
        self.VERIF_F_V()
        self.OK_NEG = 0
        self.VERIFICA_SOC()
        self.CARICA_TAB_UNICO_DDT()
        self.OK_NEG = 0
        self.CICLO_DISIMPEGNO()
        self.INIZIA_TAB_ART()
        self.INIZIA_TAB_SING()
        self.TRATTA_OLD_NEW()
        self.TRATTA_LETTI()

    def VERIFICA_SOC(self):	# Linea Source Cobol: 2997
        self.SOCIETA_INPUT = SPACE
        print("Soc >> (vuoto = tutti) ")
        self.SOCIETA_INPUT = input()
        self.QD_LL_A = 1
        self.QD_LL_B = 1
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("Soc Err. ",self.SOCIETA_INPUT)
        self.OK_NEG = 1

    def CARICA_TAB_UNICO_DDT(self):	# Linea Source Cobol: 3016
        self.INIT_PAR_TAB_UNICO_DDT()
        self.SW_FINE_CARICA_TAB = 0
        self.VERIFICA_AS()
        self.VERIFICA_CL()
        self.VERIFICA_MAX_CAPI()
        self.TAB_ASOFDEP_TAB_UNICO_DDT = self.AS_IN_R(I_AS)
        self.TAB_CLOFDEP_TAB_UNICO_DDT = self.CL_IN_R(I_CL)
        self.TAB_MAX_CAPI = self.MAX_CAPI_INPUT_R
        self.TAB_CAPI_LETTI = 0
        self.INS_TAB_UNICO_DDT()
        print("---------------------------")
        print("AS CL MAX-CAPI INSERITI")
        self.MOSTRA_TAB_UNICO_DDT()
        print("CORRETTI? 'SI' per proseguire ","'NO' per rifare elenco AS CL da capo")
        self.SINO = "NO"
        self.SINO = input()
        print("sono dopo mostra-tab-unico")

    def VERIFICA_AS(self):	# Linea Source Cobol: 3071
        print("AS >> (tt=tutti) (elenco separato da ,) (CHIUDI)")
        self.ELENCO_AS = SPACES
        self.ELENCO_AS = input()
        self.SW_FINE_CARICA_TAB = 1
        print("Tratto tutti gli AS")
        self.ELENCO_AS = self.STRINGA_TUTTI_AS
        self.SW_AS_ERR = 0
        self.QD_LL_A = 2
        self.QD_LL_B = 2
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("AS Err. ",self.AS_IN(I_AS))
        self.SW_AS_ERR = 1

    def VERIFICA_CL(self):	# Linea Source Cobol: 3105
        self.ELENCO_CL = SPACES
        print("CL >> (elenco separato da ,)")
        self.ELENCO_CL = input()
        print("Tratto tutti le CL")
        self.ELENCO_CL = SPACES
        self.CL_IN_R(I_APP) = self.I_APP
        self.SW_CL_ERR = 0
        self.QD_LL_A = 2
        self.QD_LL_B = 2
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("Cl Err. ",self.CL_IN(I_CL))
        self.SW_CL_ERR = 1

    def VERIFICA_MAX_CAPI(self):	# Linea Source Cobol: 3139
        print("MaxCapi >> (vuoto = tutti) ")
        self.MAX_CAPI_INPUT = input()
        self.QD_LL_A = 6
        self.QD_LL_B = 6
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("MaxCapi Err. ")

    def CALL_DISIMPEGNA_MAG(self):	# Linea Source Cobol: 3219
        pass

    def INIZIA_TAB_ART(self):	# Linea Source Cobol: 3228
        self.QT_STATOOFPARTAB_ART = 0
        self.QT_NUM_ELEM_EFFOFPARTAB_ART = 0
        self.QT_INDEX_ELEMOFPARTAB_ART = 0
        self.QT_NUM_ELEM_MAXOFPARTAB_ART = self.NUM_ELEM_MAX_ART
        self.QT_FUNZIONEOFPARTAB_ART = "K1"
        self.QT_ADDR_KEYOFPARTAB_ART = 1
        self.QT_LL_KEYOFPARTAB_ART = 8

    def INIZIA_TAB_SING(self):	# Linea Source Cobol: 3247
        self.QT_STATOOFPARTAB_SING = 0
        self.QT_NUM_ELEM_EFFOFPARTAB_SING = 0
        self.QT_INDEX_ELEMOFPARTAB_SING = 0
        self.QT_NUM_ELEM_MAXOFPARTAB_SING = 9999
        self.QT_FUNZIONEOFPARTAB_SING = "K1"
        self.QT_LL_ELEMOFPARTAB_SING = 36
        self.QT_ADDR_KEYOFPARTAB_SING = 1
        self.QT_LL_KEYOFPARTAB_SING = 10

    def LEGGI_PARAMDT(self):	# Linea Source Cobol: 3261
        self.W_NOME_DATA_SET = "DPARAM;"
        self.W_NOME_CAMPO = "C-AZIENDA;"
        self.W_VALORE_CAMPO_HW = 0
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET()
        self.REC_PARAM_RID = self.AREA_REC_SET
        self.DBGET_PARAMDT()
        self.INDIRIZZO_DPARAM = self.W_WORD_ATT
        self.NUMERO_DDT = self.NUM_BOLLA_TAGLIO_FODERE

    def DBGET_PARAMDT(self):	# Linea Source Cobol: 3286
        self.TTDBGET()
        self.REC_PARAM_RID = self.AREA_REC_SET

    def LEGGI_PARAMDT_FITTIZI(self):	# Linea Source Cobol: 3294
        self.W_NOME_DATA_SET = "DPARAM;"
        self.W_NOME_CAMPO = "C-AZIENDA;"
        self.W_VALORE_CAMPO_HW = 0
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET()
        self.REC_PARAM_FITTIZ_R = self.AREA_REC_SET
        self.DBGET_PARAMDT_FTZ()
        self.INDIRIZZO_DPARAM = self.W_WORD_ATT
        self.NUMERO_DDT = self.PAR_FITTIZIO_1

    def DBGET_PARAMDT_FTZ(self):	# Linea Source Cobol: 3319
        self.TTDBGET()
        self.REC_PARAM_FITTIZ_R = self.AREA_REC_SET

    def VERIF_NEG(self):	# Linea Source Cobol: 3330
        self.D_CONTO_MEM = SPACES
        self.INDIRIZZO_COM = SPACES
        self.INDIRIZZO_C_COM = SPACES
        self.LOCALITA_COM = SPACES
        self.LOCALITA_C_COM = SPACES
        self.CONTO_IN = SPACES
        self.PROV_COM = SPACES
        self.PROV_C_COM = SPACES
        self.CAP_COM = 0
        self.CAP_C_COM = 0
        print(SPACE)
        print("CONTO cliente (8 cifre)")
        print("  (END/end=fine)")
        self.CONTO_IN = input()
        self.OK_NEG = 1
        self.USCITA_PROGRAMMA = 1
        print("CODICE non numerico")
        self.W_NOME_DATA_SET = "ANACON;"
        self.W_NOME_CAMPO = "CONTO;"
        self.W_VALORE_CAMPO_W = self.CONTO_IN_R
        self.W_MODO = 7
        self.TTDBGET()
        print("Manca CLIENTE ",self.CONTO_IN_R)
        self.D_CONTO_MEM = self.D_CONTOOFREC_ANACON
        self.FLAG_ANACON = self.FLAG_ANA_8
        self.FLAG_DT_ESTERO = 1
        self.FLAG_DT_ESTERO = 0
        self.LEGGI_IND()
        self.MUOVI_IND()
        self.MUOVI_CAP()
        self.SCEGLI_CONTO_FATTURA()
        self.CERCA_LISTINO()
        self.OK_NEG = 1

    def TRATTA_OLD_NEW(self):	# Linea Source Cobol: 3390
        print(SPACE)
        print(self.D_CONTO_MEM)
        print("dal mag ",self.MAG_INPUT)
        self.IND_CL = 0
        self.TOT_BOLLA_C = 0
        self.IND_CAPI_LETTI = 0
        self.IND_CAPI_NO_GIAC = 0
        self.TABELLA_ARTICOLI_LETTI = LOW-VALUE
        self.COD_IN = SPACES
        self.MEM_COD_IN = SPACES
        self.TRATTA_SITPF_3()
        print(" S stampa rapportino")
        self.COD_IN = SPACES
        self.COD_IN = input()
        self.STAMPA_RAPPORTINO()
        print("   rapportino stampato")

    def LEGGI_IND(self):	# Linea Source Cobol: 3433
        self.W_NOME_CAMPO = "CONTO;"
        self.W_NOME_DATA_SET = "INDIRIZ;"
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET()
        self.REC_INDIRIZZI = self.AREA_REC_SET
        print("ERR INDIRIZZI",self.CONTO_IN_R)
        self.AZZERA_CAMPI_INDIRIZ()

    def AZZERA_CAMPI_INDIRIZ(self):	# Linea Source Cobol: 3448
        self.D_AGG = SPACE
        self.STATOOFREC_INDIRIZZI = SPACE
        self.SIGLA_PROVOFREC_INDIRIZZI(1) = SPACE
        self.SIGLA_PROVOFREC_INDIRIZZI(2) = SPACE
        self.INDIRIZZOOFREC_INDIRIZZI(1) = SPACE
        self.INDIRIZZOOFREC_INDIRIZZI(2) = SPACE
        self.STATOOFREC_INDIRIZZI = SPACE
        self.CAPOFREC_INDIRIZZI(1) = 0
        self.CAPOFREC_INDIRIZZI(2) = 0
        self.PRIORITAOFREC_INDIRIZZI = 0
        self.TELEFONOOFREC_INDIRIZZI = 0
        self.TELEXOFREC_INDIRIZZI = 0

    def MUOVI_IND(self):	# Linea Source Cobol: 3467
        self.INDIRIZZO_STD = self.INDIRIZZOOFREC_INDIRIZZI(1)
        self.LL_STRINGA_IND = 66
        self.LL_SUBSTRINGA_IND = 60
        self.FUNZIONE_IND = 1
        self.FUNZIONE_IND = 2
        self.INDIRIZZO_STD = self.INDIRIZZOOFREC_INDIRIZZI(2)
        self.FUNZIONE_IND = 1
        self.FUNZIONE_IND = 2

    def MUOVI_CAP(self):	# Linea Source Cobol: 3497
        self.D_CONTO_AGG_MEM = self.D_AGGOFREC_INDIRIZZI
        self.STATO_COM = self.STATOOFREC_INDIRIZZI
        self.CAP_COM = self.CAPOFREC_INDIRIZZI(1)
        self.PROV_COM = self.SIGLA_PROVOFREC_INDIRIZZI(1)
        self.PROV_C_COM = self.SIGLA_PROVOFREC_INDIRIZZI(2)
        self.CAP_C_COM = self.CAPOFREC_INDIRIZZI(2)

    def CERCA_LISTINO(self):	# Linea Source Cobol: 3511
        self.W_NOME_CAMPO = "CONTO;"
        self.W_NOME_DATA_SET = "CONFATT;"
        self.W_VALORE_CAMPO_W = self.CONTO_IN_R
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET()
        self.REC_CONFATT = self.AREA_REC_SET
        self.LISTINO_MEM = self.LISTINOOFREC_CONFATT
        self.DIVISA_MEM = self.DIVISAOFREC_CONFATT

    def SCEGLI_CONTO_FATTURA(self):	# Linea Source Cobol: 3526
        self.CONTO_FATTURA_MEM = 0
        self.CONTO_FATTURA_MEM = self.TELEXOFREC_INDIRIZZI

    def TRATTA_SITPF_3(self):	# Linea Source Cobol: 3539
        self.W_NOME_DATA_SET = "SITPF"
        self.W_NOME_CAMPO = "MAG"
        self.W_VALORE_CAMPO_HW = self.MAG_INPUT_R
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET_S()
        self.SELEZIONA_SITPF_3()
        print(SPACE)
        print("TABELLA-ARTICOLI-LETTI ")
        print(" da allargare")
        print(SPACE)
        print("TABELLA-SINGOLI ")
        print(" da allargare")
        self.COD_IN_RID = "."

    def CALCOLA_AS_CL(self):	# Linea Source Cobol: 3579
        self.SW_ERR_AS_CL = 0
        self.W_VALORE_CAMPO = self.C_MAT_TRANS_RID
        self.W_NOME_DATA_SET = "ANAMAT;"
        self.W_NOME_CAMPO = "C-MAT;"
        self.W_MODO = 7
        self.TTDBGET()
        print("Inesist. ",self.C_MAT_A_BARRE_RID)
        self.SW_ERR_AS_CL = 1
        self.APP_A = self.ANNOOFREC_ANAMAT
        self.APP_S = self.STAGIONEOFREC_ANAMAT
        self.TAB_AS = self.APP_AS
        self.TAB_CL = self.CL_GROFREC_ANAMAT
        self.LEGGI_TAB_UNICO_DDT()
        self.SW_ERR_AS_CL = 1
        self.W_NOME_DATA_SET = "SITPF"
        self.W_MODO = 5

    def SELEZIONA_SITPF_3(self):	# Linea Source Cobol: 3607
        self.TTDBGET_S()
        self.C_MAT_TRANS_RID = self.C_MATOFREC_SITPF
        self.CALCOLA_AS_CL()
        self.TTDBGET_S()
        print("sono dopo calcola-as-cl ",self.C_MAT_TRANS_RID)
        print(self.dep_tab_unico_ddt)
        self.SW_MAX_CAPI_RAGGIUNTO = 1
        self.DEP_TAB_UNICO_DDT = self.ELE_TAB_UNICO_DDT(I_APP)
        self.SW_MAX_CAPI_RAGGIUNTO = 0
        print("sono dopo calcolo max capi raggiunto = ",self.SW_MAX_CAPI_RAGGIUNTO)
        self.TTDBGET_S()
        self.TAB_AS = self.APP_AS
        self.TAB_CL = self.CL_GROFREC_ANAMAT
        self.LEGGI_TAB_UNICO_DDT()
        self.TTDBGET_S()
        self.DA_TRASFERIRE = self.QTA_GIAC_PFOFREC_SITPF(IT)
        self.C_MAT_TRANS_RID = self.C_MATOFREC_SITPF
        self.MODELLOOFC_MAT_A_BARRE = self.MODELLOOFC_MAT_TRANSITO
        self.VESTIBILITAOFC_MAT_A_BARRE = self.VEST_AOFC_MAT_TRANSITO
        self.PEZZOOFC_MAT_A_BARRE = self.PEZZO_AOFC_MAT_TRANSITO
        self.SOCIETAOFC_MAT_A_BARRE = self.PROGR_ARTOFC_MAT_TRANSITO
        self.VARIANTE_COLOFC_MAT_A_BARRE = self.COLOREOFC_MAT_TRANSITO
        self.TAGLIAOFC_MAT_A_BARRE = self.FUNCTIONtgxid(IT)
        self.NTG_MEM = self.IT
        self.TRATTA_LEGGI()
        self.W_NOME_DATA_SET = "SITPF"
        self.W_MODO = 5
        self.TTDBGET_S()

    def TRATTA_LEGGI(self):	# Linea Source Cobol: 3740
        print("sono in tratta-leggi ")
        print(self.dep_tab_unico_ddt)
        self.MEM_COD_IN = SPACES
        self.SOC_COM = self.SOCIETAOFC_MAT_A_BARRE
        self.PRE_SOC = 0
        self.SOCIETAOFC_MAT_A_BARRE = self.SOC_COM
        self.QT_FUNZIONEOFPARTAB_ART = "K2"
        self.C_MAT_TRANS_RID = 0
        self.MODELLOOFC_MAT_TRANSITO = self.MODELLOOFC_MAT_A_BARRE
        self.VEST_AOFC_MAT_TRANSITO = self.VESTIBILITAOFC_MAT_A_BARRE
        self.PROGR_ARTOFC_MAT_TRANSITO = self.SOCIETAOFC_MAT_A_BARRE
        self.PEZZO_AOFC_MAT_TRANSITO = self.PEZZOOFC_MAT_A_BARRE
        self.COLOREOFC_MAT_TRANSITO = self.VARIANTE_COLOFC_MAT_A_BARRE
        self.W_VALORE_CAMPO = self.C_MAT_TRANS_RID
        self.W_NOME_DATA_SET = "ANAMAT;"
        self.W_NOME_CAMPO = "C-MAT;"
        self.W_MODO = 7
        self.TTDBGET()
        print("Inesist. ",self.C_MAT_A_BARRE_RID)
        self.D_MAT_MEM = self.D_MATOFREC_ANAMAT
        self.PTG_MEM = self.PRIMA_TGOFREC_ANAMAT
        self.VAL_REC_MEM = self.VALID_RECOFREC_ANAMAT
        self.COSTO_MEM = self.COSTOOFREC_ANAMAT
        self.ANACST_C_MAT_COM = self.C_MATOFREC_ANAMAT
        self.ANACST_MAG_COM = self.MAG_INPUT_R
        self.RIVALUTA_COSTO_ANAMAT()
        self.COSTO_MEM = self.ANACST_CST_COM
        self.RISP_NO_GIAC = SPACE
        self.RISP_NO_PREZZO = SPACE
        self.PREZZO_MEM = 0
        self.CERCA_PREZZO_V()
        print("Manca prezzo al pubblico ")
        print("    ",self.C_MAT_A_BARRE_RID)
        self.PREZZO_MEM = 0
        self.PREZZO_ANAMAT = 0
        self.CAMBIO_MEM = 0
        self.CERCA_PREZZO()
        self.OK_PREZZO = 0
        self.TRATTA_NO_PREZZO()
        self.prezzo_mem = 0
        self.CAMBIO_MEM = self.CAMBIO_TAB(QT_INDEX_ELEMOFPARTAB_ART)
        self.D_MAT_MEM = self.D_MAT_TAB(QT_INDEX_ELEMOFPARTAB_ART)
        self.PREZZO_MEM = self.PREZZO_TAB(QT_INDEX_ELEMOFPARTAB_ART)
        self.D_MAT_ELEM = self.D_MAT_MEM
        self.PRIMA_TG_ELEM = self.PTG_MEM
        self.PREZZO_ELEM = self.PREZZO_MEM
        self.COSTO_ELEM = self.COSTO_MEM
        self.CAMBIO_ELEM = self.CAMBIO_MEM
        self.TIPO_ANA_ELEM = self.VAL_REC_MEM
        self.QTA_TAGLIE_ELEM = LOW-VALUE
        self.QTA_GIAC_ELEM = self.QTA_GIACOFREC_SITPF
        self.ART_ELEM_LETTI = self.ART_TAB_LETTI(QT_INDEX_ELEMOFPARTAB_ART)
        self.D_MAT_MEM = self.D_MAT_ELEM
        self.PTG_MEM = self.PRIMA_TG_ELEM
        print("Manca giac ",self.C_MAT_A_BARRE_RID)
        self.OK_GIAC = 0
        self.TRATTA_NO_GIAC()
        self.INSERISCI_NO_GIAC_PREZZO()
        self.CONT_D = self.IND_CAPI_LETTI
        print(self.CONT_D)
        print("sono in add 1 to ind-capi-letti ")
        print(self.dep_tab_unico_ddt)
        self.IE_IMPORTO_IN = self.PREZZO_MEM
        self.PRZ_INLIT()
        print(self.CONT_D," ",self.D_MAT_ELEM,SPACE,self.PREZZO_D)
        self.RIMETTI_DEP_TAB_UNICO_DDT()
        print("sono in tratta-leggi DOPO RIMETTI-DEP-TAB")
        print("AS=",self.TAB_AS," CL=",self.TAB_CL," MAX-CAPI=",self.TAB_MAX_CAPI," CAPI-LETTI=",self.TAB_CAPI_LETTI)
        self.IE_IMPORTO_IN = self.PREZZO_TOT
        self.PRZ_INLIT()
        self.INSERT_ELEM_SING()
        self.ART_TAB_LETTI(QT_INDEX_ELEMOFPARTAB_ART) = self.ART_ELEM_LETTI
        self.QT_FUNZIONEOFPARTAB_ART = "K1"
        self.ERR_DISP = self.QT_STATOOFPARTAB_ART
        print("ERR INSERIM QTABEL ",self.ERR_DISP," - TRATTA-LEGGI")
        self.MEM_COD_IN = self.COD_IN

    def INSERISCI_NO_GIAC_PREZZO(self):	# Linea Source Cobol: 4069
        print("INSERITO Manca GIAC.")
        self.CAUSALE_NO_GIAC(IND_CAPI_NO_GIAC) = "MancaGIAC"
        print("INS. Manca PREZZO x ESTERO")
        self.CAUSALE_NO_PRZ(IND_CAPI_NO_GIAC) = "MancaPRZ"
        self.C_MAT_NO_GIAC(IND_CAPI_NO_GIAC) = self.C_MAT_A_BARRE_RID
        self.D_MAT_NO_GIAC(IND_CAPI_NO_GIAC) = self.D_MAT_MEM
        self.PREZZO_NO_GIAC(IND_CAPI_NO_GIAC) = self.PREZZO_MEM

    def TTDBGET_S(self):	# Linea Source Cobol: 4090
        pass

    def TTDBGET(self):	# Linea Source Cobol: 4094
        self.W_INDICE_8 = 4

    def TRATTA_NO_GIAC(self):	# Linea Source Cobol: 4121
        self.RISP_NO_GIAC = SPACE
        print("     ",self.D_MAT_ELEM,SPACE,self.PREZZO_D)
        print("CONFERMI MANCA GIAC ? (S/N)")
        self.RISP_NO_GIAC = "N"
        print(self.RISP_NO_GIAC)
        self.OK_GIAC = 1

    def TRATTA_NO_PREZZO(self):	# Linea Source Cobol: 4147
        self.RISP_NO_PREZZO = SPACE
        self.RISP_NO_PREZZO = "S"
        self.OK_PREZZO = 1

    def TTDBFIND(self):	# Linea Source Cobol: 4165
        self.W_MODO = 1
        self.W_INDICE_8 = 3

    def INSERT_ELEM_SING(self):	# Linea Source Cobol: 4191
        self.QT_FUNZIONEOFPARTAB_SING = "K1"
        self.CONT_SING = self.IND_CAPI_LETTI
        self.C_MAT_SING = self.C_MAT_A_BARRE_RID
        self.D_MAT_SING = self.D_MAT_MEM
        self.PRIMA_TG_SING = self.PTG_MEM
        self.PREZZO_SING = self.PREZZO_MEM
        self.SKU_SING = SPACES

    def PRZ_INLIT(self):	# Linea Source Cobol: 4258
        print(self.IE_MSG)

    def DELETE_ELEM_SING(self):	# Linea Source Cobol: 4277
        self.QT_FUNZIONEOFPARTAB_SING = "K3"
        self.CONT_SING = self.IND_CAPI_LETTI
        self.C_MAT_SING = self.C_MAT_A_BARRE_RID
        self.ERR_DISP = self.QT_STATOOFPARTAB_SING
        print("ERR QTABEL SING  ",self.ERR_DISP)
        print("ANNULLO PREC")
        print("PER ELEMENTO     ",self.C_MAT_A_BARRE_RID)

    def TRATTA_LETTI(self):	# Linea Source Cobol: 4298
        print(SPACE)
        self.TOT_CAPI_LETTI_1 = self.IND_CAPI_LETTI
        print("- Tot CAPI - ",self.TOT_CAPI_LETTI_1)
        self.TOT_CAPI_NO_GIAC = self.IND_CAPI_NO_GIAC
        print("- No GIAC./PREZZO - ",self.TOT_CAPI_NO_GIAC)
        print(" ")
        print("Vuoi STORNARE ","(SI-NO)")
        self.CONFERMA_STORNO = SPACES
        self.CONFERMA_STORNO = input()
        print(SPACE)
        print("Dammi il CODICE")
        self.COD_IN = SPACES
        self.MEM_COD_IN = SPACES
        print(" . fine lettura")
        print(" @ storno totale")
        self.QT_ADDR_KEYOFPARTAB_SING = 1
        self.QT_LL_KEYOFPARTAB_SING = 8
        self.TRATTA_STORNO()
        self.W_MODO = 5
        self.TTLOCK_T()
        self.LEGGI_PARAMDT()
        self.AGG_DPARAM()
        self.AA_MM_GG_DDT = self.W_FORMATO_INTERNO
        print("Aggiorno  ")
        print("BOLLA n.  ",self.NUMERO_DDT)
        self.INSERISCI_MOVSKU()
        self.S_S_COMMIT()
        self.DIR_VAR_VALUE = SPACE
        self.DIR_VAR_NAME = "RETIS_DIRECTORY"
        print(self.DIR_VAR_NAME)
        self.DIR_VAR_VALUE = input()
        self.USER_VAR_VALUE = SPACE
        self.USER_VAR_NAME = "RETIS_UTENTE"
        print(self.USER_VAR_NAME)
        self.USER_VAR_VALUE = input()
        self.FILE_VAR_NAME = "dd_BARCNEG"
        self.FILE_VAR_VALUE = SPACES
        print(self.FILE_VAR_NAME)
        print(self.FILE_VAR_VALUE)
        self.SCRIVI_RECORD()
        self.QT_ADDR_KEYOFPARTAB_SING = 1
        self.QT_LL_KEYOFPARTAB_SING = 10
        self.INTESTA_FILE_BC()
        self.SCORRI_TAB_SING()
        self.CALL_COMMAND()
        self.SCORRI_TB()
        self.CALL_COMMAND_2()
        self.SCRIVI_BOLLE()
        self.CHIAMA_PRINTDDT()
        self.DIVISA_PRIMO_LETTO = self.DIVISAOFREC_CONFATT
        self.STAMPA_NO_GIAC()
        self.TTUNLOCK()
        self.ALLINEA_BOLLA_ESTERO()
        self.AVANZA_DDT()
        print("premi un tasto per continuare...")
        self.TASTO_INP = input()

    def ALLINEA_BOLLA_ESTERO(self):	# Linea Source Cobol: 4472
        self.INPUT_RIF_TRASF = self.RIF_BOLLA_DDT
        self.INPUT_CONTO_TRASF = self.CONTO_FATTURA_MEM
        self.INPUT_CONTO_TRASF = self.CONTO_IN_R
        print('ERRORE!')
        print(self.OUTPUT_ERR_TRASF)

    def AVANZA_DDT(self):	# Linea Source Cobol: 4491
        self.INPUT_RIF_INTR = self.RIF_BOLLA_DDT
        self.INPUT_CONTO = self.CONTO_FATTURA_MEM
        self.INPUT_CONTO = self.CONTO_IN_R
        self.INPUT_MAG = self.MAG_INPUT_R
        self.INPUT_FLAG = 'E'
        print('AVANZAMENTO NON RIUSCITO')

    def CALL_COMMAND(self):	# Linea Source Cobol: 4513
        self.BUILD_N_DDT = self.NUMERO_DDT
        self.PURGE_N_DDT = self.NUMERO_DDT
        self.FILE_N_DDT = self.NUMERO_DDT
        self.FILE_N_DDT_2 = self.NUMERO_DDT
        self.PRINT_N_DDT = self.NUMERO_DDT
        self.PRINT_N_DDT_2 = self.NUMERO_DDT
        self.ERR_DISP = self.ERR
        print("Errore COMMAND BUILD - P",self.BUILD_N_DDT,SPACE,"-  ",self.ERR_DISP)
        self.ERR_DISP = self.ERR
        print("Errore COMMAND FILE ECQ - P",self.BUILD_N_DDT,SPACE,"-  ",self.ERR_DISP)
        self.JRUNC = 1

    def STAMPA_NO_GIAC(self):	# Linea Source Cobol: 4545
        self.CONTA_RIGHE = 100
        self.CONTA_PAGINE = 1
        self.APRI_STAMPA()
        self.STAMPA_DETT_N_G()
        self.CHIUDI_STAMPA()

    def APRI_STAMPA(self):	# Linea Source Cobol: 4558
        self.LL_RIGA = 136
        self.N_MAX_RIGHE = 9999
        self.PRE_NOME_FILE = "N"
        self.TERM_N_FILE = self.NUMERO_DDT
        self.N_STAMPANTE = 0
        self.COMANDO = "M"
        self.N_RIGA_STAMPA = 66
        self.DATI_RIGA = " MANCA GIAC./PREZZO SU VENDITA "
        self.DATI_RIGA = SPACES

    def SCRIVI(self):	# Linea Source Cobol: 4578
        self.STATO_DISPLAY = self.STATOOFPAR_PRINT
        print("ERRORE QPRINT CON STATO : ",self.STATO_DISPLAY)
        self.DATI_RIGA = SPACES
        self.COMANDO = "S"
        self.N_RIGA_STAMPA = 0

    def INTESTA_PAGINA(self):	# Linea Source Cobol: 4593
        self.DATI_RIGA = SPACE
        self.DATA_T = self.W_FORMATO_GG_MMM_AAAA
        self.NUM_PAG_T = self.W_NUM_TERM
        self.D_PAG_T = "term "
        self.COMANDO = "P"
        self.N_RIGA_STAMPA = 2
        self.N_STAMPANTE = 0
        self.SCRIVI()
        self.CONTO_T = self.CONTO_IN_R
        self.D_CONTO_T = self.D_CONTO_MEM
        self.D_PAG_T = "pag. "
        self.NUM_PAG_T = self.CONTA_PAGINE
        self.COMANDO = "P"
        self.N_RIGA_STAMPA = 3
        self.N_STAMPANTE = 0
        self.SCRIVI()
        self.DATI_RIGA = "     ELENCO MODELLI SENZA GIAC./PREZZO "
        self.N_RIGA_STAMPA = 2
        self.SCRIVI()
        self.N_RIGA_STAMPA = 1
        self.CONTA_RIGHE = 5

    def STAMPA_DETT_N_G(self):	# Linea Source Cobol: 4627
        self.INTESTA_PAGINA()
        self.C_MAT_A_BARRE_RID = self.C_MAT_NO_GIAC(W_INDICE_3)
        self.C_MAT_TRANS_RID = 0
        self.MODELLOOFC_MAT_TRANSITO = self.MODELLOOFC_MAT_A_BARRE
        self.VEST_AOFC_MAT_TRANSITO = self.VESTIBILITAOFC_MAT_A_BARRE
        self.PROGR_ARTOFC_MAT_TRANSITO = self.SOCIETAOFC_MAT_A_BARRE
        self.PEZZO_AOFC_MAT_TRANSITO = self.PEZZOOFC_MAT_A_BARRE
        self.COLOREOFC_MAT_TRANSITO = self.VARIANTE_COLOFC_MAT_A_BARRE
        self.C_MAT_ST = self.C_MAT_TRANS_RID
        self.NOME_MOD_ST = self.D_MAT_NO_GIAC(W_INDICE_3)
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.TAGLIA_ST = self.FUNCTIONidxtg(NTG_IN)
        self.NOGIAC_ST = self.CAUSALE_NO_GIAC(W_INDICE_3)
        self.NOPRZ_ST = self.CAUSALE_NO_PRZ(W_INDICE_3)
        self.SCRIVI()

    def CHIUDI_STAMPA(self):	# Linea Source Cobol: 4660
        pass

    def CALL_COMMAND_2(self):	# Linea Source Cobol: 4667
        self.WK_VAR_NAME = "dd_PEND"
        self.WK_VAR_VALUE = SPACES
        print(self.WK_VAR_NAME)
        self.WK_VAR_VALUE = input()
        self.LPR_NOME_FILE = self.WK_VAR_VALUE
        self.LPR_NUM_STAMPANTE = self.DESTINO_USCITA

    def CHIAMA_WRITERES(self):	# Linea Source Cobol: 4715
        self.CAPO_CONTO = 0
        self.SOTTO_CONTO = self.NEG_IN
        self.RIF_INTR_WR = self.RIF_BOLLA_DDT
        self.MAGAZZINO_WR = self.MAG_INPUT_R
        self.DEST_WR = self.FLAG_ANACON
        self.CONTO_CLI_WR = self.CONTO_FATTURA_MEM
        self.CONTO_CLI_WR = self.CONTO_IN_R
        self.CONTO_DEST_WR = self.CODICE_CONTO
        self.DIVISA_WR = self.DIVISA_MEM
        self.LISTINO_WR = self.LISTINO_MEM
        self.CAUSALE_WR = "VESD"
        self.DATA_CARICO_WR = 0

    def SCRIVI_BOLLE(self):	# Linea Source Cobol: 4744
        self.W_NOME_DATA_SET = "BOLLE;"
        self.CONTOOFREC_BOLLE = self.CONTO_FATTURA_MEM
        self.CONTOOFREC_BOLLE = self.CONTO_IN_R
        self.RIF_INTERNOOFREC_BOLLE = self.RIF_BOLLA_DDT
        self.MAGAZZINOOFREC_BOLLE = self.MAG_INPUT_R
        self.DATA_NASCITAOFREC_BOLLE = 0
        self.NUM_PRE_FATTOFREC_BOLLE = 0
        self.NUMEROOFREC_BOLLE = 1
        self.VAL_RECOFREC_BOLLE = SPACES
        self.TTDBPUT()
        self.ERR_DISP = self.W_STATUS_WORD_IMAGE
        print("Err. PUT BOLLE  ",self.ERR_DISP)
        print("Per CONTO  ",self.CONTO_IN_R,"   RIF-INTERNO  ",self.RIF_BOLLA_DDT)

    def TRATTA_STORNO(self):	# Linea Source Cobol: 4774
        self.COD_IN = SPACES
        self.COD_IN = input()
        self.IND_CAPI_LETTI = 0
        self.COD_IN_RID = "."
        print("COD non num >> RILEGGERE")
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.NTG_OUT = self.FUNCTIONidxtg(NTG_IN)
        self.SOC_COM = self.SOCIETAOFC_MAT_A_BARRE
        self.PRE_SOC = 0
        self.SOCIETAOFC_MAT_A_BARRE = self.SOC_COM
        self.QT_FUNZIONEOFPARTAB_ART = "K2"
        print("Manca lettura ")
        self.ART_ELEM_LETTI = self.ART_TAB_LETTI(QT_INDEX_ELEMOFPARTAB_ART)
        print("Taglia non stornabile")
        self.DELETE_ELEM_SING()
        self.DISP_4 = self.QTA_TAGLIA_ELEM(NTG_OUT)
        print("ancora ",self.DISP_4,self.C_MAT_A_BARRE_RID)
        self.IE_IMPORTO_IN = self.PREZZO_TOT
        self.PRZ_INLIT()
        self.ART_TAB_LETTI(QT_INDEX_ELEMOFPARTAB_ART) = self.ART_ELEM_LETTI

    def SCORRI_TB(self):	# Linea Source Cobol: 4833
        self.COMANDI_IGP_TESTA()
        self.VERT_EXP_IGP = 0
        self.ORIZ_EXP_IGP = 0
        self.ROW_IGP = 80
        self.COL_IGP = 100
        self.COMANDI_IGP_TESTA_1()
        self.RIGA_PEND_COM = SPACES
        self.DISP_4 = self.QT_NUM_ELEM_EFFOFPARTAB_SING
        self.SCRIVI_RECORD_IGP()
        self.COMANDI_IGP_FINE_1()
        self.IND_PEND = 0
        self.SCORRI_TB_SING()
        self.SCRIVI_ETICH_VUOTA()

    def SCORRI_TB_SING(self):	# Linea Source Cobol: 4867
        self.COMANDI_IGP_TESTA_1()
        self.RIGA_PENDENTI = SPACES
        self.METTI_VALORI_PEND()
        self.ROW_IGP = 80
        self.RIGA_PEND_COM = self.ANTE_PRIMA_RIGA
        self.SCRIVI_RECORD_IGP()
        self.RIGA_PEND_COM = self.PRIMA_RIGA
        self.SCRIVI_RECORD_IGP()
        self.RIGA_PEND_COM = self.SECONDA_RIGA
        self.SCRIVI_RECORD_IGP()
        self.RIGA_PEND_COM = self.TERZA_RIGA
        self.SCRIVI_RECORD_IGP()
        self.RIGA_PEND_COM = self.QUARTA_RIGA
        self.SCRIVI_RECORD_IGP()
        self.COMANDI_IGP_FINE_1()
        self.IND_PEND = 1
        self.IND_PEND = 0

    def SCRIVI_ETICH_VUOTA(self):	# Linea Source Cobol: 4912
        self.ROW_IGP = 80
        self.COL_IGP = 100
        self.COMANDI_IGP_TESTA_1()
        self.RIGA_PEND_COM = SPACES
        self.SCRIVI_RECORD_IGP()
        self.COMANDI_IGP_FINE_1()

    def METTI_VALORI_PEND(self):	# Linea Source Cobol: 4924
        self.NUMERO_P = self.NUMERO_DDT
        self.ELEMENTO_SINGOLI = self.ELEM_TAB_SING(W_INDICE_3)
        self.CODICE_P = self.C_MAT_SING
        self.NOME_P = self.D_MAT_SING
        print(self.IE_MSG)
        self.DIV_EUR = self.IE_DIVISA_OU
        self.PREZZO_P_E = 0
        self.IE_IMPORTO_IN = self.PREZZO_SING
        print(self.IE_MSG)
        self.DIV_LIT = self.IE_DIVISA_OU
        self.PREZZO_P = 0

    def CERCA_PREZZO_PUBBL(self):	# Linea Source Cobol: 4981
        self.PREZZO_PUBBL = 0
        self.C_MAT_A_BARRE_RID = self.C_MAT_SING
        self.C_MAT_TRANS_RIDOFC_MAT_COM = 0
        self.MODELLOOFC_MAT_TRANSITO = self.MODELLOOFC_MAT_A_BARRE
        self.VEST_AOFC_MAT_TRANSITO = self.VESTIBILITAOFC_MAT_A_BARRE
        self.PROGR_ARTOFC_MAT_TRANSITO = self.SOCIETAOFC_MAT_A_BARRE
        self.PEZZO_AOFC_MAT_TRANSITO = self.PEZZOOFC_MAT_A_BARRE
        self.COLOREOFC_MAT_TRANSITO = 0
        self.TRATTA_MODELLI_DBG()
        self.CERCA_PREZZO_PUBBL_2()

    def TRATTA_MODELLI_DBG(self):	# Linea Source Cobol: 5038
        self.CC_SOCIETA = self.SOCIETA_SIGLA(SOCIETA_MODOFC_MAT_TRANSITO)
        self.CC_C_MAT = self.C_MAT_TRANS_RIDOFC_MAT_COM
        self.CC_LISTINo = 1
        self.CC_TIPO_PREZZO = "V"
        self.SELEZIONA_PREZZO_DBG()
        print("SQLCODE ",self.SQLCODE)
        self.TEST_ERR()
        self.PREZZO_PUBBL = self.CC_PREZZO_DBG

    def SELEZIONA_PREZZO_DBG(self):	# Linea Source Cobol: 5063
        self.BEGIN_RC()
        self.SQLCODE_MEM = self.SQLCODE
        self.S_S_COMMIT()

    def CERCA_PREZZO_PUBBL_2(self):	# Linea Source Cobol: 5178
        self.PREZZO_PUBBL = 0
        self.W_NOME_DATA_SET = "PREZZI;"
        self.W_NOME_CAMPO = "C-MAT;"
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET_P_PUB()
        self.TTDBGET_P_PUB()
        self.PREZZO_PUBBL = self.PREZZO_VENDITAOFREC_PREZZI_PUB(1)

    def SCORRI_TAB_SING(self):	# Linea Source Cobol: 5204
        self.ELEMENTO_SINGOLI = self.ELEM_TAB_SING(W_INDICE_3)
        print("SCORRI-TAB-SING")
        print(self.C_MAT_SING,SPACE,self.CONT_SING,SPACE,self.D_MAT_SING)
        self.C_MAT_A_BARRE_RID = self.C_MAT_SING
        self.C_MAT_TRANS_RID = 0
        self.MODELLOOFC_MAT_TRANSITO = self.MODELLOOFC_MAT_A_BARRE
        self.VEST_AOFC_MAT_TRANSITO = self.VESTIBILITAOFC_MAT_A_BARRE
        self.PROGR_ARTOFC_MAT_TRANSITO = self.SOCIETAOFC_MAT_A_BARRE
        self.PEZZO_AOFC_MAT_TRANSITO = self.PEZZOOFC_MAT_A_BARRE
        self.MAG_S = self.NEG_IN
        self.NOME_S = self.D_MAT_SING
        self.NOME_F_S = SPACES
        self.COL_F_S = SPACES
        self.SETTORE_S = SPACES
        self.PREZZO_S = 0
        self.BARUNI_S = self.SKU_SING
        self.T_1 = self.T_TAB
        self.T_2 = self.T_TAB
        self.T_3 = self.T_TAB
        self.T_4 = self.T_TAB
        self.T_5 = self.T_TAB
        self.T_6 = self.T_TAB
        self.T_7 = self.T_TAB
        self.T_8 = self.T_TAB
        self.T_9 = self.T_TAB
        self.CERCA_PREZZO_V()
        self.TAGLIA_S = self.TAGLIAOFC_MAT_A_BARRE
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.W_INDICE_4 = self.FUNCTIONidxtg(NTG_IN)
        self.ESPLODI_TG()

    def INTESTA_FILE_BC(self):	# Linea Source Cobol: 5246
        self.REC_BC = SPACE

    def CERCA_PREZZO_V(self):	# Linea Source Cobol: 5259
        self.W_NOME_DATA_SET = "PREZZI;"
        self.W_NOME_CAMPO = "C-MAT;"
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET_P()
        self.TTDBGET_P()
        self.PREZZO_MEM = self.PREZZO_VENDITAOFREC_PREZZI(1)

    def SCRIVI_RECORD(self):	# Linea Source Cobol: 5279
        self.ART_ELEM_LETTI = self.ART_TAB_LETTI(W_INDICE_3)
        self.C_MAT_TRANS_RID = 0
        self.MODELLOOFC_MAT_TRANSITO = self.MODELLOOFC_MAT_A_BARRE
        self.VEST_AOFC_MAT_TRANSITO = self.VESTIBILITAOFC_MAT_A_BARRE
        self.PROGR_ARTOFC_MAT_TRANSITO = self.SOCIETAOFC_MAT_A_BARRE
        self.PEZZO_AOFC_MAT_TRANSITO = self.PEZZOOFC_MAT_A_BARRE
        self.COLOREOFC_MAT_TRANSITO = self.VARIANTE_COLOFC_MAT_A_BARRE
        self.INVERTI_QTA()
        self.PREPARA_MOVMAG()
        self.CREA_MOVMAG_P_3()
        self.AGGIORNA_SITPF_P_3()

    def INVERTI_QTA(self):	# Linea Source Cobol: 5326
        pass

    def CERCA_PREZZO(self):	# Linea Source Cobol: 5333
        self.W_NOME_DATA_SET = "ANAMAT;"
        self.W_MODO = 7
        self.TTDBGET()
        print("Inesist. col 0  ",self.C_MAT_A_BARRE_RID)
        self.PREZZO_ANAMAT = self.COSTOOFREC_ANAMAT
        self.CHIAMA_DTVALSTK()
        self.CERCA_PREZZIA()

    def CHIAMA_DTVALSTK(self):	# Linea Source Cobol: 5355
        self.STK_C_MAT = self.C_MAT_TRANS_RID
        self.STK_COLL = self.COLLEZIONEOFREC_ANAMAT
        self.STK_STAGIONE = self.STAGIONEOFREC_ANAMAT
        self.STK_PRZ_LORDO = self.COSTOOFREC_ANAMAT
        self.NOME_IN_3 = "STF"
        self.NOME_IN_3 = "STF"
        self.NOME_IN_3 = "STV"
        self.NOME_IN_5 = self.CONTO_IN_R
        self.STK_NOME = self.NOME_IN_35
        self.PREZZO_MEM = self.STK_PRZ_SCO
        self.CAMBIO_MEM = self.STK_CAMBIO

    def CERCA_PREZZIA(self):	# Linea Source Cobol: 5415
        self.W_NOME_DATA_SET = "PREZZIA;"
        self.W_NOME_CAMPO = "C-MAT;"
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET_P()
        self.TTDBGET_P()
        self.PREZZO_MEM = self.PREZZO_VENDITAOFREC_PREZZI(1)
        self.CAMBIO_MEM = 0

    def ESPLODI_8_TG(self):	# Linea Source Cobol: 5436
        self.ESPLODI_TG()

    def ESPLODI_TG(self):	# Linea Source Cobol: 5446
        self.TAGLIA_S = self.W_INDICE_4
        self.T_TG()

    def T_TG(self):	# Linea Source Cobol: 5457
        self.TG_OUT_S = self.TG_CAL
        self.TG_OUT_S = "XS"
        self.TG_OUT_S = " S"
        self.TG_OUT_S = " M"
        self.TG_OUT_S = " L"
        self.TG_OUT_S = "XL"

    def TTUNLOCK(self):	# Linea Source Cobol: 5476
        self.W_MODO = 1
        self.W_INDICE_8 = 8

    def TTLOCK_T(self):	# Linea Source Cobol: 5501
        pass

    def TTLOCK(self):	# Linea Source Cobol: 5503
        self.W_INDICE_8 = 5

    def TTDBPUT(self):	# Linea Source Cobol: 5527
        self.W_MODO = 1
        self.W_INDICE_8 = 7

    def TTUPDATE(self):	# Linea Source Cobol: 5555
        self.W_MODO = 1
        self.W_INDICE_8 = 9

    def TTDBGET_P(self):	# Linea Source Cobol: 5582
        pass

    def TTDBGET_P_PUB(self):	# Linea Source Cobol: 5586
        pass

    def DISP_C_MAT(self):	# Linea Source Cobol: 5593
        self.RIGA_DISP = SPACES
        self.IND_4 = 1
        self.METTI_4()
        print(self.RIGA_DISP)

    def METTI_4(self):	# Linea Source Cobol: 5604
        self.DISP_ART(IND_4) = self.TAB_ART(W_INDICE_3)
        self.PARE1(IND_4) = "("
        self.PARE2(IND_4) = ")"
        self.ART_ELEM_LETTI = self.ART_TAB_LETTI(W_INDICE_3)
        self.COM_QTA_DISP = 0
        self.ACCUMULA_QTA()
        self.QTA_DISP(IND_4) = self.COM_QTA_DISP

    def ACCUMULA_QTA(self):	# Linea Source Cobol: 5624
        pass

    def AGG_DPARAM(self):	# Linea Source Cobol: 5632
        self.W_NOME_DATA_SET = "DPARAM;"
        self.AREA_REC_SET = self.REC_PARAM_RID
        self.TTUPDATE()

    def AGG_DPARAM_FITTIZI(self):	# Linea Source Cobol: 5641
        self.W_NOME_DATA_SET = "DPARAM;"
        self.AREA_REC_SET = self.REC_PARAM_FITTIZ_R
        self.TTUPDATE()

    def GET_LOCALITA(self):	# Linea Source Cobol: 5651
        self.LOCALITA_PART_STR = SPACES
        self.LOCALITA_PART_STR = self.DESC_LOC(IND_LOC)

    def CHIAMA_PRINTDDT(self):	# Linea Source Cobol: 5665
        self.MAGAZZINO_DDT = self.MAG_INPUT_R
        self.TIPO_DOC_DDT = 1
        self.TIPO_MOVIMENTO_DDT = 11
        self.CAUSALE_DDT = "VESD"
        self.TIPO_STAMPA_DDT = 1
        self.CLIENTE_DDT = self.CONTO_FATTURA_MEM
        self.CLIENTE_DDT = self.CONTO_IN_R
        self.GET_LOCALITA()
        self.LOC_PART_DDT = self.LOCALITA_PART_STR
        self.TIPO_DATA_SET_DDT = SPACES
        self.D_CONTO_VET = SPACES
        self.NOTE_DDT(1) = SPACES
        self.NOTE_DDT(2) = SPACES
        self.IMPORTO_X_PL = 0
        self.FILE_FAT_DDT = "N"
        self.RIGA_1_DDT = "MITTENTE DEPOSITARIO:MAXIMA SPA C/O DEPOSITO DIFFUSIONE TESSILE"
        self.RIGA_2_DDT = "SRL - VIA SANTI,8 42025 CAVRIAGO (RE) (SCARICO CONTO DEPOSITO)"
        self.RIGA_1_DDT = SPACE
        self.RIGA_2_DDT = SPACE

    def PREPARA_MOVMAG(self):	# Linea Source Cobol: 5738
        self.MOVMAG = LOW-VALUE
        self.VAL_RECOFMOVMAG = SPACES
        self.NUMERO_RIGAOFMOVMAG = 1
        self.Q_DATA_I = self.W_FORMATO_INTERNO
        self.Q_FUNZIONEOFPARGEN = 2
        self.SETTIMANAOFMOVMAG = self.Q_SETTIMANA
        self.RIF_INTERNOOFMOVMAG = self.RIF_BOLLA_DDT
        self.RIF_BOLLA_FORNOFMOVMAG = 0
        self.RIF_ORDINEOFMOVMAG = 0
        self.MOD_IMPUTAZOFMOVMAG = 0
        self.QUANTITAOFMOVMAG = 0
        self.DIVISAOFMOVMAG = SPACES
        self.VAL_RECOFMOVMAG = SPACES
        self.UN_MIS_FATTOFMOVMAG = "NR"
        self.DIVISAOFMOVMAG = "EUR "
        self.C_MATOFMOVMAG = self.C_MAT_TRANS_RID

    def CREA_MOVMAG_P_3(self):	# Linea Source Cobol: 5770
        self.PREZZOOFMOVMAG = self.COSTO_ELEM
        self.COSTO_STDOFMOVMAG = self.PREZZO_ELEM
        self.MOD_IMPUTAZOFMOVMAG = self.CAMBIO_ELEM
        self.C_OPEOFMOVMAG = "VESD"
        self.QTA_TAGLIEOFMOVMAG = self.QTA_TAGLIE_NEG
        self.MAGAZZINOOFMOVMAG = self.MAG_INPUT_R
        self.CONTOOFMOVMAG = self.CONTO_FATTURA_MEM
        self.MOD_IMPUTAZOFMOVMAG = self.CONTO_IN_R
        self.CONTOOFMOVMAG = self.CONTO_IN_R
        self.AREA_REC_SET = self.MOVMAG
        self.W_NOME_DATA_SET = "MOVMAG"
        self.TTDBPUT()
        self.STATO_DISPLAY = self.W_STATUS_WORD_IMAGE
        print("ERR PUT MOVMAG-P3- ",self.STATO_DISPLAY)
        print("PER C-MAT ",self.C_MAT_TRANSITO)

    def AGGIORNA_SITPF_P_3(self):	# Linea Source Cobol: 5806
        self.PARAGGPF = LOW-VALUE
        self.C_MATOFPARAGGPF = self.C_MAT_TRANS_RID
        self.MAGAZZINOOFPARAGGPF = self.MAG_INPUT_R
        self.VALOREOFPARAGGPF = -1
        self.QTA_8OFPARAGGPF = self.QTA_TAGLIE_NEG
        self.F_GIACOFPARAGGPF = 1

    def CARICA_TABELLA(self):	# Linea Source Cobol: 5828
        self.STK_C_MAT = 0
        self.STK_STAGIONE = 0
        self.STK_COLL = 0
        self.STK_PRZ_LORDO = 0
        self.STK_PRIMA_VOLTA = 0
        self.NOME_IN_3 = "STF"
        self.NOME_IN_3 = "STF"
        self.NOME_IN_3 = "STV"
        self.NOME_IN_5 = self.CONTO_IN_R
        self.STK_NOME = self.NOME_IN_35

    def STAMPA_RAPPORTINO(self):	# Linea Source Cobol: 5871
        print('M',self.TAB_ARTOFART_TAB_LETTI(W_INDICE_3))

    def VERIF_MAG(self):	# Linea Source Cobol: 5887
        print("MAG provenienza (3 cifre)")
        self.MAG_INPUT = input()
        print("MAG non numerico")
        print(self.SUGG_MAG_DISP)
        self.MAG_INPUT = SPACE

    def VERIF_F_V(self):	# Linea Source Cobol: 5908
        self.F_V_INPUT = "V"

    def TEST_ERR(self):	# Linea Source Cobol: 5929
        self.SQL_STATUS = self.SQLCODE

    def TEST_ERR_EX(self):	# Linea Source Cobol: 5936
        pass

    def BEGIN_RC(self):	# Linea Source Cobol: 5940
        self.ER_DESCRIZIONE = "BEGIN WORK RC"
        self.TEST_ERR()

    def BEGIN_RC_EX(self):	# Linea Source Cobol: 5946
        pass

    def S_S_COMMIT(self):	# Linea Source Cobol: 5950
        self.ER_DESCRIZIONE = "COMMIT WORK"
        self.TEST_ERR()

    def S_S_COMMIT_EX(self):	# Linea Source Cobol: 5956
        pass

    def COMANDI_IGP_TESTA(self):	# Linea Source Cobol: 6015
        self.REC_PEND = self.COMIGP_PTXSETUP
        self.REC_PEND = self.COMIGP_PTXCFG2
        self.REC_PEND = self.COMIGP_PTXEND

    def COMANDI_IGP_TESTA_1(self):	# Linea Source Cobol: 6026
        self.REC_PEND = self.COMIGP_LISTEN
        self.REC_PEND = self.COMIGP_CREATE
        self.REC_PEND = self.COMIGP_SCALEDOT
        self.REC_PEND = self.COMIGP_ALPHA

    def COMANDI_IGP_FINE_1(self):	# Linea Source Cobol: 6039
        self.REC_PEND = self.COMIGP_STOP
        self.REC_PEND = self.COMIGP_END
        self.REC_PEND = self.COMIGP_EXECUTE
        self.REC_PEND = self.COMIGP_QUIET

    def SCRIVI_RECORD_IGP(self):	# Linea Source Cobol: 6052
        self.REC_PEND = SPACES
        self.TEMP_X_IN = self.ROW_IGP
        self.TOGLI_ZERI()
        self.ROW_X_IGP = self.TEMP_X_OUT
        self.TEMP_X_IN = self.COL_IGP
        self.TOGLI_ZERI()
        self.COL_X_IGP = self.TEMP_X_OUT

    def TOGLI_ZERI(self):	# Linea Source Cobol: 6081
        self.PRIMO_NONZERO = 0
        self.PRIMO_NONZERO = self.K
        self.TEMP_X_OUT = self.TEMP_X_IN

    def INSERISCI_MOVSKU(self):	# Linea Source Cobol: 6101
        self.ELEMENTO_SINGOLI = self.ELEM_TAB_SING(IND_BARUNI)
        self.OUTPUT_VAL_A = '1'
        self.OUTPUT_VAL_B = SPACES
        self.CHIAMA_GETBARUNI()
        self.CONVERTI_BARCODE()
        self.MOVSKU_CMAT = self.C_MAT_TRANS_RID
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.MOVSKU_TG = self.FUNCTIONidxtg(NTG_IN)
        self.MOVSKU_BARUNI = self.OUTPUT_VAL_B_OK
        self.INSERT_SKU_E_SING()
        self.MOVSKU_SKU = self.MOVSKU_BARUNI(1:8)
        self.MOVSKU_RIF_INTERNO = self.RIF_BOLLA_DDT
        self.MOVSKU_CONTO = self.CONTO_IN_R
        self.MOVSKU_MAG = self.MAG_INPUT_R
        self.MOVSKU_IS_BARUNI_READ = 0
        self.MOVSKU_IS_BARUNI_CERTIFIED = 0
        self.MOVSKU_SKU_FATTURAZIONE = self.MOVSKU_BARUNI(1:8)
        self.ER_DESCRIZIONE = "Insert MOV-SKU "
        self.TEST_ERR()

    def INSERISCI_MOVSKU_EX(self):	# Linea Source Cobol: 6155
        pass

    def CONVERTI_BARCODE(self):	# Linea Source Cobol: 6158
        self.C_MAT_COM = ZEROS
        self.C_MAT_A_BARRE_RID = self.C_MAT_SING
        self.MODELLOOFC_MAT_COM = self.MODELLOOFC_MAT_A_BARRE
        self.VEST_AOFC_MAT_COM = self.VESTIBILITAOFC_MAT_A_BARRE
        self.PEZZO_AOFC_MAT_COM = self.PEZZOOFC_MAT_A_BARRE
        self.PREFISSO_V_FOFC_MAT_COM = self.PREFBC_V_FOFC_MAT_A_BARRE
        self.SOCIETA_MODOFC_MAT_COM = self.SOC_BC_MODOFC_MAT_A_BARRE
        self.COLOREOFC_MAT_COM = self.VARIANTE_COLOFC_MAT_A_BARRE

    def CHIAMA_GETBARUNI(self):	# Linea Source Cobol: 6180
        self.INPUT_VAL = self.C_MAT_SING
        self.INPUT_VAL_B = self.RIF_BOLLA_DDT
        self.INPUT_VAL_C = "READVE3"
        print(self.OUTPUT_VAL_B)

    def CHIAMA_GETBARUNI_EX(self):	# Linea Source Cobol: 6192
        pass

    def INSERT_SKU_E_SING(self):	# Linea Source Cobol: 6195
        self.QT_FUNZIONEOFPARTAB_SING = "K2"
        self.SKU_SING = self.OUTPUT_VAL_B_OK
        self.ELEM_TAB_SING(QT_INDEX_ELEMOFPARTAB_SING)(24:13) = self.SKU_SING
        self.ERR_DISP = self.QT_STATOOFPARTAB_SING
        print("ERR UPDATE QTABEL ",self.ERR_DISP," - INSERISCI-SKU")

    def CARICA_B2C_NO_DT(self):	# Linea Source Cobol: 6240
        self.BEGIN_RC()
        self.SE_SELECT_NEGOZIO_CATEG()
        print("NESSUNA NEGOZIO CATEGORIA TROVATA")
        self.NUM_B2C_NO_DT = 0
        self.NUM_B2C_NO_DT = self.SQLERRD(3)
        self.S_S_COMMIT()

    def SE_SELECT_NEGOZIO_CATEG(self):	# Linea Source Cobol: 6272
        self.ER_DESCRIZIONE = "SELECT NEGOZIO-CATEG  "
        self.TEST_ERR()

    def SE_SELECT_NEGOZIO_CATEG_EX(self):	# Linea Source Cobol: 6284
        pass

    def RIVALUTA_COSTO_ANAMAT(self):	# Linea Source Cobol: 6293
        self.CERCA_B2C_NO_DT()
        self.RICERCA_COSTO_ANAMAT()

    def CERCA_B2C_NO_DT(self):	# Linea Source Cobol: 6300
        self.FLAG_B2C_NO_DT = 'N'
        self.FLAG_B2C_NO_DT = 'S'

    def RICERCA_COSTO_ANAMAT(self):	# Linea Source Cobol: 6314
        self.ANACST_C_MAT = self.ANACST_C_MAT_COM
        self.ANACST_CST_COM = 0
        self.BEGIN_RC()
        self.SE_SELECT_ANAMAT_CST()
        self.ANACST_CST_COM = self.ANACST_CST_STD_2
        self.ANACST_CST_COM = self.ANACST_CST_STD
        self.S_S_COMMIT()

    def SE_SELECT_ANAMAT_CST(self):	# Linea Source Cobol: 6341
        self.ER_DESCRIZIONE = "SELECT ANAMAT_CST   "
        self.TEST_ERR()

    def SE_SELECT_ANAMAT_CST_EX(self):	# Linea Source Cobol: 6351
        pass

    def INIT_PAR_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6360
        self.QT_LL_ELEMOFPAR_TAB_UNICO_DDT = 16
        self.QT_LL_KEYOFPAR_TAB_UNICO_DDT = 4
        self.QT_ADDR_KEYOFPAR_TAB_UNICO_DDT = 1
        self.QT_NUM_ELEM_MAXOFPAR_TAB_UNICO_DDT = 1980
        self.QT_NUM_ELEM_EFFOFPAR_TAB_UNICO_DDT = 0

    def LEGGI_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6370
        self.QT_FUNZIONEOFPAR_TAB_UNICO_DDT = "K2"
        self.PRENDI_DEP_TAB_UNICO_DDT()

    def PRENDI_DEP_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6383
        self.DEP_TAB_UNICO_DDT = self.ELE_TAB_UNICO_DDT(QT_INDEX_ELEMOFPAR_TAB_UNICO_DDT)

    def AGG_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6388
        self.RIMETTI_DEP_TAB_UNICO_DDT()
        self.INS_TAB_UNICO_DDT()

    def RIMETTI_DEP_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6396
        self.ELE_TAB_UNICO_DDT(QT_INDEX_ELEMOFPAR_TAB_UNICO_DDT) = self.DEP_TAB_UNICO_DDT

    def INS_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6401
        self.QT_FUNZIONEOFPAR_TAB_UNICO_DDT = "K1"
        print("AS=",self.TAB_AS," CL=",self.TAB_CL," GIA' INSERITI CON CAPI ",self.TAB_MAX_CAPI)
        print("TAB-UNICO-DDT PIENA >> ALLARGARE")
        self.ERR_DISP = self.QT_STATOOFPAR_TAB_UNICO_DDT
        print("ERR k1 QTABELXL ",self.ERR_DISP," TAB-TAB-UNICO-DDT")

    def MOSTRA_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6427
        self.M_DEP_TAB_UNICO_DDT()
        print(" ")

    def M_DEP_TAB_UNICO_DDT(self):	# Linea Source Cobol: 6438
        self.PRENDI_DEP_TAB_UNICO_DDT()
        print(self.DEP_TAB_UNICO_DDT)
        print("AS = ",self.TAB_ASOFDEP_TAB_UNICO_DDT,"  ","CL = ",self.TAB_CLOFDEP_TAB_UNICO_DDT,"  ","MAX-CAPI = ",self.TAB_MAX_CAPIOFDEP_TAB_UNICO_DDT,"  ")

    def CICLO_DISIMPEGNO(self):	# Linea Source Cobol: 6455
        self.PRENDI_DEP_TAB_UNICO_DDT()
        print(self.DEP_TAB_UNICO_DDT)
        self.MAG_DISIMPEGNA = self.MAG_INPUT
        self.FORN_DISIMPEGNA = self.SOCIETA_INPUT
        self.AS_DISIMPEGNA(1) = self.TAB_AS
        self.CLASSE_DISIMPEGNA(1) = self.TAB_CL
        self.CALL_DISIMPEGNA_MAG()
        print("ERRORE DISIMPEGNO!!!")

if __name__ == "__main__":
    program = Program()
    program.READVE3()   
        