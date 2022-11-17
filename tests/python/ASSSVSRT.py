
class Program():
        
    def ASSSVSRT(self):	# Linea Source Cobol: non definita
        pass

    def INIZIO(self):	# Linea Source Cobol: 2027
        self.S_SET_1()
        self.AAMMGG_2000OFPARDAT_2000 = self.W_FORMATO_INTERNO
        self.FISSO_2000OFPARDAT_2000 = 0
        self.FISSO_2000OFPARDAT_2000 = 20
        self.FISSO_2000OFPARDAT_2000 = 19
        self.FINITO = 0
        self.END_FILE = 0
        self.W_MODO = 3
        self.W_NOME_DATA_SET = "DPARAM;"
        self.TTLOCK()
        self.LEGGI_PARAMDT()
        self.AGG_DPARAM()
        self.TTUNLOCK()
        self.ELABORA()

    def FINE(self):	# Linea Source Cobol: 2087
        pass

    def S_SET_1(self):	# Linea Source Cobol: 2092
        pass

    def S_SET_3(self):	# Linea Source Cobol: 2121
        pass

    def LEGGI_PARAMDT(self):	# Linea Source Cobol: 2131
        self.W_NOME_DATA_SET = "DPARAM;"
        self.W_NOME_CAMPO = "C-AZIENDA;"
        self.W_VALORE_CAMPO_HW = 0
        self.TTDBFIND()
        self.W_MODO = 5
        self.TTDBGET()
        self.REC_PARAM_RID = self.AREA_REC_SET
        self.DBGET_PARAMDT()
        self.PROGRESSIVO_SESSIONE = self.PAR_PROGR_SESS
        self.PREF_PROGR_SESS = 5
        self.PREF_PROGR_SESS = 4
        self.PREF_PROGR_SESS = 3
        self.PREF_PROGR_SESS = 2

    def DBGET_PARAMDT(self):	# Linea Source Cobol: 2175
        self.TTDBGET()
        self.REC_PARAM_RID = self.AREA_REC_SET

    def AGG_DPARAM(self):	# Linea Source Cobol: 2184
        self.W_NOME_DATA_SET = "DPARAM"
        self.PAR_PROGR_SESS = 1
        self.AREA_REC_SET = self.REC_PARAM_RID
        self.TTUPDATE()

    def ELABORA(self):	# Linea Source Cobol: 2203
        print(SPACE)
        self.C_MAT_INPUT = LOW-VALUE
        self.MEM_COD_IN = SPACES
        self.MEM_COD_SORTER = 0
        self.FLAG_PRIMA_VOLTA = "S"
        self.FLAG_PRIMA_VOLTA_STESO = "S"
        self.NRO_CELLE = 0
        self.NRO_CAPI_LETTI = 0
        print("PROGR. SESS. ==> ",self.PROGRESSIVO_SESSIONE)
        print("Vuoi scalare la Giacenza Virtuale ? (S o N )  ")
        self.FLAG_VIRTUALE = input()
        self.FLAG_SORTER = "S"
        self.OK_MAG = 0
        self.TRATTA_MAG()
        print("   ")
        print("Vuoi allocare ? (S o N )  ")
        self.FLAG_ALLOCAZIONE = input()
        print("Cod Allocazione")
        self.COD_ALLOC_IN = input()
        self.SCRIVO_ALLOCAZIONE()
        print("%  annulla l'ultima lettura")
        print("#  per finire")
        self.LEGGI_ARTICOLI()

    def LEGGI_ARTICOLI(self):	# Linea Source Cobol: 2267
        print("LEGGI-ARTICOLI")
        print("Cod Modello(con   SORTER)")
        print("Cod Modello(senza SORTER)")
        self.C_MAT_INPUT = LOW-VALUE
        self.RIMANENZA = 0
        self.C_MAT_INPUT = input()
        self.FINITO = 1
        self.ANNULLA_PRECEDENTE()
        self.MEM_COD_IN = SPACES
        self.MEM_COD_SORTER = 0
        print("TAB-CELLE ",self.NRO_CELLE)
        print(self.RAGGR_1(L),":",SPACE,self.RAGGR_2(L),SPACE,self.RAGGR_3(L)," -> ",self.NRO_CAPI(L))
        self.FLAG_BARUNI = 'N'
        self.C_MAT_INPUT_BARUNI = self.C_MAT_INPUT
        self.SOCIETA_GRUPPO = self.SOC_BARUNI
        self.CONTROLLA_BARUNI()
        print("SKU NON VALIDO")
        self.ELABORA_BARUNI()
        self.C_MAT_INPUT_ORIG = self.C_MAT_INPUT
        self.DEED_X_14 = self.C_MAT_INPUT
        self.QD_LL_A = 14
        self.QD_LL_B = 14
        self.QD_STATO = 0
        self.QD_NR_DEC = 0
        print("Barcode NON corretto ",self.C_MAT_INPUT)
        self.FINITO = 0
        self.D_C_MAT = SPACES
        self.VERIFICA_EAN()
        self.S_SET_1()
        self.COM_C_MAT = self.C_MAT_INPUT
        self.COM_C_MAT_22 = 2
        self.COM_C_MAT_22 = 0
        self.C_MAT_INPUT = self.COM_C_MAT
        self.C_MAT_A_BARRE_RID = self.C_MAT_INPUT
        self.CHIAMA_DBGENSKU()
        print("ERRORE BARCODE/SKU >> RILEGGERE ")
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
        print("C-MAT E R R A T O")
        self.D_C_MAT = SPACES
        self.STAGIONE_MEM = self.STAGIONEOFREC_ANAMAT
        self.C_MAT_INPUT_MEM = self.C_MAT_INPUT
        self.FLAG_PERMANENTE = 0
        self.PERM_CMAT = self.C_MAT_TRANS_RID
        self.DT_X_PERM = self.W_FORMATO_INTERNO
        self.AA_X_PERM = 20
        self.PERM_DATA_VAL = self.DATA_X_PERM
        self.FLAG_PERMANENTE = 1
        print("PERMANENTEnoSORTER")
        self.C_MAT_INPUT = LOW-VALUE
        self.LEGGI_SORTER()
        self.CONTROLLA_SORTER()
        self.CONTROLLA_STESAUTO()
        self.CONTROLLA_CLASSE_AMMESSA()
        print("CLASSE NON AMMESSA")
        self.FLAG_ERRORE = 0
        self.LEGGI_PARAM_IMPIANTO()
        self.FLAG_PRIMA_VOLTA_STESO = "N"
        self.CONTA_CELLE()
        print("TAB-CELLE ",self.NRO_CELLE)
        print(self.RAGGR_1(L),":",SPACE,self.RAGGR_2(L),SPACE,self.RAGGR_3(L)," -> ",self.NRO_CAPI(L))
        self.D_C_MAT = self.D_MATOFREC_ANAMAT
        self.MEM_COD_SORTER = self.C_SORTER_INP_RID
        self.CREA_CAPO()
        self.CREA_CAPOSA()
        self.RICHIESTA = self.C_MAT_INPUT_MEM
        self.MEM_COD_IN = self.C_MAT_INPUT_MEM
        self.FLAG_PRIMA_VOLTA = "N"
        self.NRO_VIDEO = self.NRO_CAPI_LETTI
        self.ELABORA_SITPF_VIRTUALE()
        print(self.RIGA_VIDEO)
        print("EX-LEGGI-ARTICOLI")

    def LEGGI_SORTER(self):	# Linea Source Cobol: 2535
        print("LEGGI-SORTER")
        print("Cod SORTER")
        self.C_SORTER_INPUT = input()
        self.FINITO = 1
        print("annullata ULTIMA lettura")
        self.MEM_COD_IN = SPACES
        self.MEM_COD_SORTER = 0
        print("solo stesi ",self.C_SORTER_INPUT)
        self.C_MAT_INPUT = LOW-VALUE
        print("solo appesi ",self.C_SORTER_INPUT)
        self.PREF_STESO_APPESO = self.C_SORTER_PREF_INPUT
        self.PREF_STESO_APPESO = SPACE
        self.C_SORTER_PREF_INPUT = ZERO
        print("NON Numerico ",self.C_SORTER_INP_RID)
        print("NON Valido ",self.C_MAT_INPUT)
        self.C_MAT_INPUT = LOW-VALUE
        print("NON Numerico ",self.C_STESO_INP_RID)
        print("Cod SORTER = Cod Modello")
        self.C_MAT_INPUT = LOW-VALUE
        print("EX-LEGGI-SORTER")

    def SELECT_EAN(self):	# Linea Source Cobol: 2640
        self.S_SET_3()
        print("SELECT-EAN ",self.APP_MODELLO_EAN_13_X)
        self.CONTA_EAN = 0
        print("SQLCODE = ",self.SQLCODE)
        print("CONTA-EAN = ",self.CONTA_EAN)
        print("EX-SELECT-EAN")
        self.TEST_ERR()
        self.S_SET_1()

    def SELECT_EAN_EX(self):	# Linea Source Cobol: 2682
        pass

    def DICH_CURSORE_EAN(self):	# Linea Source Cobol: 2697
        print("DICH-CURSORE-EAN")
        print("EX-DICH-CURSORE-EAN")

    def APRI_CURSORE_EAN(self):	# Linea Source Cobol: 2728
        self.ER_DESCRIZIONE = 'OPEN-CURSMN'
        self.TEST_ERR()

    def LEGGI_CURSORE_EAN(self):	# Linea Source Cobol: 2737
        print("LEGGI-CURSORE-EAN")
        self.FLAG_CURSORE = 0
        self.CONTAT_EAN = 0
        self.INIT_APP_MODELLO_BC()
        self.EAN_DISPLAY = self.APP_MODELLO_BC
        print(self.CONTAT_EAN,' - ',self.EAN_DISPLAY)
        self.EL_EAN_MOD_BC(CONTAT_EAN) = self.APP_MODELLO_BC
        self.FLAG_CURSORE = 1
        print("EX-LEGGI-CURSORE-EAN")

    def CHIUDI_CURSORE_EAN(self):	# Linea Source Cobol: 2778
        self.ER_DESCRIZIONE = 'CLOSE-CURSMN'
        self.TEST_ERR()

    def VISUALIZZA_EAN(self):	# Linea Source Cobol: 2787
        self.S_SET_3()
        print("VISUALIZZA-EAN")
        self.DICH_CURSORE_EAN()
        self.APRI_CURSORE_EAN()
        self.LEGGI_CURSORE_EAN()
        self.CHIUDI_CURSORE_EAN()
        self.TEST_ERR()
        print("EX-VISUALIZZA-EAN")
        self.S_SET_1()

    def VISUALIZZA_EAN_EX(self):	# Linea Source Cobol: 2803
        pass

    def VERIFICA_EAN(self):	# Linea Source Cobol: 2806
        print("VERIFICA-EAN")
        self.CONTA_EAN = 0
        self.FLAG_OK = 1
        self.S_SET_3()
        self.BEGIN_RC()
        self.APP_MODELLO_EAN = self.DEED_9_14
        self.APP_MODELLO_EAN_X = self.APP_MODELLO_EAN
        print("APP-MODELLO-EAN-X = ",self.APP_MODELLO_EAN_X)
        self.SELECT_EAN()
        self.FLAG_OK = 1
        self.APP_MODELLO_EAN = self.DEED_9_14
        self.GET_MODELLO_BC()
        print("(EAN-MODELLO-BC) APP-MODELLO-BC ",self.APP_MODELLO_BC)
        self.C_MAT_INP_RID = self.APP_MODELLO_BC
        self.S_COMMIT()
        self.S_SET_1()
        self.FLAG_OK = 0
        print("Codice con piu' corrispondenze")
        self.VISUALIZZA_EAN()
        self.ACCETTA_EAN()
        self.FLAG_OK = 1
        self.S_COMMIT()
        self.S_SET_1()
        print("EX-VERIFICA-EAN")

    def VERIFICA_EAN_EX(self):	# Linea Source Cobol: 2879
        pass

    def GET_MODELLO_BC(self):	# Linea Source Cobol: 2884
        self.S_SET_3()
        print("GET-MODELLO-BC")
        self.APP_MODELLO_DT = SPACES
        self.APP_VARIANTE = SPACES
        self.APP_NUM_TAGLIA_OE = 0
        self.TEST_ERR()
        self.INIT_APP_MODELLO_BC()
        print("EX-GET-MODELLO-BC")
        self.S_SET_1()

    def INIT_APP_MODELLO_BC(self):	# Linea Source Cobol: 2930
        self.TG = self.APP_NUM_TAGLIA_OE
        self.APP_MODELLO_BC = self.APP_MODELLO_BC_9
        print(self.APP_MODELLO_BC)

    def ACCETTA_EAN(self):	# Linea Source Cobol: 2952
        print("ACCETTA-EAN")
        self.IND_ANAMAT_EAN = SPACE
        print("Indice")
        self.IND_ANAMAT_EAN = input()
        self.QD_LL_A = 2
        self.QD_LL_B = 2
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("INDICE non numerico")
        print("INDICE errato")
        self.C_MAT_INP_RID = self.EL_EAN_MOD_BC(IND_ANAMAT_EAN_R)
        self.EAN_DISPLAY = self.EL_EAN_MOD_BC(IND_ANAMAT_EAN_R)
        print('   - ',self.EAN_DISPLAY)
        print("ACCETTA-EAN-EX")

    def ACCETTA_EAN_EX(self):	# Linea Source Cobol: 2979
        pass

    def ANNULLA_PRECEDENTE(self):	# Linea Source Cobol: 2983
        print("nulla da annullare")
        self.CANC_SORTER()
        self.CANC_STESA()
        self.AGGIUSTA_TAB_CELLE()
        self.ANNULLA_SITPF_VIRTUALE()
        print("annullata ULTIMA lettura")

    def AGGIUSTA_TAB_CELLE(self):	# Linea Source Cobol: 3024
        self.NRO_CELLE = 0
        self.EL_CELLE(L_MEM) = self.EL_CELLE(NRO_CELLE)

    def TTDBFIND(self):	# Linea Source Cobol: 3040
        self.W_MODO = 1
        self.W_INDICE_8 = 3

    def TTDBGET(self):	# Linea Source Cobol: 3066
        self.W_INDICE_8 = 4

    def TTDBGET_M(self):	# Linea Source Cobol: 3092
        pass

    def NIENTE(self):	# Linea Source Cobol: 3094
        pass

    def TTLOCK(self):	# Linea Source Cobol: 3099
        self.W_INDICE_8 = 5

    def TTUPDATE(self):	# Linea Source Cobol: 3122
        self.W_MODO = 1
        self.W_INDICE_8 = 9

    def TTUNLOCK(self):	# Linea Source Cobol: 3151
        self.W_MODO = 1
        self.W_INDICE_8 = 8

    def TTDBPUT(self):	# Linea Source Cobol: 3176
        self.W_MODO = 1
        self.W_INDICE_8 = 7

    def TTDBCLOSE(self):	# Linea Source Cobol: 3203
        self.W_INDICE_8 = 1

    def TTDELETE(self):	# Linea Source Cobol: 3228
        self.W_MODO = 1
        self.W_INDICE_8 = 2

    def CONTROLLA_SORTER(self):	# Linea Source Cobol: 3255
        print("CONTROLLA-SORTER")
        self.CONTA_CAPO = 0
        self.CAPO_ID_BARCODE = self.C_SORTER_INP_RID
        self.BEGIN_RC()
        self.SELECT_CAPO()
        self.S_COMMIT()
        print("C-SORTER ESISTENTE")
        print("EX-CONTROLLA-SORTER")

    def SELECT_CAPO(self):	# Linea Source Cobol: 3281
        print("SELECT-CAPO")
        self.ER_DESCRIZIONE = "SELECT MAGAUTO.CAPO"
        self.TEST_ERR()
        print("EX-SELECT-CAPO")

    def SELECT_CAPO_EX(self):	# Linea Source Cobol: 3294
        pass

    def CANC_SORTER(self):	# Linea Source Cobol: 3299
        print("CANC-SORTER")
        self.CAPO_ID_BARCODE = self.MEM_COD_SORTER
        self.BEGIN_RC()
        self.DELETE_CAPO()
        self.S_COMMIT()
        print("EX-CANC-SORTER")

    def DELETE_CAPO(self):	# Linea Source Cobol: 3318
        print("DELETE-CAPO")
        self.ER_DESCRIZIONE = "DELETE MAGAUTO.CAPO"
        self.TEST_ERR()
        print("EX-DELETE-CAPO")

    def DELETE_CAPO_EX(self):	# Linea Source Cobol: 3330
        pass

    def CANC_STESA(self):	# Linea Source Cobol: 3335
        print("CANC-STESA")
        self.BEGIN_RC()
        self.DELETE_CAPOSA()
        self.S_COMMIT()
        print("EX-CANC-STESA")

    def DELETE_CAPOSA(self):	# Linea Source Cobol: 3356
        self.ER_DESCRIZIONE = "DELETE STESAUTO.CAPO"
        self.TEST_ERR()

    def DELETE_CAPOSA_EX(self):	# Linea Source Cobol: 3364
        pass

    def CONTROLLA_STESAUTO(self):	# Linea Source Cobol: 3370
        self.CONTA_CAPO = 0
        self.BEGIN_RC()
        self.SELECT_CAPOSA()
        print("C-SORTER ESISTENTE")
        self.SELECT_CAPOSMA()
        print("C-SORTER SMARRITO")
        self.SELECT_CAPOPRE()
        print("C-SORTER PRESPEDITO")
        self.S_COMMIT()

    def SELECT_CAPOSA(self):	# Linea Source Cobol: 3405
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CAPO"
        self.TEST_ERR()

    def SELECT_CAPOSA_EX(self):	# Linea Source Cobol: 3414
        pass

    def SELECT_CAPOSMA(self):	# Linea Source Cobol: 3419
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CAPO_SMARRITO"
        self.TEST_ERR()

    def SELECT_CAPOSMA_EX(self):	# Linea Source Cobol: 3428
        pass

    def SELECT_CAPOPRE(self):	# Linea Source Cobol: 3431
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CAPO_PRESPED"
        self.TEST_ERR()

    def SELECT_CAPOPRE_EX(self):	# Linea Source Cobol: 3440
        pass

    def CONTROLLA_CLASSE_AMMESSA(self):	# Linea Source Cobol: 3446
        self.CONTA_CAPO = 0
        self.CLAM_STAG = self.STAGIONE_MEM
        self.AAMMGG_2000OFPARDAT_2000_U = self.W_FORMATO_INTERNO
        self.NUM_2000OFPARDAT_2000_U = self.ANNOOFC_MAT_TRANSITO
        self.CLAM_ANNO = self.AAAA_2000OFPARDAT_2000_U
        self.N3 = self.CLASSEOFC_MAT_TRANSITO
        self.CLAM_CLASSE = self.X3
        self.CLAM_FORNITORE = self.SOCIETA_MODOFC_MAT_TRANSITO
        self.BEGIN_RC()
        self.SELECT_CLASSI_AMMESSE()
        self.S_COMMIT()

    def SELECT_CLASSI_AMMESSE(self):	# Linea Source Cobol: 3471
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CLASSI-AMMESSE"
        self.TEST_ERR()

    def SELECT_CLASSI_AMMESSE_EX(self):	# Linea Source Cobol: 3485
        pass

    def S_COMMIT(self):	# Linea Source Cobol: 3489
        self.ER_DESCRIZIONE = "COMMIT WORK"
        self.TEST_ERR()

    def S_COMMIT_EX(self):	# Linea Source Cobol: 3495
        pass

    def BEGIN_RC(self):	# Linea Source Cobol: 3499
        self.ER_DESCRIZIONE = "BEGIN WORK RC"
        self.TEST_ERR()

    def BEGIN_RC_EX(self):	# Linea Source Cobol: 3505
        pass

    def TEST_ERR(self):	# Linea Source Cobol: 3509
        self.SQL_STATUS = self.SQLCODE

    def TEST_ERR_EX(self):	# Linea Source Cobol: 3516
        pass

    def CREA_CAPO(self):	# Linea Source Cobol: 3520
        self.CAPO_DATANAS = self.AAAAMMGG_2000OFPARDAT_2000
        self.CAPO_DATAVAR = self.AAAAMMGG_2000OFPARDAT_2000
        self.CAPO_ID_BARCODE = self.C_SORTER_INP_RID
        self.CAPO_MODELLO_MAXIMA = self.C_MAT_TRANS_RID
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.CAPO_INDICE_TG = self.FUNCTIONidxtg(NTG_IN)
        self.CAPO_ID_MOVCOR = 0
        self.CAPO_ID_MOVMAG = 0
        self.CAPO_DATA_CAR_VITE = 0
        self.CAPO_DATA_CNTR_RIEN = self.AAAAMMGG_2000OFPARDAT_2000
        self.CAPO_ID_PROGR_SESS = self.PROGRESSIVO_SESSIONE
        self.CAPO_CAPOC = SPACES
        self.CAPO_CONTO = SPACES
        self.CAPO_RIF_BOLLA = 999999
        self.CAPO_MAGAZZINO = self.MAG_P_IN_R
        self.CAPO_BARUNI = self.C_MAT_INPUT_BARUNI
        self.CAPO_BARUNI = ' '
        self.BEGIN_CS()
        self.INSERISCI_CAPO()
        self.S_COMMIT()

    def BEGIN_CS(self):	# Linea Source Cobol: 3558
        self.ER_DESCRIZIONE = "BEGIN WORK CS"
        self.TEST_ERR()

    def BEGIN_CS_EX(self):	# Linea Source Cobol: 3564
        pass

    def INSERISCI_CAPO(self):	# Linea Source Cobol: 3568
        self.ER_DESCRIZIONE = "Insert MAGAUTO.CAPO "
        self.TEST_ERR()

    def INSERISCI_CAPO_EX(self):	# Linea Source Cobol: 3591
        pass

    def CREA_CAPOSA(self):	# Linea Source Cobol: 3596
        self.CAPOSA_DATANAS = self.AAAAMMGG_2000OFPARDAT_2000
        self.CAPOSA_DATAVAR = self.AAAAMMGG_2000OFPARDAT_2000
        self.CAPOSA_MODELLO_MAXIMA = self.C_MAT_TRANS_RID
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.NTG_OUT = self.FUNCTIONidxtg(NTG_IN)
        self.CAPOSA_INDICE_TG = self.NTG_OUT
        self.CAPOSA_DATA_CAR_SORT = 0
        self.CAPOSA_DATA_CNTR_RIEN = self.AAAAMMGG_2000OFPARDAT_2000
        self.CAPOSA_ID_PROGR_SESS = self.PROGRESSIVO_SESSIONE
        self.CAPOSA_CAPOC = SPACES
        self.CAPOSA_CONTO = SPACES
        self.CAPOSA_RIF_BOLLA = 999999
        self.CAPOSA_MAGAZZINO = self.MAG_P_IN_R
        self.CAPOSA_ID_UDC = SPACES
        self.CAPOSA_NUMERO_BATCH = SPACES
        self.CAPOSA_TIPO_BATCH = '0'
        self.CAPOSA_ID_PROGR_PREP = 0
        self.CAPOSA_UDC_VIRTUALE = 0
        self.CAPOSA_BARUNI = self.C_MAT_INPUT_BARUNI
        self.CAPOSA_BARUNI = ' '
        self.BEGIN_CS()
        self.INSERISCI_CAPOSA()
        self.S_COMMIT()

    def INSERISCI_CAPOSA(self):	# Linea Source Cobol: 3642
        self.ER_DESCRIZIONE = "Insert STESAUTO.CAPO "
        self.TEST_ERR()

    def INSERISCI_CAPOSA_EX(self):	# Linea Source Cobol: 3668
        pass

    def LEGGI_PARAM_IMPIANTO(self):	# Linea Source Cobol: 3673
        self.TEST_PARAM_IMPIANTO()
        print("Nro max celle errato dai parametri")

    def TEST_PARAM_IMPIANTO(self):	# Linea Source Cobol: 3686
        self.BEGIN_RC()
        self.SELECT_PARAM_IMPIANTO()
        print("Non trovati parametri")
        self.S_COMMIT()

    def SELECT_PARAM_IMPIANTO(self):	# Linea Source Cobol: 3704
        self.ER_DESCRIZIONE = "SELECT PARAM-IMPIANTO-PF "
        self.TEST_ERR()

    def CONTA_CELLE(self):	# Linea Source Cobol: 3715
        self.N10 = self.CLASSEOFC_MAT_TRANSITO
        self.RAGGR_1_COM = self.X10
        self.N10 = self.SOCIETA_MODOFC_MAT_TRANSITO
        self.RAGGR_2_COM = self.X10
        self.RAGGR_3_COM = self.X10
        print("TAB-CELLE da allargare")
        self.Z4 = self.PI_MAX_CELLE
        print("Celle necessarie: ",self.Z5,"; max celle ",self.Z4)
        self.RAGGR_1OFEL_CELLE(NRO_CELLE) = self.RAGGR_1_COM
        self.RAGGR_2OFEL_CELLE(NRO_CELLE) = self.RAGGR_2_COM
        self.RAGGR_3OFEL_CELLE(NRO_CELLE) = self.RAGGR_3_COM
        self.NRO_CAPI(NRO_CELLE) = 1
        self.L_MEM = self.NRO_CELLE
        self.L_MEM = self.L

    def ELABORA_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3763
        self.FLAG_GIAC_NEG = 'N'
        self.SITPFVIR_C_MAT = self.C_MAT_TRANS_RID
        self.SITPFVIR_MAG = self.MAG_P_IN_R
        self.NTG_IN = self.TAGLIAOFC_MAT_A_BARRE
        self.NTG_OUT = self.FUNCTIONidxtg(NTG_IN)
        self.QTA_TAGLIAOFTAB_R_VIRTUALE(INDICE_VIR) = 0
        self.QTA_TAGLIAOFTAB_R_VIRTUALE(NTG_OUT) = -1
        self.SITPFVIR_QTA_GIAC_1 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(1)
        self.SITPFVIR_QTA_GIAC_2 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(2)
        self.SITPFVIR_QTA_GIAC_3 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(3)
        self.SITPFVIR_QTA_GIAC_4 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(4)
        self.SITPFVIR_QTA_GIAC_5 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(5)
        self.SITPFVIR_QTA_GIAC_6 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(6)
        self.SITPFVIR_QTA_GIAC_7 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(7)
        self.SITPFVIR_QTA_GIAC_8 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(8)
        self.SITPFVIR_QTA_GIAC_9 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(9)
        self.SITPFVIR_QTA_GIAC_10 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(10)
        self.SELECT_SITPF_VIRTUALE()
        self.CONTROLLA_GIACENZA()
        self.UPDATE_SITPF_VIRTUALE()
        self.S_COMMIT()

    def ELABORA_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3810
        pass

    def SELECT_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3813
        self.ER_DESCRIZIONE = "SELECT SITPF-VIRTUALE "
        self.TEST_ERR()
        self.S_COMMIT()

    def SELECT_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3839
        pass

    def CONTROLLA_GIACENZA(self):	# Linea Source Cobol: 3841
        self.FLAG_GIAC_NEG = 'S'
        print("Manca Giac Virtuale, CMAT letto ugualmente")

    def CONTROLLA_GIACENZA_EX(self):	# Linea Source Cobol: 3883
        pass

    def UPDATE_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3886
        self.SITPFVIR_DT_UV = self.W_FORMATO_INTERNO
        self.ER_DESCRIZIONE = "Update SIT-PF-VIRT MANCA GIACENZA"
        self.TEST_ERR()

    def UPDATE_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3908
        pass

    def ANNULLA_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3912
        self.SITPFVIR_C_MAT = self.C_MAT_TRANS_RID
        self.SITPFVIR_MAG = self.MAG_P_IN_R
        self.QTA_TAGLIAOFTAB_R_VIRTUALE(INDICE_VIR) = 0
        self.QTA_TAGLIAOFTAB_R_VIRTUALE(TAGLIAOFC_MAT_A_BARRE) = 1
        self.SITPFVIR_QTA_GIAC_1 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(1)
        self.SITPFVIR_QTA_GIAC_2 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(2)
        self.SITPFVIR_QTA_GIAC_3 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(3)
        self.SITPFVIR_QTA_GIAC_4 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(4)
        self.SITPFVIR_QTA_GIAC_5 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(5)
        self.SITPFVIR_QTA_GIAC_6 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(6)
        self.SITPFVIR_QTA_GIAC_7 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(7)
        self.SITPFVIR_QTA_GIAC_8 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(8)
        self.SITPFVIR_QTA_GIAC_9 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(9)
        self.SITPFVIR_QTA_GIAC_10 = self.QTA_TAGLIAOFTAB_R_VIRTUALE(10)
        self.UPDATE_SITPF_VIRTUALE()
        self.S_COMMIT()

    def ANNULLA_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3948
        pass

    def TRATTA_MAG(self):	# Linea Source Cobol: 3951
        print("Mag. Scarico    ")
        print("4 o 6 o 7 ")
        self.MAG_P_IN = input()
        self.QD_LL_A = 3
        self.QD_LL_B = 3
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("CODICE Errato ",self.MAG_P_IN)
        self.OK_MAG = 1

    def TRATTA_MAG_EX(self):	# Linea Source Cobol: 3970
        pass

    def CONTROLLA_BARUNI(self):	# Linea Source Cobol: 3976
        self.FLAG_OK_BARUNI = 0
        self.TALLY_COM = 0
        self.FLAG_OK_BARUNI = 1

    def CONTROLLA_BARUNI_EX(self):	# Linea Source Cobol: 3985
        pass

    def ELABORA_BARUNI(self):	# Linea Source Cobol: 3988
        self.CHIAMA_DBGENSKU()
        print("Inserire il barcode-negozio    ")
        self.BARCODE_NEG_INPUT = input()
        self.BARCODE_NEG_MEM = self.BARCODE_NEG_INPUT
        self.C_MAT_INPUT = self.BARCODE_NEG_INPUT
        self.FLAG_BARUNI = 'N'
        self.BARCODE_NEG_MEM = self.OUTPUT_VAL_BARCODE
        self.C_MAT_INPUT = self.OUTPUT_VAL_BARCODE
        self.FLAG_BARUNI = 'S'

    def ELABORA_BARUNI_EX(self):	# Linea Source Cobol: 4004
        pass

    def CHIAMA_DBGENSKU(self):	# Linea Source Cobol: 4007
        self.INPUT_VAL = self.C_MAT_INPUT

    def CHIAMA_DBGENSKU_EX(self):	# Linea Source Cobol: 4014
        pass

    def SCRIVO_ALLOCAZIONE(self):	# Linea Source Cobol: 4019
        self.STRINGA_CURRENT_DATE = self.FUNCTIONCURRENT_DATE
        self.CMAT_SETTORE = self.COD_ALLOC_IN
        self.AREA_ALLOC = self.COD_ALLOC_IN(1:2)
        self.PIANO = self.COD_ALLOC_IN(3:1)
        self.SETTORE = self.COD_ALLOC_IN(4:1)
        self.CANNA = self.COD_ALLOC_IN(5:3)
        self.MAG = self.MAG_P_IN_R
        self.TIPO = "NPS"
        self.ENTITA_REALE = self.PROGRESSIVO_SESSIONE_STR
        self.DT_CREAZIONE = self.DATA_ORA_CURRENT_DATE
        self.BEGIN_CS()
        self.INSERISCI_ALLOCAZIONE()
        self.S_COMMIT()
        self.S_SET_1()

    def INSERISCI_ALLOCAZIONE(self):	# Linea Source Cobol: 4046
        self.ER_DESCRIZIONE = "Insert ALLOCAZIONE "
        self.TEST_ERR()

    def INSERISCI_ALLOCAZIONE_EX(self):	# Linea Source Cobol: 4065
        pass

if __name__ == "__main__":
    program = Program()
    program.ASSSVSRT()   
        