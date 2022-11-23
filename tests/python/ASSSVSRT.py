
class Program():
    def __init__(self):
        self.NTG_NTG = 10
        self.NTG_IN = None
        self.NTG_OUT = None
        self.ERR_DISP = None
        self.IND_A = None
        self.SALTO = 10
        self.IR = None
        self.SINO_DISPLAY = "NO"
        self.CONTA_CAPO = None
        self.APP_MODELLO_EAN_X = None
        self.PIPPO = None
        self.None = None
        self.APP_MODELLO_EAN_13_X = None
        self.APP_MODELLO_BC = None
        self.APP_MODELLO_DT = None
        self.APP_MODELLO_DT_RID = None
        self.MOD_1_8 = None
        self.MOD_9 = None
        self.MOD_10 = None
        self.MOD_11 = None
        self.MOD_12 = None
        self.MOD_13 = None
        self.MOD_14_15 = None
        self.APP_VARIANTE = None
        self.APP_VARIANTE_RID = None
        self.None = None
        self.VAR_2_3 = None
        self.APP_NUM_TAGLIA_OE = None
        self.TG = None
        self.APP_MODELLO_BC_X = None
        self.APP_MODELLO_BC_9 = None
        self.CONTA_EAN = None
        self.PI_MAX_CELLE = None
        self.TAB_REG_VIR = None
        self.TAB_QTA_GIAC_1 = None
        self.TAB_QTA_GIAC_2 = None
        self.TAB_QTA_GIAC_3 = None
        self.TAB_QTA_GIAC_4 = None
        self.TAB_QTA_GIAC_5 = None
        self.TAB_QTA_GIAC_6 = None
        self.TAB_QTA_GIAC_7 = None
        self.TAB_QTA_GIAC_8 = None
        self.TAB_QTA_GIAC_9 = None
        self.TAB_QTA_GIAC_10 = None
        self.TAB_MOD_SKU = None
        self.EL_MOD_SKU = None
        self.TAB_BARCODE_NEG = None
        self.APP_MODELLO_EAN = None
        self.SQL_CONST = None
        self.COSTANTI_SQL = None
        self.DEADLOCK = -14024
        self.NO_MEMORY = -4008
        self.MULTIPLE_ROWS = -2112
        self.NOT_FOUND = 100
        self.MODULE_NOT_FOUND = -2216
        self.CONSTR_VIOLATED_DF = -2091
        self.CONSTR_VIOLATED = -2292
        self.OK = +0
        self.SQL_STATUS = None
        self.PAR_ERR = None
        self.ER_NUM = None
        self.ER_IND = None
        self.ER_DISP = None
        self.ER_DESCRIZIONE = None
        self.AREA_HL = None
        self.HL_COMMON_AREA = None
        self.HL_SEND_PAR = None
        self.HL_ENABLE_INPUT = None
        self.HL_WINDOW_ENH = None
        self.HL_BYPASS_FEATURE = None
        self.HL_GLOBAL_PAR = None
        self.HL_EXPECTED_VUF = None
        self.HL_CALL_PROTOCOL = None
        self.HL_COMAREA_LEN = None
        self.HL_COMAREA = None
        self.HL_RETURN_PAR = None
        self.HL_STATUS = None
        self.HL_RETURN_SUBSTATUS = None
        self.HL_RETURN_MSGLENGTH = None
        self.HL_RETURN_MSG = None
        self.HL_LAST_ITEMTYPE = None
        self.HL_LAST_ITEMNUM = None
        self.HL_LAST_ITEMNAME = None
        self.HL_NUM_DATAERRS = None
        self.HL_NUM_CHANGEFIELDS = None
        self.HL_TERM_PAR = None
        self.HL_TERM_FILE = None
        self.HL_BYPASS_FEATURE_2 = None
        self.HL_FORM_PAR = None
        self.HL_FORM_NAME = None
        self.HL_FORM_POSITION = None
        self.HL_CHANGE_LISTTYPE = None
        self.HL_LIST_COUNT = None
        self.HL_CHANGE_ENTRY = None
        self.HL_FIELD_ID = None
        self.HL_CHANGE_TYPE = None
        self.HL_CHANGE_SPEC = None
        self.HL_PROMPT_PAR = None
        self.HL_PROMPT_REPAINT = None
        self.HL_PROMPT_WINDENH = None
        self.HL_PROMPT_RESET = None
        self.HL_READ_PAR = None
        self.HL_READ_TIME = None
        self.HL_ENABLE_FOR = None
        self.HL_DOREREAD = None
        self.HL_FILLER = None
        self.HL_READ_ITEMS = None
        self.HL_READITEM_COUNT = None
        self.HL_READITEM_ENTRY = None
        self.HL_READITEM_TYPE = None
        self.HL_READITEM_ID = None
        self.HL_READITEM_OPTION = None
        self.HL_CURSOR_POSITION = None
        self.HL_CURSOR_POS_NUM = None
        self.HL_CURSOR_POS_NAME = None
        self.HL_PROMPT_CURSOR_POSITION = None
        self.HL_FIL_PROMPT = None
        self.HL_ERR_CURSOR_POS = None
        self.HL_DATA_DESC = None
        self.HL_DESC_TYPE = None
        self.HL_BUFF_LENGTH = None
        self.HL_RET_BUFLEN = None
        self.HL_LABEL_DESC = None
        self.HL_LABEL_NUM = None
        self.HL_LABEL_ELEM = None
        self.HL_LABEL_ID = None
        self.HL_LABEL_ENH = None
        self.HL_LABEL_BUFF = None
        self.HL_LABEL_ENTRY = None
        self.HL_LABEL_TEXT = None
        self.HL_MSG_WINDOW = None
        self.HL_MSG_LENGTH = None
        self.HL_WINDOW = None
        self.HL_FORMCNTRL_PAR = None
        self.HL_FC_NAME = None
        self.HL_FC_UNDLCNTR = None
        self.HL_FC_PAGECNTR = None
        self.HL_FC_ENREF = None
        self.HL_FILLCNTRL_PAR = None
        self.HL_FC_DESC = None
        self.HL_FC_ENTRYCNT = None
        self.HL_FC_FIELDID = None
        self.HL_PRINT_DEV = None
        self.HL_FORMS_FILE = None
        self.HL_UNUSED_PAR = None
        self.HL_ERROR_PAR = None
        self.HL_ERR_LIST_TYPE = None
        self.HL_ERR_LIST_ALLOC = None
        self.HL_ERR_LIST_ACTUAL = None
        self.HL_ERR_FIELD = None
        self.HL_CALL = None
        self.TP_PARAM = None
        self.TP_ERRORI = None
        self.TP_FLAG = None
        self.TP_FLAG_SEND = None
        self.TP_FLAG_READ = None
        self.TP_FLAG_AGG_FASE = None
        self.TP_NUMERO_FASI = None
        self.TP_FASE_ATTUALE = None
        self.TP_SET_KEYF = None
        self.TP_RIGHE = None
        self.TP_RIGHE_FASE = None
        self.TP_PASSO_ROLL = None
        self.TP_RIGA_END = None
        self.TP_RIGA_START = None
        self.TP_RIGHE_EFF = None
        self.TP_IND_RIGA = None
        self.TP_IND_TERM = None
        self.TP_COMANDO = None
        self.TP_FIL1 = None
        self.TP_RESTO_COMANDO = None
        self.TP_RIGA1 = None
        self.TP_START1 = None
        self.None = None
        self.None = None
        self.TP_RIGA2 = None
        self.TP_START2 = None
        self.None = None
        self.None = None
        self.TP_RIGA3 = None
        self.TP_START3 = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.FILLER_COM = None
        self.TP_RIGA4 = None
        self.TP_START4 = None
        self.TP_RIGA41 = None
        self.TP_START41 = None
        self.TP_RIGA42 = None
        self.TP_START42 = None
        self.TP_RIGA43 = None
        self.TP_START43 = None
        self.TP_INFO = None
        self.TP_DISAB_FKEY = None
        self.TP_NUM_DISAB = None
        self.TP_TABELLA_DISAB = None
        self.TP_COM_DISAB = None
        self.TP_INFO_2 = None
        self.H_COMAREA = None
        self.H_COM_STATUS = None
        self.H_COM_LANGUAGE = None
        self.H_COM_COMAREALEN = None
        self.None = None
        self.H_COM_MODE = None
        self.H_COM_LASTKEY = None
        self.H_COM_NUMERRS = None
        self.None = None
        self.None = None
        self.H_COM_KEYLABOPT = None
        self.H_COM_CFNAME = None
        self.None = None
        self.H_COM_NFNAME = None
        self.None = None
        self.H_COM_REPEATOPT = None
        self.H_COM_NFOPT = None
        self.None = None
        self.H_COM_DBUFLEN = None
        self.None = None
        self.None = None
        self.H_COM_DELETEFLAG = None
        self.H_COM_SHOWCONTROL = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.H_COM_FRMSTORSIZE = None
        self.None = None
        self.None = None
        self.None = None
        self.H_COM_NUMRECS = None
        self.H_COM_RECNUM = None
        self.None = None
        self.None = None
        self.H_COM_TERMFILENUM = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.H_COM_TERMOPTIONS = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.AREA_SI = None
        self.SI_AREA_SISTEMA = None
        self.SI_DATI_UTENTE = None
        self.SI_SOTTOSISTEMA = None
        self.SI_TIMEOUT = None
        self.SI_STAMPANTE = None
        self.SI_STFORM = None
        self.SI_CODICE_AZIENDA = None
        self.SI_DATA_DEL_GIORNO = None
        self.SI_FORMATO_INTERNO = None
        self.None = None
        self.SI_FORMATO_GG_MM_AA = None
        self.SI_FORMATO_GG_MMM_AAAA = None
        self.SI_FORMATO_GGMMAAAA = None
        self.None = None
        self.None = None
        self.SI_AAAA = None
        self.SI_FORMATO_GGMMAA = None
        self.SI_GG = None
        self.SI_MM = None
        self.SI_AA = None
        self.SI_FORMATO_GMA_9 = None
        self.SI_PARAMETRI_UTE = None
        self.SI_TIPO = None
        self.SI_DATI_PROCESSO = None
        self.SI_DATI_PROG = None
        self.SI_NOME_PROG = None
        self.SI_NOME_PROC = None
        self.None = None
        self.SI_NOME_GROUP_PROG = None
        self.SI_NOME_ACCT_PROG = None
        self.SI_GROUP = None
        self.SI_USER = None
        self.SI_ACCOUNT = None
        self.SI_SESSION_NAME = None
        self.SI_TERM = None
        self.SI_NOME_FUNZIONE = None
        self.SI_CHIAVE_FUNZIONE = None
        self.SI_NOME_CHIAMANTE = None
        self.None = None
        self.SI_PRIMI4_CHIAMANTE = None
        self.None = None
        self.SI_PAR_SISTEMA = None
        self.SI_AREA_UTENTE = None
        self.SI_FLAG_1 = None
        self.SI_FLAG_2 = None
        self.SI_DEV_OUTCLASS = None
        self.SI_PRI_OUTCLASS = None
        self.SI_PRIORITA_OUT = None
        self.SI_PRIORITA_JOB = None
        self.SI_DATA_VALUTA = None
        self.SI_DATA_RIFERIMENTO = None
        self.SI_FLAG_COMMESSA = None
        self.FLAG_NUM_EFFETTI = None
        self.SI_DIVISA_DEFAULT = None
        self.SI_PREVIS_OLTRE = None
        self.None = None
        self.SI_PAR_IVA = None
        self.SI_CODA_DEFAULT = None
        self.SI_DIVISA_EURO = None
        self.SI_DATA_INIZIO_EURO = None
        self.SI_DATA_INIZIO_EURO_NUM = None
        self.SI_DATA_CONTAB_EURO = None
        self.SI_DATA_CONTAB_EURO_NUM = None
        self.SI_DIVISA_ITL = None
        self.None = None
        self.SI_AREE = None
        self.SI_DESCR_FUNZIONE = None
        self.SI_NR_FUNZIONE = None
        self.SI_FLAG_DISABLETERM = None
        self.SI_AREA_MSG = None
        self.SI_FLAG_BATCH = None
        self.SI_INFO_AREA_LIBERA = None
        self.None = None
        self.SI_LINGUA_USER = None
        self.SI_CAMBIO_EURO_LIRA = None
        self.SI_DB_CONNESSO = None
        self.SI_PASSWORD = None
        self.SI_DIRECTORY = None
        self.SI_AREE_PARAMETRI = None
        self.SI_PAR_SOTTOSISTEMA = None
        self.SI_PAR_FUNZIONE = None
        self.None = None
        self.SI_FLAG_UPD = None
        self.SI_FLAG_DEL = None
        self.SI_RESTO_PAR_FUN = None
        self.AREA_REC_SET = None
        self.None = None
        self.REC_ANAMAT = None
        self.C_MAT = None
        self.D_MAT = None
        self.DT_NA = None
        self.DT_UV = None
        self.P_STOCK = None
        self.CTO_RICAVI = None
        self.CTO_COSTI = None
        self.FLAGS_A = None
        self.FLAG = None
        self.FLAGS_RID = None
        self.FLAG1 = None
        self.FLAG2 = None
        self.FLAG3 = None
        self.FLAG4 = None
        self.FLAG5 = None
        self.FLAG6 = None
        self.FLAG7 = None
        self.FLAG8 = None
        self.PERC_MAGG = None
        self.ALIQ_IVA = None
        self.CL_GR = None
        self.COLLEZIONE = None
        self.ANNO = None
        self.STAGIONE = None
        self.COSTO = None
        self.UN_MIS = None
        self.CAT_TAGLIO = None
        self.MATER_MAX = None
        self.CATEG_GHELDA = None
        self.TG_BASE = None
        self.PRIMA_TG = None
        self.ULTIMA_TG = None
        self.SCORTA_IND = None
        self.SCORTA = None
        self.IND = None
        self.TIPO_MAT = None
        self.VALID_REC = None
        self.None = None
        self.REC_ANACON = None
        self.CONTO = None
        self.D_CONTO = None
        self.FLAGS = None
        self.FLAG_ANA_1 = None
        self.FLAG_ANA_2 = None
        self.FLAG_ANA_3 = None
        self.FLAG_ANA_4 = None
        self.FLAG_ANA_5 = None
        self.FLAG_ANA_6 = None
        self.FLAG_ANA_7 = None
        self.FLAG_ANA_8 = None
        self.FLAG_ANA_9 = None
        self.FLAG_ANA_10 = None
        self.None = None
        self.FLAG = None
        self.P_DARE = None
        self.P_AVERE = None
        self.P_DARE_C = None
        self.P_AVERE_C = None
        self.C_RAGG = None
        self.FIDO = None
        self.DATA_FIDO = None
        self.DATA_NA = None
        self.DATA_UM = None
        self.DATA_UV = None
        self.TIPO_CONTO = None
        self.VALIDITA_REC = None
        self.None = None
        self.REC_PREZZI = None
        self.C_MAT = None
        self.MERCATO = None
        self.DIVISA = None
        self.MAGAZZINO = None
        self.PREZZO_VENDITA_SUP = None
        self.PREZZO_VENDITA = None
        self.DATA_ULT_AGG = None
        self.VALID_REC = None
        self.REC_PARAMETRI = None
        self.ENTRY_PARAM_DETAIL = None
        self.C_AZIENDA = None
        self.TIPO_PARAMETRI = None
        self.STRINGA_PARAMETRI = None
        self.VALIDITA_REC = None
        self.REC_PARAM_RID = None
        self.None = None
        self.PARAM_RIPRADI = None
        self.CAMPI_FLAG_55 = None
        self.FLAG_1 = None
        self.FLAG_2 = None
        self.FLAG_3 = None
        self.FLAG_4 = None
        self.FLAG_5 = None
        self.FLAG_6 = None
        self.FLAG_7 = None
        self.FLAG_8 = None
        self.FILLER_FLAG = None
        self.CAMPI_FLAG_RID = None
        self.CAMPO_FLAG = None
        self.CAMPI_DATE_55 = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.DATA_6 = None
        self.DATA_7 = None
        self.DATA_8 = None
        self.CAMPI_DATE_RID = None
        self.CAMPO_DATA = None
        self.CAMPI_NUMERI_55 = None
        self.PAR_PROGR_SESS = None
        self.PAR_PROGR_SORTER = None
        self.PAR_PROGR_PRESPED = None
        self.PAR_FITTIZIO_1 = None
        self.NUM_TRASF_DA_MAG_4 = None
        self.None = None
        self.PAR_RESI_SS = None
        self.None = None
        self.CAMPI_NUMERI_RID = None
        self.CAMPO_NUMERO = None
        self.CAMPI_CHIAVE_55 = None
        self.KEY_1 = None
        self.KEY_2 = None
        self.KEY_3 = None
        self.KEY_4 = None
        self.CAMPI_CHIAVE_RID = None
        self.CAMPO_CHIAVE = None
        self.PARAMETRI_VARI = None
        self.REC_MOVTRANS = None
        self.D_MOVMAG = None
        self.RIF_INTERNO = None
        self.NUMERO_RIGA = None
        self.RIF_ORDINE = None
        self.RIF_BOLLA_FORN = None
        self.CLI_FINALE = None
        self.C_MAT = None
        self.CONTO = None
        self.C_OPE = None
        self.PREZZO = None
        self.COSTO_STD = None
        self.SETTIMANA = None
        self.FILLER_MOVMAG = None
        self.CATEG_GHELDA = None
        self.MOD_IMPUTAZ = None
        self.DATA_AGG_TRASF_MOV = None
        self.MAGAZZINO = None
        self.DIVISA = None
        self.UN_MIS_FATT = None
        self.QTA_TAGLIE = None
        self.QTA_TAGLIA = None
        self.QUANTITA = None
        self.VAL_REC = None
        self.RIF_INTR_COM = None
        self.DATA_COM = None
        self.NUMERO_COM = None
        self.RIF_INTR_COM_RID = None
        self.QTA_8_MEM = None
        self.QTA_T_MEM = None
        self.CONTO_COM = None
        self.None = None
        self.None = None
        self.NEG_COM = None
        self.NEG_MEM = None
        self.CONTO_FORN = None
        self.MAG_CARICO = None
        self.NOME_PROGRAMMA = "CNTRRIE4"
        self.CONT_LETT = None
        self.CONT_GIAC_RIP = None
        self.ELEM_EFF_COM = None
        self.C_MAT_OUT = None
        self.C_MAT_INPUT_MEM = None
        self.PARDEED = None
        self.QD_PARAMETRI = None
        self.QD_STATO = None
        self.QD_NR_DEC = None
        self.QD_LL_A = None
        self.QD_LL_B = None
        self.None = None
        self.DEED_X_14 = None
        self.DEED_9_14 = None
        self.CAMPI_COMODO = None
        self.C_MAT_INPUT = None
        self.C_MAT_INP_RID = None
        self.C_MAT_FINE = None
        self.C_SORTER_INPUT = None
        self.C_SORTER_INP_RID = None
        self.C_SORTER_INP_RID_X = None
        self.C_OVERFLOW_SORTER = None
        self.C_STESO_INPUT = None
        self.C_SORTER_PREF_INPUT = None
        self.C_STESO_INP_RID = None
        self.MOLTIPLIC = None
        self.FINITO = None
        self.END_FILE = None
        self.NUM_P = None
        self.NUMERO_INP = None
        self.NUMERO_FINE = None
        self.NEGOZIO_INP = None
        self.None = None
        self.QTA_MEM = None
        self.QTA_COM = None
        self.C_MAT_MEM = None
        self.DESCRIZIONE = None
        self.BOLLE_COMODO = None
        self.MEM_COD_IN = None
        self.MEM_COD_SORTER = None
        self.None = None
        self.None = None
        self.MEM_COD_STESO = None
        self.MEM_C_MAT = None
        self.CAMPI_UTILI = None
        self.TIPO_TESTATA = 0
        self.QTA_TOT = None
        self.TOT_RIGA_C = None
        self.C_MAT_MEM = None
        self.IND_RIGA = None
        self.IND_PAG = None
        self.DISP_15 = None
        self.COSTO_MEM = None
        self.PREZZO_MEM = None
        self.D_CONTO_MEM = None
        self.TOT_COSTO = None
        self.TOT_PREZZO = None
        self.IND_FILE = None
        self.D_COSTO_ST_M = None
        self.PROGR = 0
        self.NUMERO_BOLLE = None
        self.NUMERO_CAPI = None
        self.PARTAB = None
        self.QT_PARAMETRI = None
        self.QT_STATO = None
        self.QT_NUM_ELEM_EFF = None
        self.QT_NUM_ELEM_MAX = None
        self.QT_LL_ELEM = None
        self.QT_ADDR_KEY = None
        self.QT_LL_KEY = None
        self.QT_INDEX_ELEM = None
        self.QT_FUNZIONE = None
        self.NUM_ELEM_MAX = 8000
        self.LL_ELEM = 42
        self.LL_KEY = 8
        self.ADDR_KEY = 1
        self.FLAG_OK = None
        self.FLAG_CURSORE = None
        self.EAN_DISPLAY = None
        self.ADDR_KEY_RIP = 9
        self.QTA_TOT_GIAC = None
        self.QTA_TOT_COM = None
        self.QTA_TOT_LETT = None
        self.QTA_TOT_GEN = None
        self.QTA_TOT_GIAC_GEN = None
        self.QTA_TOT_LETT_GEN = None
        self.QTA_T = None
        self.QTA_TOT_T = None
        self.FLAG_1 = None
        self.COM_C_MAT = None
        self.COM_C_MAT_1 = None
        self.None = None
        self.COM_C_MAT_21 = None
        self.COM_C_MAT_22 = None
        self.COM_C_MAT_23 = None
        self.None = None
        self.None = None
        self.CHIAVE_COM = None
        self.None = None
        self.TIPO_C = None
        self.BOLLA_C = None
        self.NEG_C = None
        self.C_MAT_TRANS = None
        self.C_MAT_TRANSITO = None
        self.MODELLO = None
        self.MOD_RID = None
        self.COLLEZIONE = None
        self.CLASSE = None
        self.STAGIONE = None
        self.PROGR_MOD = None
        self.ANNO = None
        self.ARTICOLO = None
        self.ART_RID = None
        self.GR_MERC = None
        self.None = None
        self.VEST_A = None
        self.PEZZO_A = None
        self.PROGR_ART = None
        self.None = None
        self.None = None
        self.PREFISSO_V_F = None
        self.SOCIETA_MOD = None
        self.COLORE = None
        self.C_MAT_TRANS_RID = None
        self.COD_IN = None
        self.C_MAT_A_BARRE = None
        self.MODELLO = None
        self.MOD_RID = None
        self.MARCHIO = None
        self.CLASSE = None
        self.STAGIONE = None
        self.PROGR_ART = None
        self.ANNO = None
        self.VESTIBILITA = None
        self.SOCIETA = None
        self.None = None
        self.PREFBC_V_F = None
        self.SOC_BC_MOD = None
        self.PEZZO = None
        self.VARIANTE_COL = None
        self.TAGLIA = None
        self.C_MAT_A_BARRE_RID = None
        self.COL_COM = None
        self.PRE_COL = None
        self.COL_VAR = None
        self.COL_COM_R = None
        self.RIGA_VIDEO = None
        self.NRO_VIDEO = None
        self.None = ". "
        self.RICHIESTA = " "*14
        self.None = " "*None
        self.D_C_MAT = " "*8
        self.RIGA_VIDEO_2 = None
        self.None = " "*None
        self.PROGR_D = None
        self.None = " "*None
        self.RIMANENZA = None
        self.CAMPI_STR = None
        self.STR_TG = "  tg1 tg2 tg3 tg4 tg5 tg6 tg7 tg8 tg9 tg10 Tot"
        self.STR_TEST = "SITUAZIONE RIENTRI           "
        self.STR_TEST_1 = "SITUAZIONE INVENTARIO FILIALE TOTALI PER CLASSE"
        self.MAG_VALIDO = 7
        self.PAR_EURO = None
        self.EU_PARAMETRI = None
        self.EU_STATO = None
        self.EU_NOME_DATA_SET = None
        self.EU_REC_SET_CORR = None
        self.EU_REC_SET_ALTRO = None
        self.EU_DIVISA_CORR = None
        self.EU_MSG = None
        self.PARDAT_2000 = None
        self.RIF_INTR_2000 = None
        self.None = None
        self.AAAAMMGG_2000 = None
        self.None = None
        self.AAAA_2000 = None
        self.None = None
        self.FISSO_2000 = None
        self.AA_2000 = None
        self.None = None
        self.None = None
        self.A_2000 = None
        self.MMGG_2000 = None
        self.None = None
        self.MM_2000 = None
        self.GG_2000 = None
        self.None = None
        self.None = None
        self.AAMMGG_2000 = None
        self.None = None
        self.AAAAMM_2000 = None
        self.None = None
        self.NUM_2000 = None
        self.RIF_INTR_2000_RID = None
        self.FLAG_SORTER = None
        self.PROGRESSIVO_SESSIONE = 0
        self.None = None
        self.PREF_PROGR_SESS = None
        self.None = None
        self.None = None
        self.PROGRESSIVO_SESSIONE_STR = None
        self.FLAG_RIPARTENZA = 0
        self.FLAG_PRIMA_VOLTA = None
        self.PREF_STESO_APPESO = None
        self.FLAG_PRIMA_VOLTA_STESO = None
        self.XD = "N"
        self.X10 = None
        self.N10 = None
        self.RAGGR_1_COM = None
        self.RAGGR_2_COM = None
        self.RAGGR_3_COM = None
        self.NRO_CELLE = None
        self.MAX_CELLE = 10000
        self.TAB_CELLE = None
        self.EL_CELLE = None
        self.RAGGR_1 = None
        self.RAGGR_2 = None
        self.RAGGR_3 = None
        self.NRO_CAPI = None
        self.STAGIONE_MEM = None
        self.L = None
        self.L_MEM = None
        self.Z4 = None
        self.Z5 = None
        self.FLAG_ERRORE = None
        self.NRO_CAPI_LETTI = None
        self.PARDAT_2000_U = None
        self.RIF_INTR_2000 = None
        self.None = None
        self.AAAAMMGG_2000 = None
        self.None = None
        self.AAAA_2000 = None
        self.None = None
        self.FISSO_2000 = None
        self.AA_2000 = None
        self.None = None
        self.None = None
        self.A_2000 = None
        self.MMGG_2000 = None
        self.None = None
        self.MM_2000 = None
        self.GG_2000 = None
        self.None = None
        self.None = None
        self.AAMMGG_2000 = None
        self.None = None
        self.AAAAMM_2000 = None
        self.None = None
        self.NUM_2000 = None
        self.RIF_INTR_2000_RID = None
        self.X3 = None
        self.N3 = None
        self.FLAG_PERMANENTE = None
        self.PAR_PERM = None
        self.PERM_STATO = None
        self.PERM_CMAT = None
        self.PERM_DATA_VAL = None
        self.DATA_X_PERM = None
        self.None = None
        self.AA_X_PERM = None
        self.DT_X_PERM = None
        self.C_MAT_INPUT_ORIG = None
        self.C_MAT_INPUT_ORIG_10 = None
        self.SOCIETA_GRUPPO = None
        self.TALLY_COM = None
        self.FLAG_OK_BARUNI = None
        self.FLAG_BARUNI = None
        self.C_MAT_INPUT_BARUNI = None
        self.None = None
        self.SKU_BARUNI = None
        self.None = None
        self.SOC_BARUNI = None
        self.None = None
        self.PROG_BARUNI = None
        self.STRINGA_COMANDO = None
        self.ERR2 = None
        self.BARCODE_NEG_INPUT = None
        self.BARCODE_NEG_MEM = None
        self.PY_INPUT_REC = None
        self.INPUT_VAL = None
        self.PY_OUTPUT_REC = None
        self.OUTPUT_VAL_RET = None
        self.OUTPUT_VAL_BARCODE = None
        self.OUTPUT_VAL_MSG = None
        self.CONTAT_EAN = None
        self.TAB_EAN_MOD_BC = None
        self.EL_EAN_MOD_BC = None
        self.IND_ANAMAT_EAN = None
        self.IND_ANAMAT_EAN_R = None
        self.FLAG_VIRTUALE = None
        self.N_VIRTUALE = None
        self.INDICE_VIR = None
        self.TAB_R_VIRTUALE = None
        self.QTA_TAGLIE = None
        self.QTA_TAGLIA = None
        self.FLAG_ALLOCAZIONE = None
        self.COD_ALLOC_IN = None
        self.MAG_P_IN = None
        self.MAG_P_IN_R = None
        self.OK_MAG = None
        self.FLAG_GIAC_NEG = 'N'
        self.STRINGA_CURRENT_DATE = None
        self.DATA_CURRENT_DATE = None
        self.None = None
        self.AAAA_CURRENT_DATE = None
        self.MM_CURRENT_DATE = None
        self.GG_CURRENT_DATE = None
        self.ORA_CURRENT_DATE = None
        self.None = None
        self.HH_CURRENT_DATE = None
        self.MI_CURRENT_DATE = None
        self.SS_CURRENT_DATE = None
        self.DATA_ORA_CURRENT_DATE = None
        self.W_COMMON = None
        self.W_SOTTOSISTEMA = None
        self.W_DATI_W_IMAGE = None
        self.W_NOME_DATA_BASE_1 = None
        self.W_TAB_DB = None
        self.W_NOME_DB = None
        self.None = None
        self.W_NOME_DB_1 = None
        self.W_NOME_DB_2 = None
        self.W_NOME_DB_3 = None
        self.W_NOME_DB_4 = None
        self.W_NOME_DB_5 = None
        self.W_NOME_DB_6 = None
        self.W_NOME_DB_7 = None
        self.W_NOME_DB_8 = None
        self.W_MODO = None
        self.W_NOME_CAMPO = None
        self.W_VALORE_CAMPO = None
        self.W_DB_KEY_P16 = None
        self.W_VAL_1 = None
        self.W_VALORE_CAMPO_W = None
        self.W_DB_KEY_W = None
        self.None = None
        self.W_VAL_2 = None
        self.W_VALORE_CAMPO_HW = None
        self.W_DB_KEY_HW = None
        self.None = None
        self.W_VAL_3 = None
        self.W_VALORE_CAMPO_X4 = None
        self.W_DB_KEY_X4 = None
        self.None = None
        self.W_VAL_4 = None
        self.W_VALORE_CAMPO_12 = None
        self.None = None
        self.W_VAL_5 = None
        self.W_VALORE_CAMPO_15 = None
        self.W_NOME_DATA_SET = None
        self.W_PAROLA_CHIAVE_1 = None
        self.W_TUTTO_RECORD = None
        self.W_CHIUSURA_TOTALE = None
        self.W_CA_IMAGE = None
        self.W_STATUS_WORD_IMAGE = None
        self.W_WORD_L_BUFF = None
        self.W_WORD_ATT = None
        self.W_WORD_SIN = None
        self.W_WORD_PREC = None
        self.W_WORD_SEG = None
        self.W_DATI_W_DEL = None
        self.W_CA_DEL = None
        self.W_STATUS_WORD_DEL = None
        self.W_SW = None
        self.W_SW_1 = None
        self.W_SW_2 = None
        self.W_SW_3 = None
        self.W_SW_4 = None
        self.W_SW_5 = None
        self.W_SW_6 = None
        self.W_SW_7 = None
        self.W_SW_8 = None
        self.W_SW_9 = None
        self.W_SW_10 = None
        self.None = None
        self.W_NOME_MODULO = None
        self.W_LL_MODULO = None
        self.W_NOME_PROX_MODULO = None
        self.W_CAMPO_ERRATO = None
        self.W_RIGA = None
        self.W_COLONNA = None
        self.None = None
        self.W_SYSMODULI = None
        self.W_PROX_MODULO = None
        self.W_TERMINALE = None
        self.W_DATI_VIEW = None
        self.W_CA_VIEW = None
        self.W_CSTATUS = None
        self.W_LINGUAGGIO = None
        self.W_LL_CA_VIEW = None
        self.W_EXT_BASIC = None
        self.W_COLLECT_BROWSE = None
        self.W_ULT_TASTO_FUNZ = None
        self.W_NUMERO_ERRORI = None
        self.W_WIND_EN = None
        self.None = None
        self.W_FILLER = None
        self.W_WINDOW_ENH = None
        self.W_MULTIUSAGE = None
        self.W_LABEL_OPTION = None
        self.W_NOME_CFORM = None
        self.W_FILLER = None
        self.W_NOME_NFORM = None
        self.W_FILLER = None
        self.W_FLAG_REPEAT = None
        self.W_FLAG_FREEZE = None
        self.W_NR_RIGHE_CFORM = None
        self.W_LL_BUFFER = None
        self.None = None
        self.W_LOOK_AHEAD = None
        self.W_DELETE_FLAG = None
        self.W_SHOWCONTROL = None
        self.W_FILLER = None
        self.W_PRINTFILE_NUM = None
        self.W_FILERRNUM = None
        self.W_ERRFILNUM = None
        self.W_FORM_STORE_SIZE = None
        self.None = None
        self.None = None
        self.None = None
        self.W_NUM_RECS = None
        self.W_RECNUM = None
        self.None = None
        self.None = None
        self.W_TERMFILENUM = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.None = None
        self.W_RETRIES = None
        self.W_OPTIONS = None
        self.W_ENVIRON = None
        self.W_USER_TIME = None
        self.W_TERM_IDENTIFIER = None
        self.W_LAB_INFO = None
        self.W_NOME_FORMSFILE = None
        self.W_NOME_TERMINALE = None
        self.W_NOME_FORM_TEST = None
        self.W_NOME_FORM_DETT = None
        self.W_LL_FIELD = None
        self.W_FLAGS_STD = None
        self.W_FLAG_ERRORI_STD = None
        self.W_FLAG_COMANDO = None
        self.W_FLAG_RICERCA = None
        self.W_NR_FIELD = None
        self.W_LL_FIELD_MOSSO = None
        self.W_NR_PROX_FIELD = None
        self.W_PRINT_C = None
        self.W_PAGE_C = None
        self.W_DATI_WINDOW = None
        self.W_LL_MAX_WINDOW = None
        self.W_LL_WINDOW = None
        self.W_MESS_X_WINDOW = None
        self.W_FIL_WINDOW = None
        self.W_RESTO_WINDOW = None
        self.W_CAMPO_ERR = None
        self.W_FIL_ERR = None
        self.W_NUM_ERR = None
        self.W_NUM_ERR_X = None
        self.W_FILLER = None
        self.W_LL_CAMPO_ERR = None
        self.W_LL_CAMPO_ERR_2 = None
        self.W_CAMPI_FLAG_STD = None
        self.W_FLAG_FINISH_TEST = None
        self.W_FLAG_FINISH_DETT = None
        self.W_NUMERO_FORMS = None
        self.W_FLAG_LOOP_TEST = None
        self.W_FLAG_TIPO_AGG = None
        self.W_FLAG_CHIUDI_TEST = None
        self.W_FLAG_CHIUDI_DETT = None
        self.W_LL_DISPLAY = None
        self.W_CTL_DISPLAY = None
        self.W_CAMPO_SIGLA = None
        self.W_PAR_TESTP = None
        self.W_LL_MAX_SIGLA = None
        self.W_LL_SIGLA = None
        self.W_SIGLA_OUT = None
        self.W_POS_RC = None
        self.None = None
        self.W_SIGLA_AZ = None
        self.None = None
        self.None = None
        self.W_CAMPO_COMANDO = None
        self.W_CAMPO_PUNTO = None
        self.W_FILLER = None
        self.W_FIL_COM_SPACE = None
        self.W_COMAND_SPACE_1 = None
        self.W_COMAND_SPACE_2 = None
        self.None = None
        self.W_PAR_SOPTV = None
        self.W_FUNZ_SOPTV = None
        self.W_STATO_SOPTV = None
        self.W_TIPO_SOPTV = None
        self.None = None
        self.W_RIGA_V = None
        self.None = None
        self.W_COLONNA_V = None
        self.W_MESSAGGI_COMANDO = None
        self.W_ULT_MESS_COMANDO = None
        self.None = None
        self.W_ULT_MESS_1 = None
        self.W_NR_PAGINA_10_99 = None
        self.None = None
        self.W_NR_PAGINA_1_9 = None
        self.None = None
        self.None = None
        self.W_ULT_MESS_2 = None
        self.None = None
        self.None = None
        self.None = None
        self.W_ZONA_MESSAGGI_FISSI = None
        self.W_ZONA_MESSAGGI_PUNTO = None
        self.W_NR_MESS_PUNTO = None
        self.W_PUNTO_CS = None
        self.W_PUNTO = None
        self.None = None
        self.W_PUNTO_CF = None
        self.W_PUNTO_CO = None
        self.W_PUNTO_A = None
        self.W_PUNTO_P = None
        self.W_PUNTO_V = None
        self.W_PUNTO_PP = None
        self.W_PUNTO_PS = None
        self.W_PUNTO_I = None
        self.W_PUNTO_AR = None
        self.None = None
        self.None = None
        self.W_MESS_FISSO = None
        self.W_FLAG_LAVORO = None
        self.W_DATI_GENERALI = None
        self.W_SIGLA_TERMINALE = None
        self.W_SIGLA_OUT_ASSOCIATO = None
        self.W_TIPO_TER = None
        self.W_NR_OUT_ASSOCIATO = None
        self.W_TIPO_ASSOCIAZIONE = None
        self.W_INDICI_W_COMMON = None
        self.W_INDICE_1 = None
        self.W_INDICE_2 = None
        self.W_INDICE_3 = None
        self.W_INDICE_4 = None
        self.W_INDICE_5 = None
        self.W_INDICE_6 = None
        self.W_INDICE_7 = None
        self.W_INDICE_8 = None
        self.W_INDICI_W_COMMON_RID = None
        self.W_INDICE = None
        self.W_SIGLA_UTENTE = None
        self.W_DATA_DEL_GIORNO = None
        self.W_FORMATO_INTERNO = None
        self.W_FORMATO_ESTERNO_1 = None
        self.W_FORMATO_GG_MM_AA = None
        self.W_FORMATO_ESTERNO_2 = None
        self.W_FORMATO_GG_MMM_AAAA = None
        self.W_FORMATO_GGMMAA = None
        self.W_GG = None
        self.W_MM = None
        self.W_AA = None
        self.W_PARAMETRI_UTE = None
        self.W_CODICE_FISCALE = None
        self.W_CONTI_BASE = None
        self.W_CLIENTI_ITA = None
        self.W_CLIENTI_EXP = None
        self.W_FORNITORI = None
        self.W_AGENTI_ITA = None
        self.W_AGENTI_EXP = None
        self.W_PORTAF_ITA = None
        self.W_PORTAF_EXP = None
        self.W_I_V_A = None
        self.W_RICAVI_ITA_INV = None
        self.W_RICAVI_ITA_PE = None
        self.W_RICAVI_EXP_INV = None
        self.W_RICAVI_EXP_PE = None
        self.W_RICAVI_MP = None
        self.W_TRASPORTI = None
        self.W_IMBALLI = None
        self.W_SCONTI = None
        self.W_BANCHE = None
        self.W_DEBIT_DIV = None
        self.W_CREDIT_DIV = None
        self.W_EFFETTI_SCONTO = None
        self.W_EFFETTI_SBF = None
        self.W_EFFETTI_DOPO_INCASSO = None
        self.W_SPESE_VARIE_BOLLI = None
        self.W_RICAVI_CAUZ = None
        self.W_COSTI = None
        self.W_FORN_ANTICIPI = None
        self.W_CLIENTI_ANTICIPI = None
        self.W_CONTO_RAG_1 = None
        self.W_CONTO_RAG_2 = None
        self.W_PERDITE_PROFITTI = None
        self.W_BILANCIO_CHIUSURA = None
        self.W_BILANCIO_APERTURA = None
        self.W_CONTI_BASE_RID = None
        self.W_CONTO_BASE = None
        self.W_TIPO_LANCIO = None
        self.W_NUM_TERM = None
        self.W_UTENTE = None
        self.W_GRUPPO = None
        self.W_ACCOUNT = None
        self.W_IND_REC_PARAM = None
        self.AREE_VARIE_MENUTREE = None
        self.W_DIRECTORY = None
        self.W_PARAMETRI_FUNZIONE = None
        self.W_PAR_FUNZ_RID = None
        self.W_FLAGS = None
        self.W_FLAG_1 = None
        self.W_FLAG_2 = None
        self.W_FLAG_3 = None
        self.W_FLAG_4 = None
        self.W_FLAG_5 = None
        self.W_FLAG_6 = None
        self.W_FLAG_7 = None
        self.W_FLAG_8 = None
        self.None = None

        
    def ASSSVSRT(self):	# Linea Source Cobol: non definita
        pass

    def INIZIO(self):	# Linea Source Cobol: 2028
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

    def FINE(self):	# Linea Source Cobol: 2088
        pass

    def S_SET_1(self):	# Linea Source Cobol: 2093
        pass

    def S_SET_3(self):	# Linea Source Cobol: 2122
        pass

    def LEGGI_PARAMDT(self):	# Linea Source Cobol: 2132
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

    def DBGET_PARAMDT(self):	# Linea Source Cobol: 2176
        self.TTDBGET()
        self.REC_PARAM_RID = self.AREA_REC_SET

    def AGG_DPARAM(self):	# Linea Source Cobol: 2185
        self.W_NOME_DATA_SET = "DPARAM"
        self.PAR_PROGR_SESS = 1
        self.AREA_REC_SET = self.REC_PARAM_RID
        self.TTUPDATE()

    def ELABORA(self):	# Linea Source Cobol: 2204
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

    def LEGGI_ARTICOLI(self):	# Linea Source Cobol: 2268
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

    def LEGGI_SORTER(self):	# Linea Source Cobol: 2536
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

    def SELECT_EAN(self):	# Linea Source Cobol: 2641
        self.S_SET_3()
        print("SELECT-EAN ",self.APP_MODELLO_EAN_13_X)
        self.CONTA_EAN = 0
        print("SQLCODE = ",self.SQLCODE)
        print("CONTA-EAN = ",self.CONTA_EAN)
        print("EX-SELECT-EAN")
        self.TEST_ERR()
        self.S_SET_1()

    def SELECT_EAN_EX(self):	# Linea Source Cobol: 2683
        pass

    def DICH_CURSORE_EAN(self):	# Linea Source Cobol: 2698
        print("DICH-CURSORE-EAN")
        print("EX-DICH-CURSORE-EAN")

    def APRI_CURSORE_EAN(self):	# Linea Source Cobol: 2729
        self.ER_DESCRIZIONE = 'OPEN-CURSMN'
        self.TEST_ERR()

    def LEGGI_CURSORE_EAN(self):	# Linea Source Cobol: 2738
        print("LEGGI-CURSORE-EAN")
        self.FLAG_CURSORE = 0
        self.CONTAT_EAN = 0
        self.INIT_APP_MODELLO_BC()
        self.EAN_DISPLAY = self.APP_MODELLO_BC
        print(self.CONTAT_EAN,' - ',self.EAN_DISPLAY)
        self.EL_EAN_MOD_BC(CONTAT_EAN) = self.APP_MODELLO_BC
        self.FLAG_CURSORE = 1
        print("EX-LEGGI-CURSORE-EAN")

    def CHIUDI_CURSORE_EAN(self):	# Linea Source Cobol: 2779
        self.ER_DESCRIZIONE = 'CLOSE-CURSMN'
        self.TEST_ERR()

    def VISUALIZZA_EAN(self):	# Linea Source Cobol: 2788
        self.S_SET_3()
        print("VISUALIZZA-EAN")
        self.DICH_CURSORE_EAN()
        self.APRI_CURSORE_EAN()
        self.LEGGI_CURSORE_EAN()
        self.CHIUDI_CURSORE_EAN()
        self.TEST_ERR()
        print("EX-VISUALIZZA-EAN")
        self.S_SET_1()

    def VISUALIZZA_EAN_EX(self):	# Linea Source Cobol: 2804
        pass

    def VERIFICA_EAN(self):	# Linea Source Cobol: 2807
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

    def VERIFICA_EAN_EX(self):	# Linea Source Cobol: 2880
        pass

    def GET_MODELLO_BC(self):	# Linea Source Cobol: 2885
        self.S_SET_3()
        print("GET-MODELLO-BC")
        self.APP_MODELLO_DT = SPACES
        self.APP_VARIANTE = SPACES
        self.APP_NUM_TAGLIA_OE = 0
        self.TEST_ERR()
        self.INIT_APP_MODELLO_BC()
        print("EX-GET-MODELLO-BC")
        self.S_SET_1()

    def INIT_APP_MODELLO_BC(self):	# Linea Source Cobol: 2931
        self.TG = self.APP_NUM_TAGLIA_OE
        self.APP_MODELLO_BC = self.APP_MODELLO_BC_9
        print(self.APP_MODELLO_BC)

    def ACCETTA_EAN(self):	# Linea Source Cobol: 2953
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

    def ACCETTA_EAN_EX(self):	# Linea Source Cobol: 2980
        pass

    def ANNULLA_PRECEDENTE(self):	# Linea Source Cobol: 2984
        print("nulla da annullare")
        self.CANC_SORTER()
        self.CANC_STESA()
        self.AGGIUSTA_TAB_CELLE()
        self.ANNULLA_SITPF_VIRTUALE()
        print("annullata ULTIMA lettura")

    def AGGIUSTA_TAB_CELLE(self):	# Linea Source Cobol: 3025
        self.NRO_CELLE = 0
        self.EL_CELLE(L_MEM) = self.EL_CELLE(NRO_CELLE)

    def TTDBFIND(self):	# Linea Source Cobol: 3041
        self.W_MODO = 1
        self.W_INDICE_8 = 3

    def TTDBGET(self):	# Linea Source Cobol: 3067
        self.W_INDICE_8 = 4

    def TTDBGET_M(self):	# Linea Source Cobol: 3093
        pass

    def NIENTE(self):	# Linea Source Cobol: 3095
        pass

    def TTLOCK(self):	# Linea Source Cobol: 3100
        self.W_INDICE_8 = 5

    def TTUPDATE(self):	# Linea Source Cobol: 3123
        self.W_MODO = 1
        self.W_INDICE_8 = 9

    def TTUNLOCK(self):	# Linea Source Cobol: 3152
        self.W_MODO = 1
        self.W_INDICE_8 = 8

    def TTDBPUT(self):	# Linea Source Cobol: 3177
        self.W_MODO = 1
        self.W_INDICE_8 = 7

    def TTDBCLOSE(self):	# Linea Source Cobol: 3204
        self.W_INDICE_8 = 1

    def TTDELETE(self):	# Linea Source Cobol: 3229
        self.W_MODO = 1
        self.W_INDICE_8 = 2

    def CONTROLLA_SORTER(self):	# Linea Source Cobol: 3256
        print("CONTROLLA-SORTER")
        self.CONTA_CAPO = 0
        self.CAPO_ID_BARCODE = self.C_SORTER_INP_RID
        self.BEGIN_RC()
        self.SELECT_CAPO()
        self.S_COMMIT()
        print("C-SORTER ESISTENTE")
        print("EX-CONTROLLA-SORTER")

    def SELECT_CAPO(self):	# Linea Source Cobol: 3282
        print("SELECT-CAPO")
        self.ER_DESCRIZIONE = "SELECT MAGAUTO.CAPO"
        self.TEST_ERR()
        print("EX-SELECT-CAPO")

    def SELECT_CAPO_EX(self):	# Linea Source Cobol: 3295
        pass

    def CANC_SORTER(self):	# Linea Source Cobol: 3300
        print("CANC-SORTER")
        self.CAPO_ID_BARCODE = self.MEM_COD_SORTER
        self.BEGIN_RC()
        self.DELETE_CAPO()
        self.S_COMMIT()
        print("EX-CANC-SORTER")

    def DELETE_CAPO(self):	# Linea Source Cobol: 3319
        print("DELETE-CAPO")
        self.ER_DESCRIZIONE = "DELETE MAGAUTO.CAPO"
        self.TEST_ERR()
        print("EX-DELETE-CAPO")

    def DELETE_CAPO_EX(self):	# Linea Source Cobol: 3331
        pass

    def CANC_STESA(self):	# Linea Source Cobol: 3336
        print("CANC-STESA")
        self.BEGIN_RC()
        self.DELETE_CAPOSA()
        self.S_COMMIT()
        print("EX-CANC-STESA")

    def DELETE_CAPOSA(self):	# Linea Source Cobol: 3357
        self.ER_DESCRIZIONE = "DELETE STESAUTO.CAPO"
        self.TEST_ERR()

    def DELETE_CAPOSA_EX(self):	# Linea Source Cobol: 3365
        pass

    def CONTROLLA_STESAUTO(self):	# Linea Source Cobol: 3371
        self.CONTA_CAPO = 0
        self.BEGIN_RC()
        self.SELECT_CAPOSA()
        print("C-SORTER ESISTENTE")
        self.SELECT_CAPOSMA()
        print("C-SORTER SMARRITO")
        self.SELECT_CAPOPRE()
        print("C-SORTER PRESPEDITO")
        self.S_COMMIT()

    def SELECT_CAPOSA(self):	# Linea Source Cobol: 3406
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CAPO"
        self.TEST_ERR()

    def SELECT_CAPOSA_EX(self):	# Linea Source Cobol: 3415
        pass

    def SELECT_CAPOSMA(self):	# Linea Source Cobol: 3420
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CAPO_SMARRITO"
        self.TEST_ERR()

    def SELECT_CAPOSMA_EX(self):	# Linea Source Cobol: 3429
        pass

    def SELECT_CAPOPRE(self):	# Linea Source Cobol: 3432
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CAPO_PRESPED"
        self.TEST_ERR()

    def SELECT_CAPOPRE_EX(self):	# Linea Source Cobol: 3441
        pass

    def CONTROLLA_CLASSE_AMMESSA(self):	# Linea Source Cobol: 3447
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

    def SELECT_CLASSI_AMMESSE(self):	# Linea Source Cobol: 3472
        self.ER_DESCRIZIONE = "SELECT STESAUTO.CLASSI-AMMESSE"
        self.TEST_ERR()

    def SELECT_CLASSI_AMMESSE_EX(self):	# Linea Source Cobol: 3486
        pass

    def S_COMMIT(self):	# Linea Source Cobol: 3490
        self.ER_DESCRIZIONE = "COMMIT WORK"
        self.TEST_ERR()

    def S_COMMIT_EX(self):	# Linea Source Cobol: 3496
        pass

    def BEGIN_RC(self):	# Linea Source Cobol: 3500
        self.ER_DESCRIZIONE = "BEGIN WORK RC"
        self.TEST_ERR()

    def BEGIN_RC_EX(self):	# Linea Source Cobol: 3506
        pass

    def TEST_ERR(self):	# Linea Source Cobol: 3510
        self.SQL_STATUS = self.SQLCODE

    def TEST_ERR_EX(self):	# Linea Source Cobol: 3517
        pass

    def CREA_CAPO(self):	# Linea Source Cobol: 3521
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

    def BEGIN_CS(self):	# Linea Source Cobol: 3559
        self.ER_DESCRIZIONE = "BEGIN WORK CS"
        self.TEST_ERR()

    def BEGIN_CS_EX(self):	# Linea Source Cobol: 3565
        pass

    def INSERISCI_CAPO(self):	# Linea Source Cobol: 3569
        self.ER_DESCRIZIONE = "Insert MAGAUTO.CAPO "
        self.TEST_ERR()

    def INSERISCI_CAPO_EX(self):	# Linea Source Cobol: 3592
        pass

    def CREA_CAPOSA(self):	# Linea Source Cobol: 3597
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

    def INSERISCI_CAPOSA(self):	# Linea Source Cobol: 3643
        self.ER_DESCRIZIONE = "Insert STESAUTO.CAPO "
        self.TEST_ERR()

    def INSERISCI_CAPOSA_EX(self):	# Linea Source Cobol: 3669
        pass

    def LEGGI_PARAM_IMPIANTO(self):	# Linea Source Cobol: 3674
        self.TEST_PARAM_IMPIANTO()
        print("Nro max celle errato dai parametri")

    def TEST_PARAM_IMPIANTO(self):	# Linea Source Cobol: 3687
        self.BEGIN_RC()
        self.SELECT_PARAM_IMPIANTO()
        print("Non trovati parametri")
        self.S_COMMIT()

    def SELECT_PARAM_IMPIANTO(self):	# Linea Source Cobol: 3705
        self.ER_DESCRIZIONE = "SELECT PARAM-IMPIANTO-PF "
        self.TEST_ERR()

    def CONTA_CELLE(self):	# Linea Source Cobol: 3716
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

    def ELABORA_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3764
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

    def ELABORA_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3811
        pass

    def SELECT_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3814
        self.ER_DESCRIZIONE = "SELECT SITPF-VIRTUALE "
        self.TEST_ERR()
        self.S_COMMIT()

    def SELECT_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3840
        pass

    def CONTROLLA_GIACENZA(self):	# Linea Source Cobol: 3842
        self.FLAG_GIAC_NEG = 'S'
        print("Manca Giac Virtuale, CMAT letto ugualmente")

    def CONTROLLA_GIACENZA_EX(self):	# Linea Source Cobol: 3884
        pass

    def UPDATE_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3887
        self.SITPFVIR_DT_UV = self.W_FORMATO_INTERNO
        self.ER_DESCRIZIONE = "Update SIT-PF-VIRT MANCA GIACENZA"
        self.TEST_ERR()

    def UPDATE_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3909
        pass

    def ANNULLA_SITPF_VIRTUALE(self):	# Linea Source Cobol: 3913
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

    def ANNULLA_SITPF_VIRTUALE_EX(self):	# Linea Source Cobol: 3949
        pass

    def TRATTA_MAG(self):	# Linea Source Cobol: 3952
        print("Mag. Scarico    ")
        print("4 o 6 o 7 ")
        self.MAG_P_IN = input()
        self.QD_LL_A = 3
        self.QD_LL_B = 3
        self.QD_STATOOFPARDEED = 0
        self.QD_NR_DEC = 0
        print("CODICE Errato ",self.MAG_P_IN)
        self.OK_MAG = 1

    def TRATTA_MAG_EX(self):	# Linea Source Cobol: 3971
        pass

    def CONTROLLA_BARUNI(self):	# Linea Source Cobol: 3977
        self.FLAG_OK_BARUNI = 0
        self.TALLY_COM = 0
        self.FLAG_OK_BARUNI = 1

    def CONTROLLA_BARUNI_EX(self):	# Linea Source Cobol: 3986
        pass

    def ELABORA_BARUNI(self):	# Linea Source Cobol: 3989
        self.CHIAMA_DBGENSKU()
        print("Inserire il barcode-negozio    ")
        self.BARCODE_NEG_INPUT = input()
        self.BARCODE_NEG_MEM = self.BARCODE_NEG_INPUT
        self.C_MAT_INPUT = self.BARCODE_NEG_INPUT
        self.FLAG_BARUNI = 'N'
        self.BARCODE_NEG_MEM = self.OUTPUT_VAL_BARCODE
        self.C_MAT_INPUT = self.OUTPUT_VAL_BARCODE
        self.FLAG_BARUNI = 'S'

    def ELABORA_BARUNI_EX(self):	# Linea Source Cobol: 4005
        pass

    def CHIAMA_DBGENSKU(self):	# Linea Source Cobol: 4008
        self.INPUT_VAL = self.C_MAT_INPUT

    def CHIAMA_DBGENSKU_EX(self):	# Linea Source Cobol: 4015
        pass

    def SCRIVO_ALLOCAZIONE(self):	# Linea Source Cobol: 4020
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

    def INSERISCI_ALLOCAZIONE(self):	# Linea Source Cobol: 4047
        self.ER_DESCRIZIONE = "Insert ALLOCAZIONE "
        self.TEST_ERR()

    def INSERISCI_ALLOCAZIONE_EX(self):	# Linea Source Cobol: 4066
        pass

if __name__ == "__main__":
    program = Program()
    program.ASSSVSRT()   
        