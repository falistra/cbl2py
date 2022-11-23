      *      con esclusione degli utenti MC e PROVA                           
      *
      *      tratta solo capi per sorter
001100                                                                          
001200*CONTROL USLINIT,DYNAMIC,BOUNDS,MAP                                       
001300*SET X7=ON                                                                
001400*SET X8=ON                                                                
001500*SET X9=ON                                                                
001600 IDENTIFICATION DIVISION.                                                 
001700 PROGRAM-ID. ASSSVSRT.                                                    
001800*                                                                         
001900*      ricavato da CNTRRIE3 con DISPLAY a 25 colonne e                    
002000*      trattamento cod. progressivo SORTER                                
002100*                                                                         
002200*                                                                         
002300*      da DAFR (RESIDUO):                                                 
002400*                           W-INDICE-5 = 0                                
002500*                           W-VALORE-CAMPO-W = conto fornit.              
002600*                           W-INDICE-7       = cod. mag. carico           
002700*      da MAGVRADI (MAXMAX):W-INDICE-5 = cod. neg                         
002800*      da READRADI (MAXMAX):W-INDICE-5 = cod. neg                         
002900*                                                                         
003000*                                                                         
003100*PREF*   5/10/98                                                          
003200*      forza a 0 il prefisso valido/fallato (per tutti,                   
003300*      perche' non sa il magazzino e quindi non e' in grado di            
003400*      individuare la piattaforma Max&Co)                                 
003500*                                                                         
003600*TERM*   17/11/98                                                         
003700*      W-NUM-TERM portato a 3 cifre                                       
003800*                                                                         
003900*CAMME*       24/05/99                                                    
004000*       gestisce cambio merce anche su mag 8                              
004100*                                                                         
004200*2000*                                                                    
004300*     tratta date a 6 cifre                                               
004400*                                                                         
004500*EURO*        04/12/00                          EURO/LIRE                 
004600*     trattamento importi in EURO                                         
004700*                                                                         
004800*GESTRIP*     20/02/02                                                    
004900*     Gestione ripartenza nel caso di crash sessione                      
005000*     radio                                                               
005100*                                                                         
005200*DISPL25*         04/11/04                                                
005300*   riduzione dei DISPLAY a 25 colonne                                    
005400*                                                                         
005500*SORTER*       05/11/04                                                   
005600*       tratta progressivo sorter                                         
005700*  
      *STESA*        22/09/09
      *       associazione estesa ai capi stesi (ogni sessione tratta
      *       o solo capi appesi o solo capi stesi)
      *
      *COCE*         18/01/10
      *       ad ogni lettura conta il numero di celle necessarie e 
      *       controlla di non superare il max indicato dai parametri
      *
      *COLE*         22/01/10
      *       conta il numero di capi letti
      *   
      *SOLA*         18/02/10
      *       accetta solo a/s/cl ammesse
      *
      *SOLFO*         30/03/10
      *       aggiunge fornitore alle condizioni di ammissione
      *  
      *COCASMA*       26/10/10
      *       controlla esistenza capo anche su STESAUTO_CAPO_SMARRITO  e 
      *       su STESAUTO_CAPO_PRESPED e
      *       rifiuta se presente
      *
      *PERMANOSO*     13/03/2013
      *      Capi permanenti non sono ammessi nel sorter
      *  
      *RECEAN*        27/03/2013  -  LAUROS
      *      Anche in presenza di abbinamenti multipli EAN -> barcode
      *      prende per buono il barcode di anno/stagione piu' recente
      *
      *RISE*        18/02/2014
      *      Ripristina segnalazione per esistenza capo appeso su MAGAUTO_CAPO
      *
      *RIFICI*        18/02/2014
      *      Rifiuta cod sorter appeso se uguale a primi 10 cifre di bc
      *
      *LETNPS*        16/09/2014
      *      Chiedere all'operatore se scalare o meno la giacenza virtuale
      *      e in caso positivo scalare la giacenza  su SITPF_VIRTUALE, chiedere
      *      il magazzino di scarico.
      *
      *BARUNI*        21/10/2014
      *      Accetta il barcode unico come codice sparato dall'operatore 
      *      e valorizzare le tabelle MAGAUTO e STESAUTO. Reperire il barcode 
      *      negozio dalla tabella locale mod_sku, se esito negativo, 
      *      chiedere in input.
      *TREAN       25/09/2015
      *      In caso di presenza di piu' EAN dare possibilita' di scelta
      *
      *ESTETA*     20/11/18
      *      estensione taglie
      *************************************
      *NO-DATGE*        12 OTT 2020 VALERIA 
      *     dismissione DATGE >> ELIMINATA ANAMAT_EAN SOSTIRUITA CON
      *         QUERY ADATTATA DA questa query in 
      *         lib_info_from_dbc.get_modello_bc_from_barcode_ean
      *    
005800 ENVIRONMENT DIVISION.                                                    
                                             
006200 SPECIAL-NAMES.  DECIMAL-POINT IS COMMA.             
      *ESTETA* 
      *REPOSITORY.
      *     FUNCTION idxtg
      *      FUNCTION tgxid.                     
      *                                                                         
006300 INPUT-OUTPUT SECTION.                                                    
006500*
006600 DATA DIVISION.                                                           
006700 FILE SECTION.                                                            
006800*                                                                         
006900*                                                                         
007000 WORKING-STORAGE SECTION.                    
      *ESTETA* 
       COPY NTG.                                   
007100*                                                                         
007200 77 ERR-DISP      PIC -(6).                                               
007300 77 IND-A           PIC S9(4) COMP.                                       
007400*DISPL25*                                                                 
007500 77 SALTO PIC S9(4) COMP VALUE 10.                                        
007600 77 IR   PIC S9(4) COMP.                                                  
007700*                              
       77 SINO-DISPLAY PIC XX VALUE "NO".                                                                                          
007800*GESTRIP*                                                                 
007900***********************************************************               
008000*                                                                         
008100*                                                                         
008200 EXEC SQL BEGIN DECLARE SECTION END-EXEC.    
      *ALLOCAZIONI_NPS
       EXEC SQL INCLUDE ALLOC.IF                             
008300*                                                                         
008400 EXEC SQL INCLUDE CAPO.MA END-EXEC. 
008500 01 CONTA-CAPO     PIC S9(9) COMP. 
      *EAN*
      *NO-DATGE*                                                        INIZIO 
      * EXEC SQL INCLUDE EAN.IF END-EXEC.
       01 APP-MODELLO-EAN-X PIC X(14).
       01 PIPPO REDEFINES APP-MODELLO-EAN-X.
         05 FILLER               PIC X.
         05 APP-MODELLO-EAN-13-X PIC X(13).
       01 APP-MODELLO-BC    PIC S9(15) COMP-3.
      * 01 APP-MODELLO-DT    PIC S9(15) COMP-3.

       01 APP-MODELLO-DT    PIC X(15).
       01 APP-MODELLO-DT-RID REDEFINES APP-MODELLO-DT .   
         05 MOD-1-8   PIC X(8).
         05 MOD-9     PIC X.
         05 MOD-10    PIC X.
         05 MOD-11    PIC X.
         05 MOD-12    PIC X.
         05 MOD-13    PIC X.
         05 MOD-14-15 PIC XX.

       01 APP-VARIANTE      PIC X(3).
       01 APP-VARIANTE-RID REDEFINES APP-VARIANTE.
            05 FILLER PIC X.
            05 VAR-2-3 PIC XX.

      * 01 APP-INDICE-TAGLIA PIC 99.
      * 01 APP-INDICE-TAGLIA-RID REDEFINES APP-INDICE-TAGLIA.
      *      05 TG1 PIC X.
      *      05 TG2 PIC X.
       01 APP-NUM-TAGLIA-OE PIC 9.

       01 TG PIC X.
       01 APP-MODELLO-BC-X.
         05 APP-MODELLO-BC-9 PIC 9(14).
      *NO-DATGE*                                                        FINE 

       01 CONTA-EAN     PIC S9(9) COMP.
      *EAN-FINE*
      *STESA*
008400 EXEC SQL INCLUDE CAPO.SA END-EXEC.      
008600*COCE*
       01 PI-MAX-CELLE   PIC S9(4) COMP.
      *SOLA*                                                            inizio
       EXEC SQL INCLUDE CL_AMMESSE.SA END-EXEC.
008700*                                                                 fine
      *LETNPS*                                                          inizio
       EXEC SQL INCLUDE SITPFVIR END-EXEC.
       01 TAB-REG-VIR.
          10 TAB-QTA-GIAC-1              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-2              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-3              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-4              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-5              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-6              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-7              PIC S9(8) COMP. 
          10 TAB-QTA-GIAC-8              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-9              PIC S9(8) COMP.
          10 TAB-QTA-GIAC-10             PIC S9(8) COMP.      
      *LETNPS*                                                          fine
      *BARUNI*                                                          inizio
       EXEC SQL INCLUDE DBCMODSKU.IF END-EXEC.
       01 TAB-MOD-SKU.
           05 EL-MOD-SKU OCCURS 1.
             10 TAB-BARCODE-NEG      PIC X(14).              
      *BARUNI*                                                          fine      
008800 EXEC SQL END DECLARE SECTION END-EXEC.                                   
008900*                                                                         
      *NO-DATGE*                                                        INIZIO 
       01 APP-MODELLO-EAN   PIC 9(14).
      *NO-DATGE*                                                        INIZIO 
009000*                                                                         
009100 01 SQL-CONST                          COPY SQLCONST .          
009200 01 PAR-ERR                            COPY PARERR   .          
009300 01 AREA-HL                            COPY AREAHL  .           
009400 01 AREA-SI                            COPY AREASI  .           
009500*                                                                         
009600***********************************************************               
009700*                                                                         
009800 01 AREA-REC-SET        PIC X(512).                                       
009900*                                                                         
010000 01 FILLER REDEFINES AREA-REC-SET.                                        
010100  05 REC-ANAMAT COPY YANAMAT.                                             
010200*                                                                         
010300 01 FILLER REDEFINES AREA-REC-SET.                                        
010400  05 REC-ANACON COPY YANACON.                                             
010500*                                                                         
010600 01 FILLER REDEFINES AREA-REC-SET.                                        
010700  05 REC-PREZZI COPY YPREZZI.                                             
010800*                                                                         
010900*                                                                         
011000*GESTRIP*                                                                 
011100 01 REC-PARAMETRI         COPY YPARAMDT.                                  
011200 01 REC-PARAM-RID REDEFINES REC-PARAMETRI.                                
011300  03 FILLER               PIC X(4).                                       
011400  03 PARAM-RIPRADI     COPY WPARAM55.                                     
011500*                                                                         
011600*                                                                         
011700 01 REC-MOVTRANS COPY YMOVMAG.                                            
011800*                                                                         
011900*GESTRIP*                                                                 
012000 01 RIF-INTR-COM.                                                         
012100  05 DATA-COM        PIC 9(6).                                            
012200  05 NUMERO-COM      PIC 9(6).                                            
012300 01 RIF-INTR-COM-RID REDEFINES RIF-INTR-COM  PIC 9(12).                   
012400*                                                                         
012500*                                                                         
012600 01 QTA-8-MEM.                                                            
012700  05 QTA-T-MEM   PIC S9(4) COMP   COPY NTGOCCURS.                                  
012800*                                                                         
012900 01 CONTO-COM        PIC 9(8).                                            
013000 01 FILLER REDEFINES CONTO-COM.                                           
013100*CAMME*                                                                   
013200  05 FILLER PIC 9(3).                                                     
013300  05 NEG-COM         PIC 99999.                                           
013400*                                                                         
013500*SORTER*                                                                  
013600 01 NEG-MEM   PIC S9(4) COMP.                                             
013700 01 CONTO-FORN    PIC 9(8).                                               
013800 01 MAG-CARICO    PIC S9(4) COMP.                                         
013900 01 NOME-PROGRAMMA   PIC X(8) VALUE "CNTRRIE4".                           
014000*                                                                         
014100*                                                                         
014200*                                                                         
014300*GESTRIP*                                                                 
014400 01 CONT-LETT        PIC S9(8) COMP.                                      
014500 01 CONT-GIAC-RIP    PIC S9(8) COMP.                                      
014600 01 ELEM-EFF-COM     PIC S9(4) COMP.                                      
014700 01 C-MAT-OUT        PIC 9(15).                                           
014800*                                                                         
014900*SORTER*                                                                  
015000 01 C-MAT-INPUT-MEM   PIC X(14).    
015100*                                                                         
015200*  
      *EAN*
       01 PARDEED     COPY QPARDEED.
       01 DEED-X-14        PIC X(14).
       01 DEED-9-14        PIC 9(14). 
      *EAN-FINE*                                                                                          
015300 01 CAMPI-COMODO.                                                         
015400   05 C-MAT-INPUT    PIC X(14).                                                    
015500   05 C-MAT-INP-RID REDEFINES C-MAT-INPUT PIC 9(14).                      
015600   05 C-MAT-FINE REDEFINES C-MAT-INPUT    PIC X.                          
015700     88 LETT-FINE      VALUE "#".                                         
015800     88 LETT-ANN-ULT   VALUE "%".                                         
015900*SORTER*                                                                  
016000     88 LETT-SORTER    VALUE "S".                                         
016100     88 LETT-NO-SORTER VALUE "N".                                         
016200   05 C-SORTER-INPUT REDEFINES C-MAT-INPUT.                               
016300     10 C-SORTER-INP-RID   PIC 9(10).   
           10 C-SORTER-INP-RID-X REDEFINES C-SORTER-INP-RID PIC X(10).
           10 C-OVERFLOW-SORTER  PIC X(4).
      *STESA*
         05 C-STESO-INPUT REDEFINES C-SORTER-INPUT.
           10  C-SORTER-PREF-INPUT  PIC XX.
           10 C-STESO-INP-RID       PIC 9(8).
      *
016400*                                                                         
016500  05 MOLTIPLIC            PIC S9(4) COMP.                                 
016600   05 FINITO         PIC S9(4) COMP.                                      
016700           88 FINE-LAVORO  VALUE 1.                                       
016800   05 END-FILE       PIC S9(4) COMP.                                      
016900           88 FINE-FILE    VALUE 1.                                       
017000   05 NUM-P          PIC 9(4).                                            
017100   05 NUMERO-INP     PIC 9(6).                                            
017200   05 NUMERO-FINE REDEFINES NUMERO-INP PIC XX.                            
017300   05 NEGOZIO-INP    PIC 999.                                             
017400   05 FILLER REDEFINES NEGOZIO-INP PIC XXX.                               
017500   05 QTA-MEM.                                                            
017600    10 QTA-COM         PIC S9(4) COMP   COPY NTGOCCURS.                           
017700   05 C-MAT-MEM       PIC S9(15) COMP-3.                                  
017800   05 DESCRIZIONE     PIC X(30).                                          
017900   05 BOLLE-COMODO    PIC Z(6).                                           
018000*                                                                         
018100 01 MEM-COD-IN         PIC X(14).                                         
018200*                                                                         
018300 01 MEM-COD-SORTER     PIC 9(10).      
      *STESA*
       01 FILLER REDEFINES MEM-COD-SORTER.
         05 FILLER           PIC XX.
         05 MEM-COD-STESO    PIC 9(8).
018400*                                                                         
018500 01 MEM-C-MAT     PIC S9(15) COMP-3.                                      
018600*                                                                         
018700 01 CAMPI-UTILI.                                                          
018800  05 TIPO-TESTATA    PIC S9(4) COMP VALUE 0.                              
018900  05 QTA-TOT         PIC S9(8) COMP.                                      
019000  05 TOT-RIGA-C      PIC S9(8) COMP.                                      
019100  05 C-MAT-MEM       PIC S9(15) COMP-3.                                   
019200  05 IND-RIGA        PIC S9(4) COMP.                                      
019300  05 IND-PAG         PIC S9(4) COMP.                                      
019400  05 DISP-15         PIC 9(15).                                           
019500  05 COSTO-MEM       PIC S9(9) COMP.                                      
019600  05 PREZZO-MEM      PIC S9(9) COMP.                                      
019700  05 D-CONTO-MEM     PIC X(24).                                           
019800  05 TOT-COSTO       PIC S9(11) COMP-3.                                   
019900  05 TOT-PREZZO      PIC S9(11) COMP-3.                                   
020000  05 IND-FILE           PIC 9(6).                                         
020100  05 D-COSTO-ST-M       PIC X(7).                                         
020200  05 PROGR           PIC S9(4) COMP VALUE 0.                              
020300*                                                                         
020400 01 NUMERO-BOLLE      PIC Z(3).                                           
020500 01 NUMERO-CAPI       PIC Z(5).                                           
020600*                                                                         
020700*                                                                         
020800 01 PARTAB  COPY QPARTAB.                                                 
020900*                                                                         
021000 01 NUM-ELEM-MAX   PIC S9(4) COMP VALUE 8000.                             
021100 01 LL-ELEM        PIC S9(4) COMP VALUE 42.                               
021200 01 LL-KEY         PIC S9(4) COMP VALUE 8.                                
021300 01 ADDR-KEY       PIC S9(4) COMP VALUE 1.
      *
      *EAN*
       01 FLAG-OK             PIC 9.
       01 FLAG-CURSORE    PIC S9(4) COMP.
         88 STOP-CURSORE  VALUE 1.
       01 EAN-DISPLAY        PIC S9(15) COMP-3.     
      *EAN-FINE*                               
021400*GESTRIP*                                                                 
021500 01 ADDR-KEY-RIP   PIC S9(4) COMP VALUE 9.                                
021600*                                                                         
021700*                                                                         
021800*                                                                         
021900 01 QTA-TOT-GIAC        PIC S9(4) COMP.                                   
022000 01 QTA-TOT-COM         PIC S9(8) COMP.                                   
022100 01 QTA-TOT-LETT        PIC S9(8) COMP.                                   
022200 01 QTA-TOT-GEN         PIC S9(8) COMP.                                   
022300 01 QTA-TOT-GIAC-GEN    PIC S9(4) COMP.                                   
022400 01 QTA-TOT-LETT-GEN    PIC S9(8) COMP.                                   
022500 01 QTA-T.                                                                
022600  05 QTA-TOT-T   PIC S9(4) COMP   COPY NTGOCCURS.                               
022700*                                                                         
022800 01 FLAG-1      PIC 9.                                                    
022900*                                                                         
023000*                                                                         
023100*PREF*                                                                    
023200 01 COM-C-MAT.                                                            
023300   05 COM-C-MAT-1   PIC 9(7).                                             
023400   05 FILLER.                                                             
023500     10 COM-C-MAT-21   PIC 9.                                             
023600     10 COM-C-MAT-22   PIC 9.                                             
023700     10 COM-C-MAT-23   PIC 9.                                             
023800   05 FILLER        PIC XXX.                                              
023900   05 FILLER        PIC X.                                                
024000*                                                                         
024100*                                                                         
024200 01 CHIAVE-COM       PIC 9(11).                                           
024300 01 FILLER REDEFINES CHIAVE-COM.                                          
024400  05 TIPO-C    PIC 99.                                                    
024500  05 BOLLA-C   PIC 9(6).                                                  
024600  05 NEG-C         PIC 999.                                               
024700*                                                                         
024800*                                                                         
024900 01 C-MAT-TRANS COPY DANCODMT.                                            
025000 01 COD-IN COPY DANCODBC.                                                 
025100*                                                                         
025200*                                                                         
025300 01 COL-COM.                                                              
025400  05 PRE-COL         PIC 9.                                               
025500  05 COL-VAR         PIC 99.                                              
025600 01 COL-COM-R REDEFINES COL-COM  PIC 999.                                 
025700*                                                                         
025800*                                                                         
025900*DISPL25*                                                                 
026000* 01 RIGA-VIDEO.                                                          
026100*  05 RICHIESTA        PIC X(14) VALUE SPACES.                            
026200*  05 FILLER           PIC XX VALUE SPACES.                               
026300*  05 D-C-MAT          PIC X(8) VALUE SPACES.                             
026400*  05 FILLER           PIC XX VALUE SPACES.                               
026500*  05 PROGR-D          PIC 9(4).                                          
026600*  05 FILLER           PIC XXX VALUE SPACES.                              
026700*  05 RIMANENZA        PIC ---9.                                          
026800*                                                                         
026900 01 RIGA-VIDEO.                
      *COLE*                                                            inizio
        05 NRO-VIDEO        PIC ZZZZ9.
        05 FILLER           PIC XX VALUE ". ".
      *                                                                 fine
027000  05 RICHIESTA        PIC X(14) VALUE SPACES.                             
027100  05 FILLER           PIC XX VALUE SPACES.                                
027200  05 D-C-MAT          PIC X(8) VALUE SPACES.                              
027300*                                                                         
027400 01 RIGA-VIDEO-2.                                                         
027500  05 FILLER           PIC XXXX VALUE SPACES.                              
027600  05 PROGR-D          PIC 9(4).                                           
027700  05 FILLER           PIC XXX VALUE SPACES.                               
027800  05 RIMANENZA        PIC ---9.                                           
027900*                                                                         
028000*                                                                         
                            
039200*                                                                         
039300 01 CAMPI-STR.                                                            
039400  05 STR-TG           PIC X(46) VALUE                                     
039500     "  tg1 tg2 tg3 tg4 tg5 tg6 tg7 tg8 tg9 tg10 Tot".                         
039600  05 STR-TEST         PIC X(29) VALUE                                     
039700     "SITUAZIONE RIENTRI           ".                                     
039800  05 STR-TEST-1       PIC X(47) VALUE                                     
039900     "SITUAZIONE INVENTARIO FILIALE TOTALI PER CLASSE".                   
040000*                                                                         
040100*                                                                         
040200*CAMME*                                                                   
040300*                                                                         
040400 01 MAG-VALIDO PIC S9(4) COMP VALUE 7.                                    
040500*                                                                         
040600*                                                                         
040700*EURO*                                                                    
040800 01 PAR-EURO COPY QPAREURO.                                               
040900*                                                                         
041000 01 PARDAT-2000 COPY QPAR2000.                                            
041100*                                                                         
041200*                                                                         
041300*SORTER*                                                                  
041400 01 FLAG-SORTER    PIC X.                                                 
041500  88 CAPI-SORTER VALUE "S".                                               
041600*                                                                         
041700*GESTRIP*                                                                 
041800 01 PROGRESSIVO-SESSIONE  PIC 9(8) VALUE 0.                               
041900 01 FILLER REDEFINES PROGRESSIVO-SESSIONE.                                
042000   05 PREF-PROGR-SESS    PIC 99.                                          
042100   05 FILLER             PIC 9(6).
       01 FILLER REDEFINES PROGRESSIVO-SESSIONE.
         05 PROGRESSIVO-SESSIONE-STR PIC X(9).                                        
042200 01 FLAG-RIPARTENZA       PIC S9(4) COMP VALUE 0.                         
042300*                                                                         
042400*STESA*
       01 FLAG-PRIMA-VOLTA     PIC X.
        88 PRIMA-VOLTA     VALUE 'S'.
       01 PREF-STESO-APPESO    PIC XX.
        88 SI-APPESO VALUE SPACE.
      *
      *COCE*                                                            inizio
       01 FLAG-PRIMA-VOLTA-STESO PIC X.
        88 PRIMA-VOLTA-STESO     VALUE 'S'. 
        
       01 XD                  PIC X VALUE "N".                          flag per display
        88 SI-DISPLAY VALUE "S".
     
       01 X10.
         05 N10   PIC 9(10). 
       01 RAGGR-1-COM         PIC X(10).
       01 RAGGR-2-COM         PIC X(10).
       01 RAGGR-3-COM         PIC X(10).
      *
       01 NRO-CELLE     PIC S9(9) COMP.
       01 MAX-CELLE     PIC S9(9) COMP VALUE 10000.
       01 TAB-CELLE.
         05 EL-CELLE  OCCURS 10000.
           10 RAGGR-1    PIC X(10).
           10 RAGGR-2    PIC X(10).
           10 RAGGR-3    PIC X(10).
           10 NRO-CAPI   PIC S9(9) COMP.
       01 STAGIONE-MEM  PIC S9(4) COMP.
       01 L             PIC S9(4) COMP.
       01 L-MEM         PIC S9(4) COMP.
       01 Z4            PIC ZZZ9.
       01 Z5            PIC Z(4)9.       
       01 FLAG-ERRORE   PIC S9(4) COMP.
      *         
042500*                                                                 fine  
      *COLE*                                                            inizio
       01 NRO-CAPI-LETTI        PIC S9(9) COMP.
      *                                                                 fine
      *
      *SOLA*                                                            inizio
       01 PARDAT-2000-U COPY QPAR2000.
       
       01 X3.
         05 N3 PIC 999.
      *                                                                 fine      
      *
      *PERMANOSO*                                                       inizio
       01 FLAG-PERMANENTE     PIC S9(4) COMP.
        88 NO-PERMANENTE VALUE 0.
        88 SI-PERMANENTE VALUE 1.
        
006210 01 PAR-PERM                           COPY PARPERM.
       01 DATA-X-PERM         PIC 9(8).
       01 FILLER REDEFINES DATA-X-PERM.
        05 AA-X-PERM          PIC 99.
        05 DT-X-PERM          PIC 9(6).             
        
      *PERMANOSO*                                                       fine
      *
      *
      *RIFICI*                                                          inizio
       01 C-MAT-INPUT-ORIG  PIC X(14).
       01 C-MAT-INPUT-ORIG-10 REDEFINES C-MAT-INPUT-ORIG
                            PIC X(10).
      *RIFICI*                                                          fine
      *
      *BARUNI*                                                          inizio
       01 SOCIETA-GRUPPO    PIC XX.
          88 SOCIETA-VALIDE VALUES ARE "MM", "MN", "MR",
                                       "MA", "DT", "MH".
       01 TALLY-COM         PIC 9(4).
       01 FLAG-OK-BARUNI    PIC 9(4).  
       01 FLAG-BARUNI       PIC X.
          88 SI-BARUNI   VALUE "S".
          88 NO-BARUNI   VALUE "N".
       01 C-MAT-INPUT-BARUNI      PIC X(13).
       01 FILLER REDEFINES C-MAT-INPUT-BARUNI.
         05 SKU-BARUNI      PIC X(8).
         05 FILLER REDEFINES SKU-BARUNI.
            10 SOC-BARUNI   PIC X(2).
            10 FILLER       PIC X(6).
         05 PROG-BARUNI     PIC X(5).
       01 STRINGA-COMANDO   PIC X(256).
       01 ERR2              PIC S9(4) COMP.
       01 BARCODE-NEG-INPUT PIC X(14).
       01 BARCODE-NEG-MEM   PIC X(14).
      *PYTHON NEW
       01  PY-INPUT-REC.
           05  INPUT-VAL           PIC X(14).
       01  PY-OUTPUT-REC.
           05  OUTPUT-VAL-RET     PIC X.
           05  OUTPUT-VAL-BARCODE PIC X(14).
           05  OUTPUT-VAL-MSG     PIC X(60).
      *PYTHON NEW            
      *BARUNI*                                                          fine                
      *trean
       01 CONTAT-EAN        PIC 99.
       01 TAB-EAN-MOD-BC.
         05 EL-EAN-MOD-BC    PIC S9(15) COMP-3 OCCURS 99.
       01 IND-ANAMAT-EAN.
         05 IND-ANAMAT-EAN-R PIC 99.         
      *trean          
      *LETNPS*                                                          inizio
       01 FLAG-VIRTUALE PIC X(1).
       01 N-VIRTUALE PIC S9(4) COMP.
       01 INDICE-VIR PIC S9(4) COMP.
       01 TAB-R-VIRTUALE.
          10 QTA-TAGLIE.
             15 QTA-TAGLIA      PIC S9(4) COMP  COPY NTGOCCURS.  
       01 FLAG-ALLOCAZIONE PIC X(1).
          88 ALLOCO VALUE 'S'.
       01 COD-ALLOC-IN PIC X(12).   
       01 MAG-P-IN         PIC XXX.   
       01 MAG-P-IN-R       PIC 999.             
       01 OK-MAG          PIC S9(4) COMP.                                      
           88 MAG-OK VALUE 1.
       01 FLAG-GIAC-NEG   PIC X(1) VALUE 'N'.                       
      *LETNPS*                                                          fine
       01 STRINGA-CURRENT-DATE.
         05 DATA-CURRENT-DATE     PIC 9(8).
         05 FILLER REDEFINES DATA-CURRENT-DATE.
           10 AAAA-CURRENT-DATE     PIC 9999.
           10 MM-CURRENT-DATE       PIC 99.
           10 GG-CURRENT-DATE       PIC 99.
         05 ORA-CURRENT-DATE      PIC 9(6).
         05 FILLER REDEFINES ORA-CURRENT-DATE.
           10 HH-CURRENT-DATE       PIC 99.
           10 MI-CURRENT-DATE       PIC 99.
           10 SS-CURRENT-DATE       PIC 99.
       01 DATA-ORA-CURRENT-DATE REDEFINES STRINGA-CURRENT-DATE
                                  PIC 9(14). 
042600 LINKAGE SECTION.                                                         
042700*                                                                         
042800 01 W-COMMON COPY WCOMMONW.                                               
042900*                                                                         
043000 EXEC SQL INCLUDE SQLCA END-EXEC.                                         
043100*                                                                         
043200*                                                                         
043300*GESTRIP*                                                                 
043400*PROCEDURE DIVISION USING W-COMMON                                        
043500 PROCEDURE DIVISION USING W-COMMON SQLCA.                                 
043600*                                                                         
043700*                                                                         
043800 INIZIO.                                                                  
043900*        
      *NO-DATGE*    valeria dafare da togliere                                                    INIZIO 
014300*        PERFORM S-CONNECT-3     THRU S-CONNECT-3-EX                       
014400*        IF SQLCODE NOT = OK                                               
014500*           DISPLAY "Errore CONNECT SINIR " UPON SYSERR   
014600*           STOP RUN.                                                      
      *NO-DATGE*                                                        FINE 
            
044000*SORTER*                                                                  
044100     PERFORM S-SET-1 THRU S-SET-1-EX.                                     
044200*                                                                         
044300*                                                                         
044400*EURO*                                                                    
044500*    MOVE 010110 TO W-FORMATO-INTERNO.                                    
044600     MOVE W-FORMATO-INTERNO TO AAMMGG-2000 OF PARDAT-2000.                               
044700     COPY P2000.                                                          
044800*                                                                         
044900*                                                                         
045000     MOVE 0 TO FINITO END-FILE.                                           
045100*GESTRIP*                                                                 
045200*                                                                         
045300     MOVE 3 TO W-MODO.                                                    
045400     MOVE "DPARAM;" TO W-NOME-DATA-SET.                                   
      *     display "valeria ttlock".
045500     PERFORM TTLOCK THRU EX-TTLOCK.                                       
      *     display "valeria ex-ttlock".
045600     PERFORM LEGGI-PARAMDT THRU EX-LEGGI-PARAMDT.                         
045700     PERFORM AGG-DPARAM THRU EX-AGG-DPARAM.                               
      *     display "valeria ttunlock".
045800     PERFORM TTUNLOCK THRU EX-TTUNLOCK.  
      *     display "valeria ex-ttunlock".
      *                                                             
046000     PERFORM ELABORA THRU EX-ELABORA.                                     
046100*                                                                         
      *NO-DATGE*                                                        INIZIO 
046200*     PERFORM S-SET-2 THRU S-SET-2-EX.                                     
      ****valeria dafare      PERFORM S-SET-3 THRU S-SET-3-EX.                                                                       
      *NO-DATGE*                                                        fine 
046300*                                                                         
      *    display "valeria asssvsrt fine".
046400 FINE.                                                                    
046500     EXIT PROGRAM.                                                        
046600*                                                                         
046700*                                                                         
046800*SORTER*                                                                  
046900 S-SET-1.                                                                 
047000        EXEC SQL                                                          
047100           SET CONNECTION 'DB1'                                           
047200        END-EXEC.                                                         
047300 S-SET-1-EX.                                                              
047400     EXIT.                                                                
047500*                                                                         
047600*                                                                         
      *NO-DATGE*                                                        INIZIO 
047700* S-SET-2.                                                                 
047800*        EXEC SQL                                                          
047900*           SET CONNECTION 'DB2'                                           
048000*        END-EXEC.                                                         
048100* S-SET-2-EX.                                                              
048200*     EXIT.                                                                
      *

      *NO-DATGE*    valeria dafare da togliere                                                    INIZIO 
016800* S-CONNECT-3.                                                               
016900*     EXEC SQL               
017000*          CONNECT TO 'SINIR.PUB.RESIDUO'   AS 'DB3'                               
017100*     END-EXEC                                                             
017200*     MOVE "Connect SINIR" TO ER-DESCRIZIONE                           
017300*     PERFORM TEST-ERR         THRU TEST-ERR-EX.                           
017400* S-CONNECT-3-EX.                                                            
017500*     EXIT.                                                                
      *NO-DATGE*    valeria dafare da togliere                                                    INIZIO 

      *
047700 S-SET-3.                                                                 
047800        EXEC SQL                                                          
047900           SET CONNECTION 'DB3'                                           
048000        END-EXEC.                                                         
048100 S-SET-3-EX.                                                              
048200     EXIT.                                                                
      *NO-DATGE*                                                        fine 
048300*                                                                         
048400*                                                                         
048500*GESTRIP*                                                                 
048600 LEGGI-PARAMDT.                                                           
      *     display "valeria leggi-paramdt".
048700     MOVE "DPARAM;" TO W-NOME-DATA-SET.                                   
048800     MOVE "C-AZIENDA;" TO W-NOME-CAMPO.                                   
048900     MOVE 0 TO W-VALORE-CAMPO-HW.                                         
      *     display "valeria TTDBFIND".
049000     PERFORM TTDBFIND THRU EX-TTDBFIND.                                   
      *     display "valeria ex-TTDBFIND".
049100     IF NOT W-OK-IMAGE                                                    
           CANCEL "QDBERROR"
049200        CALL "QDBERROR" USING W-COMMON.                                   
049300     MOVE 5 TO W-MODO.                                                    
      *     display "valeria ttdbget".
049400     PERFORM TTDBGET THRU EX-TTDBGET.                                     
      *     display "valeria ex-ttdbget".
049500     MOVE AREA-REC-SET TO REC-PARAM-RID.                                  
049600     PERFORM DBGET-PARAMDT THRU EX-DBGET-PARAMDT                          
049700      UNTIL                                                               
049800           W-FINE-CATENA  OR                                              
049900           P-RIPRADI.                                                     
050000     IF W-FINE-CATENA                                                     
           CANCEL "QDBERROR"
050100        CALL "QDBERROR" USING W-COMMON                                    
050200       ELSE                                                               
050300*SORTER*                                                                  
050400*          MOVE PAR-PROGR-SESS TO PROGRESSIVO-SESSIONE.                   
050500       MOVE PAR-PROGR-SESS TO PROGRESSIVO-SESSIONE                        
050600       IF W-SIGLA-UTENTE = "MAXMAX"                                       
050700         MOVE 5 TO PREF-PROGR-SESS                                        
050800       ELSE                                                               
050900         IF W-SIGLA-UTENTE = "MARINA"                                     
051000           MOVE 4 TO PREF-PROGR-SESS                                      
051100         ELSE                                                             
051200           IF W-SIGLA-UTENTE = "PENNY"                                    
051300             MOVE 3 TO PREF-PROGR-SESS                                    
051400           ELSE                                                           
051500             IF W-SIGLA-UTENTE = "MARELLA"                                
051600               MOVE 2 TO PREF-PROGR-SESS.                                 
051700*                                                                         
      *     display "valeria ex-leggi-paramdt".
051800 EX-LEGGI-PARAMDT.                                                        
051900     EXIT.                                                                
052000*                                                                         
052100*                                                                         
052200 DBGET-PARAMDT.                                                           
      *     display "valeria DBGET-PARAMDT".
052300     PERFORM TTDBGET THRU EX-TTDBGET.                                     
052400     MOVE AREA-REC-SET TO REC-PARAM-RID.                                  
      *     display "valeria ex-DBGET-PARAMDT".
052500 EX-DBGET-PARAMDT.                                                        
052600     EXIT.                                                                
052700*                                                                         
052800*                                                                         
052900 AGG-DPARAM.  
      *     display "valeria agg-dparam".
053000     MOVE "DPARAM" TO W-NOME-DATA-SET.                                    
053100*SORTER*                                                                  
053200*     ADD 1 TO PAR-PROGR-SESS.                                            
053300     IF PAR-PROGR-SESS = 999999                                           
053400       MOVE 1 TO PAR-PROGR-SESS                                           
053500     ELSE                                                                 
053600       ADD 1 TO PAR-PROGR-SESS                                            
053700     END-IF                                                               
053800*                                                                         
053900     MOVE REC-PARAM-RID TO AREA-REC-SET.                                  
      *     display "valeria ttupdate dparam",
054000     PERFORM TTUPDATE THRU EX-TTUPDATE.                                   
      *     display "valeria ex agg-dparam".
054100 EX-AGG-DPARAM.                                                           
054200     EXIT.                                                                
054300*                                                                         
054400*                                                                         
054500 ELABORA.                                                                 
054600*DISPL25*                                                                 
054601*    DISPLAY "m".                                                        
054700*    DISPLAY "hJ".                                                      
054800     PERFORM VARYING IR FROM 1 BY 1                                       
054900             UNTIL IR > SALTO                                             
055000        DISPLAY SPACE                                                     
055100     END-PERFORM.                                                         
055200*                                                                         
055300     MOVE LOW-VALUE TO C-MAT-INPUT.                                       
055400*GESTRIP*                                                                 
055500     MOVE SPACES TO MEM-COD-IN.                                           
055600     MOVE 0 TO MEM-COD-SORTER.       
      *STESA*
           MOVE "S" TO FLAG-PRIMA-VOLTA 
      *
      *COCE*                                                            inizio
           MOVE "S" TO FLAG-PRIMA-VOLTA-STESO.
           MOVE 0 TO NRO-CELLE
045900*                                                                 fine   
      *COLE*                                                            inizio
           MOVE 0 TO NRO-CAPI-LETTI.
      *                                                                 fine
055700*DISPL25*                                                                 
055800     DISPLAY "PROGR. SESS. ==> "                                          
055900       PROGRESSIVO-SESSIONE.                                              
           DISPLAY "Vuoi scalare la Giacenza Virtuale ? (S o N )  "
           ACCEPT FLAG-VIRTUALE.                                                 
056500*SORTER*                                                                  
056600     MOVE "S" TO FLAG-SORTER.                                             
056700*     DISPLAY "&dJ CODICE       &d@".                                 
056800*                                                                         
056900*    DISPLAY "l".
      *LETNPS*
           MOVE 0 TO OK-MAG. 
           PERFORM TRATTA-MAG THRU TRATTA-MAG-EX
                   UNTIL MAG-OK.   
056000*ALLOCAZIONE_NPS                                                                         
056100     DISPLAY "   ".      
           DISPLAY "Vuoi allocare ? (S o N )  "
           ACCEPT FLAG-ALLOCAZIONE.
           DISPLAY "Cod Allocazione"
           ACCEPT COD-ALLOC-IN.
           IF ALLOCO
               PERFORM SCRIVO-ALLOCAZIONE THRU EX-SCRIVO-ALLOCAZIONE.
056000*ALLOCAZIONE_NPS   
056200*DISPL25*                                                                 
056300     DISPLAY "%  annulla l'ultima lettura".                               
056400     DISPLAY "#  per finire".                                                                                                                                        
      *LETNPS*                                                          
057000     PERFORM LEGGI-ARTICOLI THRU EX-LEGGI-ARTICOLI                        
057100       UNTIL FINE-LAVORO.                                                 
057200*DISPL25*                                                                 
057300*    DISPLAY "m".                   
                                     
      *    display "valeria asssvsrt ex-elabora".
057400 EX-ELABORA.                                                              
057500     EXIT.                                                                
057600*                                                                         
057700*                                                                         
057800*                                                                         
057900*                                                                         
058000*                                                                         
058100*                                                                         
058200 LEGGI-ARTICOLI.    
            IF SINO-DISPLAY = "SI"
                DISPLAY "LEGGI-ARTICOLI".                                                  
058300*SORTER*                                                                  
058400     IF CAPI-SORTER                                                       
058500*      DISPLAY "&dJCod Modello(con   SORTER)&d@" 
             DISPLAY "Cod Modello(con   SORTER)"
058600     ELSE                                                                 
058700*      DISPLAY "&dJCod Modello(senza SORTER)&d@".
             DISPLAY "Cod Modello(senza SORTER)".
058800*                                                                         
058900     MOVE LOW-VALUE TO C-MAT-INPUT.                                       
059000     MOVE 0 TO RIMANENZA                                                  
059100     ACCEPT C-MAT-INPUT.                                                  
059200     IF LETT-FINE                                                         
059300        MOVE 1 TO FINITO                                                  
059400        GO TO EX-LEGGI-ARTICOLI.                                          
059500     IF LETT-ANN-ULT                                            
059600       PERFORM ANNULLA-PRECEDENTE THRU EX-ANNULLA-PRECEDENTE              
059700       MOVE SPACES TO MEM-COD-IN                                          
059800       MOVE 0 TO MEM-COD-SORTER    
             IF CAPI-SORTER AND
                NOT SI-APPESO
               IF SI-DISPLAY
                 DISPLAY "TAB-CELLE " NRO-CELLE
                 PERFORM VARYING L FROM 1 BY 1
                         UNTIL L > NRO-CELLE
                   DISPLAY RAGGR-1(L) ":"  SPACE RAGGR-2(L)  SPACE
                      RAGGR-3(L) " -> " NRO-CAPI(L)
                 END-PERFORM                
               END-IF
             END-IF
059900       GO TO EX-LEGGI-ARTICOLI.                                           
060000*SORTER*                                                                  
060100*    IF LETT-SORTER                                                       
060200*      MOVE "S" TO FLAG-SORTER                                            
060300*      GO TO EX-LEGGI-ARTICOLI.                                           
060400*    IF LETT-NO-SORTER                                                    
060500*      MOVE "N" TO FLAG-SORTER                                            
060600*      GO TO EX-LEGGI-ARTICOLI.                                           
060700* 
      *BARUNI*                                                          inizio
           MOVE 'N' TO FLAG-BARUNI
           MOVE C-MAT-INPUT TO C-MAT-INPUT-BARUNI
           MOVE SOC-BARUNI TO SOCIETA-GRUPPO
      *     DISPLAY "SOC BARUNI " SOC-BARUNI  "  " SOCIETA-GRUPPO
           IF SOCIETA-VALIDE
      *        DISPLAY "ELABORA-BARUNI "
              PERFORM CONTROLLA-BARUNI THRU CONTROLLA-BARUNI-EX
              IF FLAG-OK-BARUNI > 0
                     DISPLAY "SKU NON VALIDO"
                     CALL "FAIBEEP"
                     GO TO EX-LEGGI-ARTICOLI
              END-IF                        
              PERFORM ELABORA-BARUNI THRU ELABORA-BARUNI-EX
           END-IF 
      *RIFICI*                                                          inizio
           MOVE C-MAT-INPUT TO C-MAT-INPUT-ORIG    
      *RIFICI*                                                          fine
      *BARUNI*                                                          fine      
      *EAN*
           MOVE C-MAT-INPUT TO DEED-X-14          
           MOVE 14 TO QD-LL-A
                      QD-LL-B.
           MOVE 0 TO QD-STATO                                                   
029100               QD-NR-DEC. 
      *     DISPLAY "DEED X  14 "  DEED-X-14
           CANCEL "QDEEDIT" 
           CALL "QDEEDIT" USING PARDEED                                         
039000                       DEED-X-14 DEED-9-14.
      *     DISPLAY "QD STATO " QD-STATO OF PARDEED    
            IF QD-STATO OF PARDEED NOT = 0       
                  DISPLAY "Barcode NON corretto "
061100            C-MAT-INPUT        
               CALL "FAIBEEP"
061200         MOVE 0 TO FINITO                                                   
061300         MOVE SPACES TO D-C-MAT                                             
061400         GO TO EX-LEGGI-ARTICOLI                                     
             ELSE
               PERFORM VERIFICA-EAN THRU VERIFICA-EAN-EX
      *   se c'e' stato un errore deve uscire
               IF FLAG-OK = 0
                 GO TO EX-LEGGI-ARTICOLI
               END-IF
             END-IF                             
           PERFORM S-SET-1 THRU S-SET-1-EX            
      *EAN-FINE*
           MOVE C-MAT-INPUT TO COM-C-MAT.    
061700*CAMME*                                                                   
061800     IF (W-UTENTE = "MC" OR = "PROVA") AND                                
061900              W-SIGLA-UTENTE = "RESIDUO"                                  
062000       MOVE 2 TO COM-C-MAT-22                                             
062100     ELSE                                                                 
062200       MOVE 0 TO COM-C-MAT-22.
           MOVE COM-C-MAT TO C-MAT-INPUT.                                                                                         
062400*                                                                         
           MOVE C-MAT-INPUT TO C-MAT-A-BARRE-RID.
062600*     IF TAGLIA OF C-MAT-A-BARRE = 0 OR = 9                                
062700*DISPL25*                                                                 
062800*       DISPLAY "TAGLIE da 1 a 8 " 
      *       DISPLAY "TAGLIE da 1 a 8"
      *       CALL "FAIBEEP"
062900*       GO TO EX-LEGGI-ARTICOLI.
      * 
           PERFORM CHIAMA-DBGENSKU THRU CHIAMA-DBGENSKU-EX.
           IF OUTPUT-VAL-RET = "1" 
              DISPLAY "ERRORE BARCODE/SKU >> RILEGGERE "
              PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
              GO TO EX-LEGGI-ARTICOLI.
      *                                            
063000     MOVE 0 TO C-MAT-TRANS-RID.                                           
063100     MOVE MODELLO OF C-MAT-A-BARRE TO MODELLO OF                          
063200                       C-MAT-TRANSITO.                                    
063300     MOVE VESTIBILITA OF C-MAT-A-BARRE TO                                 
063400              VEST-A OF C-MAT-TRANSITO.                                   
063500     MOVE SOCIETA OF C-MAT-A-BARRE TO                                     
063600                    PROGR-ART OF C-MAT-TRANSITO.                          
063700     MOVE PEZZO OF C-MAT-A-BARRE TO PEZZO-A OF                            
063800                       C-MAT-TRANSITO.                                    
063900     MOVE VARIANTE-COL OF C-MAT-A-BARRE TO COLORE OF                      
064000                       C-MAT-TRANSITO.              
064100     MOVE C-MAT-TRANS-RID TO W-VALORE-CAMPO.                              
064200     MOVE "ANAMAT;" TO W-NOME-DATA-SET.                                   
064300     MOVE "C-MAT;" TO W-NOME-CAMPO.                                       
064400     MOVE 7 TO W-MODO.                                                    
064500     PERFORM TTDBGET THRU EX-TTDBGET.                                     
064600     IF NOT W-OK-IMAGE                                                    
064700*DISPL25*                                                                 
064800*        DISPLAY "&dCC-MAT E R R A T O&d@ "
               DISPLAY "C-MAT E R R A T O"
               CALL "FAIBEEP"
064900         MOVE SPACES TO D-C-MAT                                           
065000*SORTER*                                                                  
065100*    ELSE                                                                 
065200       GO TO EX-LEGGI-ARTICOLI.       
      *COCE*                                                            inizio
           MOVE STAGIONE OF REC-ANAMAT TO STAGIONE-MEM
      *                                                                 fine
           MOVE C-MAT-INPUT TO C-MAT-INPUT-MEM.         
      *
      *PERMANOSO*                                                       inizio
           MOVE 0 TO FLAG-PERMANENTE
           
           INITIALIZE PAR-PERM.
063300     MOVE C-MAT-TRANS-RID TO PERM-CMAT.
           MOVE W-FORMATO-INTERNO TO DT-X-PERM
           MOVE 20                TO AA-X-PERM
           MOVE DATA-X-PERM       TO PERM-DATA-VAL.
           CALL "CALLPERM" USING SQLCA PAR-PERM
                           AREA-HL AREA-SI W-COMMON.
           IF PERM-SEGNALA-IN-LETTURA
             MOVE 1 TO FLAG-PERMANENTE
           END-IF
064420     IF CAPI-SORTER AND SI-PERMANENTE    
064182         DISPLAY "PERMANENTEnoSORTER"    
               call "FAIBEEP"
064183         GO TO EX-LEGGI-ARTICOLI. 
      *PERMANOSO*                                                       fine
      *

065400     IF CAPI-SORTER                                                       
065500       MOVE LOW-VALUE TO C-MAT-INPUT                                      
065600       PERFORM LEGGI-SORTER THRU EX-LEGGI-SORTER                          
065700           UNTIL LETT-FINE OR LETT-ANN-ULT OR                             
065800                 C-SORTER-INP-RID-X NUMERIC
065900       IF LETT-FINE OR LETT-ANN-ULT                                       
066000         GO TO EX-LEGGI-ARTICOLI.

      *STESA*
066100*     IF CAPI-SORTER                                                       
066200*       PERFORM CONTROLLA-SORTER THRU EX-CONTROLLA-SORTER    
           IF CAPI-SORTER
             IF SI-APPESO
               PERFORM CONTROLLA-SORTER THRU EX-CONTROLLA-SORTER
             ELSE
               PERFORM CONTROLLA-STESAUTO 
                    THRU EX-CONTROLLA-STESAUTO
             END-IF
      *COCASMA*                                                         inizio       
066300*       IF CONTA-CAPO > 0                                                  
066400**          DISPLAY "&dCC-SORTER ESISTENTE&d@"
      *           DISPLAY "C-SORTER ESISTENTE"
      *           CALL "FAIBEEP"
066500*           GO TO EX-LEGGI-ARTICOLI.     
             IF CONTA-CAPO > 0                                          *
                 GO TO EX-LEGGI-ARTICOLI.
      *COCASMA*                                                         fine
      
      *
      
      *SOLA*                                                            inizio
           IF CAPI-SORTER
             IF NOT SI-APPESO
               PERFORM CONTROLLA-CLASSE-AMMESSA
                    THRU EX-CONTROLLA-CLASSE-AMMESSA
066300         IF CONTA-CAPO NOT > 0                        
                 DISPLAY "CLASSE NON AMMESSA"
                 CALL "FAIBEEP"
066500           GO TO EX-LEGGI-ARTICOLI.           
      *                                                                 fine
066600*   
      *COCE*                                                            inizio
           MOVE 0 TO FLAG-ERRORE 
           IF CAPI-SORTER AND
                NOT SI-APPESO
               IF PRIMA-VOLTA-STESO
                 PERFORM LEGGI-PARAM-IMPIANTO
                     THRU EX-LEGGI-PARAM-IMPIANTO
                 IF FLAG-ERRORE NOT = 0
                   GO TO EX-LEGGI-ARTICOLI
                 END-IF
                 MOVE "N" TO FLAG-PRIMA-VOLTA-STESO
               END-IF
           END-IF
           IF CAPI-SORTER AND
                NOT SI-APPESO
               PERFORM CONTA-CELLE THRU EX-CONTA-CELLE
               IF SI-DISPLAY
                 DISPLAY "TAB-CELLE " NRO-CELLE
                 PERFORM VARYING L FROM 1 BY 1
                         UNTIL L > NRO-CELLE
                   DISPLAY RAGGR-1(L) ":" SPACE RAGGR-2(L)  SPACE
                      RAGGR-3(L) " -> " NRO-CAPI(L)
                 END-PERFORM
               END-IF
               
               IF FLAG-ERRORE NOT = 0
                   GO TO EX-LEGGI-ARTICOLI.
      *                                                                 fine

066700     MOVE D-MAT OF REC-ANAMAT TO D-C-MAT.                                 
066800*SORTER*   
           IF CAPI-SORTER
066900     MOVE C-SORTER-INP-RID TO MEM-COD-SORTER. 
      *STESA*
067000*     IF CAPI-SORTER                                                       
067100*       PERFORM CREA-CAPO THRU EX-CREA-CAPO                                
067200*     END-IF         
           IF CAPI-SORTER
             IF SI-APPESO
               PERFORM CREA-CAPO THRU EX-CREA-CAPO
             ELSE
               PERFORM CREA-CAPOSA 
                    THRU EX-CREA-CAPOSA
             END-IF
067300*                                                                         
067400     MOVE C-MAT-INPUT-MEM TO RICHIESTA MEM-COD-IN.       
      *STESA*
           MOVE "N" TO FLAG-PRIMA-VOLTA.

067500*    DISPLAY "AA".                                                      
067600*DISPL25*      
      *COLE*                                                            inizio
           ADD 1 TO NRO-CAPI-LETTI
           MOVE NRO-CAPI-LETTI TO NRO-VIDEO.
      *LETNPS*
           IF FLAG-VIRTUALE = 'S' OR 's' 
              PERFORM ELABORA-SITPF-VIRTUALE THRU
                      ELABORA-SITPF-VIRTUALE-EX.
      *LETNPS*          
      *                                                                 fine
067700     DISPLAY RIGA-VIDEO.                                                  
           IF SINO-DISPLAY = "SI"
               DISPLAY "EX-LEGGI-ARTICOLI".                                                  
067900 EX-LEGGI-ARTICOLI.                                                       
068000     EXIT.                                                                
068100*                                                                         
068200*SORTER*                                                                  
068300 LEGGI-SORTER.                                                            
            IF SINO-DISPLAY = "SI"
                DISPLAY "LEGGI-SORTER".                                                  
068400*      DISPLAY "&dJCod SORTER               &d@"
             DISPLAY "Cod SORTER"
068500     ACCEPT C-SORTER-INPUT.                                               
068600     IF LETT-FINE                                                         
068700        MOVE 1 TO FINITO                                                  
068800        GO TO EX-LEGGI-SORTER.      
      *
068900     IF LETT-ANN-ULT                                                      
069000*      DISPLAY "annullata ULTIMA lettura "
             DISPLAY "annullata ULTIMA lettura"

069100       MOVE SPACES TO MEM-COD-IN                                          
069200       MOVE 0 TO MEM-COD-SORTER                                           
069300       GO TO EX-LEGGI-SORTER.                                             
069400*     
      *STESA*
           IF NOT PRIMA-VOLTA
             IF NOT SI-APPESO AND C-SORTER-PREF-INPUT <> "DT"
               DISPLAY "solo stesi "
069700              C-SORTER-INPUT
               CALL "FAIBEEP"
               MOVE LOW-VALUE TO C-MAT-INPUT
069300         GO TO EX-LEGGI-SORTER.
      *
           IF NOT PRIMA-VOLTA
             IF SI-APPESO AND C-SORTER-PREF-INPUT = "DT"
               DISPLAY "solo appesi "
069700              C-SORTER-INPUT
               CALL "FAIBEEP"
069300         GO TO EX-LEGGI-SORTER.
      *
           IF PRIMA-VOLTA
             IF C-SORTER-PREF-INPUT = "DT"
               MOVE C-SORTER-PREF-INPUT TO PREF-STESO-APPESO
             ELSE
               MOVE SPACE TO PREF-STESO-APPESO
             END-IF
           END-IF
           IF C-SORTER-PREF-INPUT = "DT"
             MOVE ALL ZERO TO C-SORTER-PREF-INPUT
           END-IF
      *
      *STESA*
069500*     IF C-SORTER-INPUT NOT NUMERIC                                        
069600**      DISPLAY "&dCNON Numerico&d@"
      *       DISPLAY "NON Numerico "
069700*        C-SORTER-INPUT .   
           IF SI-APPESO
69500        IF C-SORTER-INP-RID NOT NUMERIC     
                 DISPLAY "NON Numerico "
069700               C-SORTER-INP-RID
                 CALL "FAIBEEP"
069300           GO TO EX-LEGGI-SORTER
             END-IF
             IF C-OVERFLOW-SORTER NOT = SPACES AND NOT = LOW-VALUE
                 DISPLAY "NON Valido " C-MAT-INPUT
                 CALL "FAIBEEP"
                 MOVE LOW-VALUE TO C-MAT-INPUT
                 GO TO EX-LEGGI-SORTER
             END-IF
           ELSE
69500        IF C-STESO-INP-RID NOT NUMERIC     
                  DISPLAY "NON Numerico "
069700               C-STESO-INP-RID
                  CALL "FAIBEEP"
069300            GO TO EX-LEGGI-SORTER
             END-IF           
           END-IF.
069800*

      *RIFICI*                                                          inizio
           IF SI-APPESO
             IF C-SORTER-INPUT =  C-MAT-INPUT-ORIG-10
               DISPLAY "Cod SORTER = Cod Modello"
               CALL "FAIBEEP"   
               MOVE LOW-VALUE TO C-MAT-INPUT
069300         GO TO EX-LEGGI-SORTER
             END-IF
           END-IF.
      *RIFICI*                                                          fine
            IF SINO-DISPLAY = "SI"
                DISPLAY "EX-LEGGI-SORTER".                                                  
069900 EX-LEGGI-SORTER.                                                         
070000     EXIT.                                                                
070100*                                                                         
070200*EAN* 

      *NO-DATGE*                                                        INIZIO 
      * SELECT-EAN.                                                         
080000*     EXEC SQL                                                             
080100*       SELECT COUNT(*)                                                   
080200*         INTO   :CONTA-EAN                                        
080300*         FROM ANAMAT_EAN                                          
080400*           WHERE MODELLO_EAN = :EAN-MODELLO-EAN                    
      **RECEAN*                                                          inizio
      *                 AND MODELLO_BC <> 0
      **RECEAN*                                                          fine
080500*     END-EXEC
      *     PERFORM TEST-ERR THRU TEST-ERR-EX.                                                                                  
080800* SELECT-EAN-EX.
      *      EXIT. 

       SELECT-EAN.
           PERFORM S-SET-3 THRU S-SET-3-EX.                             VALERIA
           IF SINO-DISPLAY = "SI"
               DISPLAY "SELECT-EAN "  APP-MODELLO-EAN-13-X.   
           MOVE 0 TO CONTA-EAN.                                               
           EXEC SQL
             SELECT COUNT(*)
                 INTO :CONTA-EAN
                 FROM anagrafica_mod_ean_dbg ae
                 JOIN anagrafica_modelli_dbg am 
                     ON (ae.societa = am.societa
                     AND ae.modello = am.modello)
                 JOIN anagrafica_modelli_barcode_negozio_dbg ab
                     ON (am.societa = ab.societa
                     AND am.modello = ab.modello)
                 JOIN anagrafica_varianti_dbg av
                     ON (av.societa = ae.societa
                     AND av.modello = ae.modello
                     AND av.variante = ae.variante)
                 JOIN modelli_oe_dbg me 
                     ON (me.societa = ae.societa 
                     AND me.modello = ae.modello 
                     AND me.indice_taglia = 
                         ae.indice_taglia)
                 WHERE ae.barcode_ean = :APP-MODELLO-EAN-13-X                                     
                     AND NOT (ab.modello_dt = 0) 
                     AND NOT (av.variante = 0) 
                     AND NOT (ae.indice_taglia = 0)
     
            END-EXEC.
      *        WHERE ae.barcode_ean > 100000000                    
      *            AND CMAT2BARCODE
      *          (AB.MODELLO_DT + AV.VARIANTE,AE.INDICE_TAGLIA) <> 0
      *            0200000000035 
 
            IF SINO-DISPLAY = "SI"
               DISPLAY "SQLCODE = " SQLCODE
               DISPLAY "CONTA-EAN = " CONTA-EAN
               DISPLAY "EX-SELECT-EAN".                                                  

            PERFORM TEST-ERR THRU TEST-ERR-EX.                                                                                  
            PERFORM S-SET-1 THRU S-SET-1-EX.                             VALERIA
       SELECT-EAN-EX. EXIT.
      *NO-DATGE*                                                        FINE
       
      *
      *NO-DATGE*                                                        inizio
      * DICH-CURSORE-EAN.
041500*      EXEC SQL                                                            
041600*      DECLARE CURSMN CURSOR FOR SELECT                           
041700*         MODELLO_BC
041800*         FROM ANAMAT_EAN                                      
041900*         WHERE MODELLO_EAN = :EAN-MODELLO-EAN                                                    
042500*     END-EXEC.                                                            
042600* EX-DICH-CURSORE-EAN.                                                 
042700*     EXIT.                                                                

       DICH-CURSORE-EAN.
           IF SINO-DISPLAY = "SI"
               DISPLAY "DICH-CURSORE-EAN".                                                  
            EXEC SQL                                                            
              DECLARE CURSMN CURSOR FOR SELECT
                 ab.modello_dt , av.variante, me.num_taglia_oe
                 FROM anagrafica_mod_ean_dbg ae
                 JOIN anagrafica_modelli_dbg am 
                     ON (ae.societa = am.societa
                     AND ae.modello = am.modello)
                 JOIN anagrafica_modelli_barcode_negozio_dbg ab
                     ON (am.societa = ab.societa
                     AND am.modello = ab.modello)
                 JOIN anagrafica_varianti_dbg av
                     ON (av.societa = ae.societa
                     AND av.modello = ae.modello
                     AND av.variante = ae.variante)
                 JOIN modelli_oe_dbg me
                     ON (me.societa = ae.societa 
                     AND me.modello = ae.modello 
                     AND me.indice_taglia = 
                         ae.indice_taglia)
               WHERE ae.barcode_ean = :APP-MODELLO-EAN-13-X                       *            0200000000035
            END-EXEC. 
           IF SINO-DISPLAY = "SI"
               DISPLAY "EX-DICH-CURSORE-EAN".                                                  
       EX-DICH-CURSORE-EAN.                                                 
           EXIT.                                                                
      *NO-DATGE*                                                        FINE

042800*                                                                         
042900 APRI-CURSORE-EAN.                                                    
043000     EXEC SQL                                                             
043100          OPEN CURSMN                                            
043200     END-EXEC.                                                            
043300     MOVE 'OPEN-CURSMN' TO ER-DESCRIZIONE.                            
043400     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
043500 EX-APRI-CURSORE-EAN.                                                 
043600     EXIT.                                                                
043700*                                                                         
043800 LEGGI-CURSORE-EAN.  
           IF SINO-DISPLAY = "SI"
               DISPLAY "LEGGI-CURSORE-EAN".                                                  
035500     MOVE 0 TO FLAG-CURSORE
           MOVE 0 TO CONTAT-EAN
      *
036000     PERFORM UNTIL STOP-CURSORE  
044300       EXEC SQL                                                             
044000          FETCH CURSMN                                      
      *NO-DATGE*                                                        inizio
044100*            INTO :EAN-MODELLO-BC
044100            INTO :APP-MODELLO-DT,
                       :APP-VARIANTE,
                       :APP-NUM-TAGLIA-OE
      *NO-DATGE*                                                        FINE
             END-EXEC
             IF SQLCODE = OK
      *NO-DATGE*                                                        INIZIO
               PERFORM INIT-APP-MODELLO-BC THRU 
                     EX-INIT-APP-MODELLO-BC
      *         MOVE EAN-MODELLO-BC TO EAN-DISPLAY 
               MOVE APP-MODELLO-BC TO EAN-DISPLAY 
      *NO-DATGE*                                                        FINE
      *trean         
               COMPUTE CONTAT-EAN = CONTAT-EAN + 1
044400         DISPLAY CONTAT-EAN ' - ' EAN-DISPLAY
      *NO-DATGE*                                                        INIZIO
      *         MOVE EAN-MODELLO-BC
               MOVE APP-MODELLO-BC
      *NO-DATGE*                                                        FINE
                   TO EL-EAN-MOD-BC(CONTAT-EAN)                                      
      *trean       
             ELSE
               MOVE 1 TO FLAG-CURSORE
             END-IF
           END-PERFORM.
           IF SINO-DISPLAY = "SI"
               DISPLAY "EX-LEGGI-CURSORE-EAN".                                                  
044800 EX-LEGGI-CURSORE-EAN.                                                
044900     EXIT.                                                                
045000*                                                                         
045100 CHIUDI-CURSORE-EAN.                                                  
045200     EXEC SQL                                                             
045300          CLOSE CURSMN                                           
045400     END-EXEC.                                                            
045500     MOVE 'CLOSE-CURSMN' TO ER-DESCRIZIONE.                           
045600     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
045700 EX-CHIUDI-CURSORE-EAN.                                               
045800     EXIT.                                 
      *
       VISUALIZZA-EAN.
            PERFORM S-SET-3 THRU S-SET-3-EX.                             VALERIA
           IF SINO-DISPLAY = "SI"
               DISPLAY "VISUALIZZA-EAN".                                                  
           PERFORM DICH-CURSORE-EAN                                     
036100        THRU EX-DICH-CURSORE-EAN                             
036200     PERFORM APRI-CURSORE-EAN
036300        THRU EX-APRI-CURSORE-EAN                                 
036400     PERFORM LEGGI-CURSORE-EAN                             
036500        THRU EX-LEGGI-CURSORE-EAN                            
037100     PERFORM CHIUDI-CURSORE-EAN                                  
037200        THRU EX-CHIUDI-CURSORE-EAN
           PERFORM TEST-ERR THRU TEST-ERR-EX.
           IF SINO-DISPLAY = "SI"
               DISPLAY "EX-VISUALIZZA-EAN".                                                  
            PERFORM S-SET-1 THRU S-SET-1-EX.                             VALERIA
       VISUALIZZA-EAN-EX.
           EXIT.
      *         
       VERIFICA-EAN. 
           IF SINO-DISPLAY = "SI"
               DISPLAY "VERIFICA-EAN".                                                  
          MOVE 0 TO CONTA-EAN 
          MOVE 1 TO FLAG-OK
      *NO-DATGE*                                                        INIZIO 
      *       PERFORM S-SET-2 THRU S-SET-2-EX                                                                       
              PERFORM S-SET-3 THRU S-SET-3-EX                                                                       
      *NO-DATGE*                                                        fine 
078700       PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
078800       PERFORM BEGIN-RC                                             
078900           THRU BEGIN-RC-EX                                          
079000       IF SQLCODE = OK
      *NO-DATGE*                                                        INIZIO 
      *         MOVE DEED-9-14 TO EAN-MODELLO-EAN                                         
               MOVE DEED-9-14 TO APP-MODELLO-EAN
               MOVE APP-MODELLO-EAN TO APP-MODELLO-EAN-X 
               IF SINO-DISPLAY = "SI"
                    DISPLAY "APP-MODELLO-EAN-X = " APP-MODELLO-EAN-X
               END-IF                               
      *NO-DATGE*                                                        FINE 
079100         PERFORM SELECT-EAN THRU SELECT-EAN-EX 
079200       END-IF                                                       
079300       END-PERFORM
      *   se la selezione non mi da nessun risultato ho inserito in input un codice errato
      *RECEAN*                                                          inizio
             IF CONTA-EAN = 1
      *       IF CONTA-EAN >= 1
      *RECEAN*                                                          fine
               MOVE 1 TO FLAG-OK
      *NO-DATGE*                                                        INIZIO 
      *           MOVE DEED-9-14 TO EAN-MODELLO-EAN
                 MOVE DEED-9-14 TO APP-MODELLO-EAN
      *           EXEC SQL
      *             SELECT MODELLO_BC INTO :EAN-MODELLO-BC
      *             FROM ANAMAT_EAN
      *             WHERE MODELLO_EAN = :EAN-MODELLO-EAN
      **RECEAN*                                                          inizio
      *                   AND MODELLO_BC <> 0  
      *             ORDER BY ANNO DESC,
      *                      STAGIONE DESC
      **RECEAN*                                                          fine
      *           END-EXEC
                 PERFORM GET-MODELLO-BC THRU EX-GET-MODELLO-BC
                 
      *           DISPLAY "EAN-MODELLO-BC " EAN-MODELLO-BC
                 DISPLAY "(EAN-MODELLO-BC) APP-MODELLO-BC " 
                                           APP-MODELLO-BC
      *           MOVE EAN-MODELLO-BC TO C-MAT-INP-RID
                 MOVE APP-MODELLO-BC TO C-MAT-INP-RID
      *NO-DATGE*                                                        INIZIO 
       
                 PERFORM S-COMMIT THRU S-COMMIT-EX 
                 PERFORM S-SET-1 THRU S-SET-1-EX        
      *   altrimenti la selezione ha prodotto piu' risultati 
               ELSE
                 IF CONTA-EAN > 1
                   MOVE 0 TO FLAG-OK                    
                   DISPLAY "Codice con piu' corrispondenze"
                   CALL "FAIBEEP" 
                   PERFORM VISUALIZZA-EAN THRU VISUALIZZA-EAN-EX
      *trean             
                   PERFORM ACCETTA-EAN THRU ACCETTA-EAN-EX
                      UNTIL C-MAT-INP-RID NUMERIC
                   MOVE 1 TO FLAG-OK 
      *trean             
                   PERFORM S-COMMIT THRU S-COMMIT-EX 
                   PERFORM S-SET-1 THRU S-SET-1-EX   
                   GO TO VERIFICA-EAN-EX
                 END-IF
               END-IF.      
           IF SINO-DISPLAY = "SI"
               DISPLAY "EX-VERIFICA-EAN".                                                  
        VERIFICA-EAN-EX.
            EXIT.
            
      
      *NO-DATGE*                                                        INIZIO 
       GET-MODELLO-BC.
           PERFORM S-SET-3 THRU S-SET-3-EX.                             VALERIA
           IF SINO-DISPLAY = "SI"
               DISPLAY "GET-MODELLO-BC".                                                  
            MOVE SPACES TO APP-MODELLO-DT.
            MOVE SPACES TO APP-VARIANTE.
            MOVE 0 TO APP-NUM-TAGLIA-OE.
          
            EXEC SQL                                                            
            SELECT
                 ab.modello_dt, av.variante,  me.num_taglia_oe
                 INTO :APP-MODELLO-DT,
                      :APP-VARIANTE,
                      :APP-NUM-TAGLIA-OE
                 FROM anagrafica_mod_ean_dbg ae
                 JOIN anagrafica_modelli_dbg am 
                    ON (ae.societa = am.societa
                    AND ae.modello = am.modello)
                 JOIN anagrafica_modelli_barcode_negozio_dbg ab
                     ON (am.societa = ab.societa
                     AND am.modello = ab.modello)
                 JOIN anagrafica_varianti_dbg av
                     ON (av.societa = ae.societa
                     AND av.modello = ae.modello
                     AND av.variante = ae.variante)
                 JOIN modelli_oe_dbg me 
                     ON (me.societa = ae.societa 
                     AND me.modello = ae.modello 
                     AND me.indice_taglia = 
                         ae.indice_taglia)
                 WHERE ae.barcode_ean = :APP-MODELLO-EAN-13-X                      *  0200000000035
                    AND ab.modello_dt <> 0
                    AND av.variante <> 0
                    AND ae.indice_taglia <> 0
            ORDER BY am.anno DESC, am.stagione DESC
            END-EXEC. 
            PERFORM TEST-ERR THRU TEST-ERR-EX.                      

            PERFORM INIT-APP-MODELLO-BC THRU
                 EX-INIT-APP-MODELLO-BC.
           IF SINO-DISPLAY = "SI"
               DISPLAY "EX-GET-MODELLO-BC".                                                  
           PERFORM S-SET-1 THRU S-SET-1-EX.                             VALERIA
        EX-GET-MODELLO-BC. EXIT.
      *
      *
        INIT-APP-MODELLO-BC. 
      * INIZIALIZZO MODELLO_BC DAI DATI:
      *             APP-MODELLO-DT
      *             APP-VARIANTE
      *             APP-INDICE-TAGLIA

            MOVE APP-NUM-TAGLIA-OE TO TG.
            STRING MOD-1-8          
                   MOD-11
                   MOD-12 
                   MOD-9 
                   VAR-2-3 
                   TG 
               INTO APP-MODELLO-BC-X.

            MOVE APP-MODELLO-BC-9 TO APP-MODELLO-BC.
            DISPLAY APP-MODELLO-BC.
       EX-INIT-APP-MODELLO-BC. EXIT.
      *NO-DATGE*                                                        FINE 
      
            
003940*TREAN*                                                           inizio
       ACCETTA-EAN.
            IF SINO-DISPLAY = "SI"
               DISPLAY "ACCETTA-EAN".                                                  
          MOVE SPACE TO IND-ANAMAT-EAN.
           DISPLAY "Indice"
           ACCEPT IND-ANAMAT-EAN.
040200     MOVE 2 TO QD-LL-A QD-LL-B                                       
040300     MOVE 0 TO QD-STATO OF PARDEED                                   
040400                    QD-NR-DEC
           CANCEL "QDEEDIT"
040500     CALL "QDEEDIT" USING PARDEED                                    
040600                             IND-ANAMAT-EAN IND-ANAMAT-EAN-R 
040700     IF QD-STATO OF PARDEED NOT = 0
             DISPLAY "INDICE non numerico"                                 
                        CALL "FAIBEEP"
           ELSE
             IF IND-ANAMAT-EAN-R = 0 OR > CONTAT-EAN
               DISPLAY "INDICE errato"
                        CALL "FAIBEEP"
             ELSE
               MOVE EL-EAN-MOD-BC(IND-ANAMAT-EAN-R)
                  TO C-MAT-INP-RID  EAN-DISPLAY 
044400         DISPLAY  '   - ' EAN-DISPLAY
             END-IF
           END-IF.
           IF SINO-DISPLAY = "SI"
              DISPLAY "ACCETTA-EAN-EX".                                                  
       ACCETTA-EAN-EX.
           EXIT.
003940*TREAN*              
      *EAN-FINE*                                                                                     
070300 ANNULLA-PRECEDENTE.                                                      
070400     IF MEM-COD-IN = SPACES                                               
070500*DISPL25*                                                                 
070600       DISPLAY "nulla da annullare"
             CALL "FAIBEEP"
070700       GO TO EX-ANNULLA-PRECEDENTE. 
      *STESA*
      *SORTER*
070800*     IF MEM-COD-SORTER NOT = 0                                            
070900*       PERFORM CANC-SORTER THRU EX-CANC-SORTER                            
071000*     END-IF
           IF MEM-COD-SORTER NOT = 0
             IF SI-APPESO
               PERFORM CANC-SORTER THRU EX-CANC-SORTER
             ELSE
               PERFORM CANC-STESA 
                    THRU EX-CANC-STESA
      *COCE*                                                            inizio
               PERFORM AGGIUSTA-TAB-CELLE 
                   THRU EX-AGGIUSTA-TAB-CELLE 
      *                                                                 fine
             END-IF
           END-IF.
      *
      *LETNPS*
           IF FLAG-GIAC-NEG = 'N' AND (FLAG-VIRTUALE = 'S' OR 's')  
              PERFORM ANNULLA-SITPF-VIRTUALE 
                  THRU ANNULLA-SITPF-VIRTUALE-EX.
      *LETNPS*                
      *
      *COLE*                                                            inizio
           SUBTRACT 1 FROM NRO-CAPI-LETTI.
      *                                                                 fine
071100*DISPL25*                                                                 
071200*    DISPLAY "annullata ULTIMA lettura ".
           DISPLAY "annullata ULTIMA lettura".     
071300 EX-ANNULLA-PRECEDENTE.                                                   
071400     EXIT.                                                                
071500*                                                                         
071800* 
      *COCE*                                                            inizio
       AGGIUSTA-TAB-CELLE.
           IF NRO-CAPI(L-MEM) > 1
             SUBTRACT 1 FROM NRO-CAPI(L-MEM)
           ELSE
             IF L-MEM = 1
               MOVE 0 TO NRO-CELLE
             ELSE
               MOVE EL-CELLE(NRO-CELLE) TO EL-CELLE(L-MEM)
               SUBTRACT 1 FROM NRO-CELLE
             END-IF
           END-IF.
       EX-AGGIUSTA-TAB-CELLE.
           EXIT.
      *                                                                 fine
074000*                                                                         
074100*                                                                         
074200 TTDBFIND.                                                                
074300     COPY PDBFIND.                                                        
074400*                                                                         
074500 TTDBGET.                                                                 
074600     COPY PDBGET.                                                         
074700*                                                                         
074800 TTDBGET-M.   COPY PDBGET REPLACING                                       
074900            AREA-REC-SET BY REC-MOVTRANS                                  
075000            EX-TTDBGET BY EX-TTDBGET-M.                                   
075100*                                                                         
075200 NIENTE.                                                                  
075300 EX-NIENTE.                                                               
075400     EXIT.                                                                
075500*                                                                         
075600*                                                                         
075700 TTLOCK.                                                                  
075800     COPY PDBLOCK.                                                        
075900*                                                                         
076000 TTUPDATE.                                                                
076100     COPY PDBUPDAT.                                                       
076200*                                                                         
076300*                                                                         
076400*                                                                         
076500*                                                                         
076600 TTUNLOCK.                                                                
076700     COPY PDBUNLOC.                                                       
076800*                                                                         
076900*                                                                         
077000 TTDBPUT.                                                                 
077100     COPY PDBPUT.                                                         
077200*                                                                         
077300 TTDBCLOSE.                                                               
077400     COPY PDBCLOSE.                                                       
077500*                                                                         
077600*                                                                         
077700*GESTRIP*                                                                 
077800 TTDELETE.                                                                
077900     COPY PDBDELET.                                                       
078000*                                                                         
078100*                                                                         
078200*                                                                         
078300*SORTER*                                                                  
078400 CONTROLLA-SORTER.   
            IF SINO-DISPLAY = "SI"
               DISPLAY "CONTROLLA-SORTER".                                                  
078500     MOVE 0 TO CONTA-CAPO.                                                
078600     MOVE C-SORTER-INP-RID TO CAPO-ID-BARCODE.                            
078700     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
078800             PERFORM BEGIN-RC                                             
078900                THRU BEGIN-RC-EX                                          
079000             IF SQLCODE = OK                                              
079100                PERFORM SELECT-CAPO THRU SELECT-CAPO-EX                   
079200             END-IF                                                       
079300     END-PERFORM.                                                         
079400     PERFORM S-COMMIT THRU S-COMMIT-EX.  
      *
      *RISE*                                                            inizio
066300     IF CONTA-CAPO > 0                          
             DISPLAY "C-SORTER ESISTENTE"
             CALL "FAIBEEP"
066500     END-IF.     
      *RISE*                                                            fine
            IF SINO-DISPLAY = "SI"
               DISPLAY "EX-CONTROLLA-SORTER".   
       EX-CONTROLLA-SORTER.                                               
079600     EXIT.                                                                
079700*                                                                         
079800*                                                                         
079900 SELECT-CAPO.                                                             
            IF SINO-DISPLAY = "SI"
               DISPLAY "SELECT-CAPO".                                                  
080000     EXEC SQL                                                             
080100        SELECT COUNT(*)                                                   
080200             INTO   :CONTA-CAPO                                           
080300               FROM MAGAUTO.CAPO                                          
080400               WHERE ID_BARCODE = :CAPO-ID-BARCODE                        
080500     END-EXEC                                                             
080600     MOVE "SELECT MAGAUTO.CAPO" TO ER-DESCRIZIONE                         
080700     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
            IF SINO-DISPLAY = "SI"
               DISPLAY "EX-SELECT-CAPO".                                                  
080800 SELECT-CAPO-EX.                                                          
080900     EXIT.                                                                
081000*                                                                         
081100*                                                                         
081200*SORTER*                                                                  
081300 CANC-SORTER.                                                             
            IF SINO-DISPLAY = "SI"
               DISPLAY "CANC-SORTER".                                                  
081400     MOVE MEM-COD-SORTER TO CAPO-ID-BARCODE.                              
081500     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
081600             PERFORM BEGIN-RC                                             
081700                THRU BEGIN-RC-EX                                          
081800             IF SQLCODE = OK                                              
081900                PERFORM DELETE-CAPO THRU DELETE-CAPO-EX                   
082000             END-IF                                                       
082100     END-PERFORM.                                                         
082200     PERFORM S-COMMIT THRU S-COMMIT-EX.                                       
            IF SINO-DISPLAY = "SI"
               DISPLAY "EX-CANC-SORTER".                                                  
082300 EX-CANC-SORTER.                                                          
082400     EXIT.                                                                
082500*                                                                         
082600*                                                                         
082700*                                                                         
082800 DELETE-CAPO.                                                             
            IF SINO-DISPLAY = "SI"
               DISPLAY "DELETE-CAPO".                                                  
082900     EXEC SQL                                                             
083000        DELETE                                                            
083100               FROM MAGAUTO.CAPO                                          
083200               WHERE ID_BARCODE = :CAPO-ID-BARCODE                        
083300     END-EXEC                                                             
083400     MOVE "DELETE MAGAUTO.CAPO" TO ER-DESCRIZIONE                         
083500     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
            IF SINO-DISPLAY = "SI"
               DISPLAY "EX-DELETE-CAPO".                                                  
083600 DELETE-CAPO-EX.                                                          
083700     EXIT.  
      *
      *
      *STESA*
081300 CANC-STESA.                                   
            IF SINO-DISPLAY = "SI"
               DISPLAY "CANC-STESA".                                                  
078600     STRING PREF-STESO-APPESO  MEM-COD-STESO
                DELIMITED BY SIZE
                INTO CAPOSA-ID-BARCODE. 
081500     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
081600             PERFORM BEGIN-RC                                             
081700                THRU BEGIN-RC-EX                                          
081800             IF SQLCODE = OK                                              
081900                PERFORM DELETE-CAPOSA THRU DELETE-CAPOSA-EX                   
082000             END-IF                                                       
082100     END-PERFORM.                                                         
082200     PERFORM S-COMMIT THRU S-COMMIT-EX.                                       
            IF SINO-DISPLAY = "SI"
               DISPLAY "EX-CANC-STESA".                                                  
082300 EX-CANC-STESA.                                                          
082400     EXIT.                                                                
082500*                                                                         
082600*                                                                         
082700*                                                                         
082800 DELETE-CAPOSA.                                                             
082900     EXEC SQL                                                             
083000        DELETE                                                            
083100               FROM STESAUTO.CAPO                                          
083200               WHERE ID_BARCODE = :CAPOSA-ID-BARCODE                        
083300     END-EXEC                                                             
083400     MOVE "DELETE STESAUTO.CAPO" TO ER-DESCRIZIONE                         
083500     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
083600 DELETE-CAPOSA-EX.                                                          
083700     EXIT.  
      *      
      *
      *
      *STESA*
078400 CONTROLLA-STESAUTO.   
078500     MOVE 0 TO CONTA-CAPO.                                                
078600     STRING PREF-STESO-APPESO C-STESO-INP-RID 
                DELIMITED BY SIZE
                INTO CAPOSA-ID-BARCODE. 
078700     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
078800             PERFORM BEGIN-RC                                             
078900                THRU BEGIN-RC-EX                                          
079000             IF SQLCODE = OK                                              
079100                PERFORM SELECT-CAPOSA THRU SELECT-CAPOSA-EX
      *COCASMA*                                                         inizio
                      IF CONTA-CAPO > 0
                        DISPLAY "C-SORTER ESISTENTE"
                        CALL "FAIBEEP"
                      ELSE
                        PERFORM SELECT-CAPOSMA THRU SELECT-CAPOSMA-EX
                        IF CONTA-CAPO > 0
                          DISPLAY "C-SORTER SMARRITO"
                          CALL "FAIBEEP"
                        ELSE
                          PERFORM SELECT-CAPOPRE THRU SELECT-CAPOPRE-EX
                          IF CONTA-CAPO > 0
                            DISPLAY "C-SORTER PRESPEDITO"
                            CALL "FAIBEEP"
                          END-IF                        
                        END-IF
                      END-IF
      *COCASMA*                                                         fine
079200             END-IF                                                       
079300     END-PERFORM.  
079400     PERFORM S-COMMIT THRU S-COMMIT-EX.                                       
079500 EX-CONTROLLA-STESAUTO.                                                     
079600     EXIT.                                                                
079700*                                                                         
079800*                                                                         
079900 SELECT-CAPOSA.                                                             
080000     EXEC SQL                                                             
080100        SELECT COUNT(*)                                                   
080200             INTO   :CONTA-CAPO                                           
080300               FROM STESAUTO_CAPO                                          
080400               WHERE ID_BARCODE = :CAPOSA-ID-BARCODE                        
080500     END-EXEC                                                             
080600     MOVE "SELECT STESAUTO.CAPO" TO ER-DESCRIZIONE                         
080700     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
080800 SELECT-CAPOSA-EX.                                                          
080900     EXIT.  
      *
      *
      *COCASMA*                                                         inizio
       SELECT-CAPOSMA.
080000     EXEC SQL                                                             
080100        SELECT COUNT(*)                                                   
080200             INTO   :CONTA-CAPO                                           
080300               FROM STESAUTO_CAPO_SMARRITO                                        
080400               WHERE ID_BARCODE = :CAPOSA-ID-BARCODE                        
080500     END-EXEC                                                             
080600     MOVE "SELECT STESAUTO.CAPO_SMARRITO" TO ER-DESCRIZIONE                         
080700     PERFORM TEST-ERR THRU TEST-ERR-EX.           
       SELECT-CAPOSMA-EX.
           EXIT.
           
       SELECT-CAPOPRE.
080000     EXEC SQL                                                             
080100        SELECT COUNT(*)                                                   
080200             INTO   :CONTA-CAPO                                           
080300               FROM STESAUTO_CAPO_PRESPED                                        
080400               WHERE ID_BARCODE = :CAPOSA-ID-BARCODE                        
080500     END-EXEC                                                             
080600     MOVE "SELECT STESAUTO.CAPO_PRESPED" TO ER-DESCRIZIONE                         
080700     PERFORM TEST-ERR THRU TEST-ERR-EX.           
       SELECT-CAPOPRE-EX.
           EXIT.       
      *COCASMA*                                                         fine      
      *
      *
      *SOLA*                                                            inizio
       CONTROLLA-CLASSE-AMMESSA.
078500     MOVE 0 TO CONTA-CAPO.                                                
078600     MOVE STAGIONE-MEM TO CLAM-STAG. 
041800     MOVE W-FORMATO-INTERNO TO AAMMGG-2000 OF PARDAT-2000-U.                     
041900     COPY P2000 REPLACING PARDAT-2000 BY PARDAT-2000-U.                          
042000     MOVE ANNO OF C-MAT-TRANSITO TO NUM-2000 OF PARDAT-2000-U.                       
042100     COPY P2000U REPLACING PARDAT-2000 BY PARDAT-2000-U.                         
042200     MOVE AAAA-2000 OF PARDAT-2000-U TO CLAM-ANNO
           MOVE CLASSE OF C-MAT-TRANSITO TO N3
           MOVE X3 TO CLAM-CLASSE
      *SOLFO*                                                           inizio
           MOVE SOCIETA-MOD OF C-MAT-TRANSITO TO CLAM-FORNITORE
      *                                                                 fine
078700     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
078800             PERFORM BEGIN-RC                                             
078900                THRU BEGIN-RC-EX                                          
079000             IF SQLCODE = OK                                              
079100                PERFORM SELECT-CLASSI-AMMESSE 
                         THRU SELECT-CLASSI-AMMESSE-EX                   
079200             END-IF                                                       
079300     END-PERFORM.                                                         
079400     PERFORM S-COMMIT THRU S-COMMIT-EX.                                      
       EX-CONTROLLA-CLASSE-AMMESSA.
           EXIT.
           
079900 SELECT-CLASSI-AMMESSE.                                                             
080000     EXEC SQL                                                             
080100        SELECT COUNT(*)                                                   
080200             INTO   :CONTA-CAPO                                           
080300               FROM STESAUTO_CLASSI_AMMESSE                                  
080400               WHERE ANNO = :CLAM-ANNO AND
                           STAG = :CLAM-STAG AND
                           CLASSE = :CLAM-CLASSE
      *SOLFO*                                                           inizio
                      AND  FORNITORE = :CLAM-FORNITORE
      *                                                                 fine
080500     END-EXEC                                                      
080600     MOVE "SELECT STESAUTO.CLASSI-AMMESSE" TO ER-DESCRIZIONE                         
080700     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
080800 SELECT-CLASSI-AMMESSE-EX.                                                          
080900     EXIT.             
083800*                                       
084000*                                                                         
084100 S-COMMIT.                                                                  
084200     EXEC SQL                                                             
084300        COMMIT WORK                                                       
084400     END-EXEC.                                                            
084500     MOVE "COMMIT WORK" TO ER-DESCRIZIONE                                 
084600     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
084700 S-COMMIT-EX.                                                               
084800     EXIT.                                                                
084900*                                                                         
085000*                                                                         
085100 BEGIN-RC.                                                                
085200     EXEC SQL                                                             
085300        BEGIN WORK RC                                                     
085400     END-EXEC                                                             
085500     MOVE "BEGIN WORK RC" TO ER-DESCRIZIONE                               
085600     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
085700 BEGIN-RC-EX.                                                             
085800     EXIT.                                                                
085900*                                                                         
086000*                                                                         
086100 TEST-ERR.                                                                
086200     MOVE SQLCODE TO SQL-STATUS.                                          
086300     IF SQLCODE = OK OR NO-MEMORY OR DEADLOCK OR NOT-FOUND                
086400        CONTINUE                                                          
086500     ELSE                                                                 
           CANCEL "CALLSQLE"
086600        CALL "CALLSQLE" USING SQLCA PAR-ERR AREA-HL AREA-SI.              
086700 TEST-ERR-EX.                                                             
086800     EXIT.                                                                
086900*                                                                         
087000*                                                                         
087100 CREA-CAPO.                                                               
087200     MOVE AAAAMMGG-2000 OF PARDAT-2000 
                     TO CAPO-DATANAS CAPO-DATAVAR                      
087300     MOVE C-SORTER-INP-RID TO CAPO-ID-BARCODE.                            
087400     MOVE C-MAT-TRANS-RID TO CAPO-MODELLO-MAXIMA
      *ESTETA*                                                          inizio
           MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN.
           MOVE FUNCTION idxtg(NTG-IN) TO CAPO-INDICE-TG .
      *ESTETA*                                                          fine                          
087500*     MOVE TAGLIA OF C-MAT-A-BARRE TO CAPO-INDICE-TG                       
087600     MOVE 0 TO CAPO-ID-MOVCOR                                             
087700               CAPO-ID-MOVMAG                                             
087800                                   CAPO-DATA-CAR-VITE                     
087900     MOVE AAAAMMGG-2000 OF PARDAT-2000 TO CAPO-DATA-CNTR-RIEN                            
088000     MOVE PROGRESSIVO-SESSIONE TO CAPO-ID-PROGR-SESS                      
088100     MOVE SPACES TO CAPO-CAPOC CAPO-CONTO.                                
088200     MOVE  999999 TO CAPO-RIF-BOLLA.                                      
088300     MOVE MAG-P-IN-R TO CAPO-MAGAZZINO. 
      *Baruni*
           IF SI-BARUNI
              MOVE C-MAT-INPUT-BARUNI TO CAPO-BARUNI
           ELSE
              MOVE ' ' TO CAPO-BARUNI
           END-IF      
      *baruni*                                           
088400*                                                                         
088500     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
088600             PERFORM BEGIN-CS                                             
088700                THRU BEGIN-CS-EX                                          
088800             IF SQLCODE = OK                                              
088900                PERFORM INSERISCI-CAPO THRU INSERISCI-CAPO-EX             
089000             END-IF                                                       
089100     END-PERFORM.                                                         
089200     PERFORM S-COMMIT THRU S-COMMIT-EX.                                       
089300*----*                                                                    
089400 EX-CREA-CAPO.                                                            
089500     EXIT.                                                                
089600*                                                                         
089700 BEGIN-CS.                                                                
089800     EXEC SQL                                                             
089900        BEGIN WORK CS                                                     
090000     END-EXEC                                                             
090100     MOVE "BEGIN WORK CS" TO ER-DESCRIZIONE                               
090200     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
090300 BEGIN-CS-EX.                                                             
090400     EXIT.                                                                
090500*                                                                         
090600*                                                                         
090700 INSERISCI-CAPO.                                                          
090800     EXEC SQL                                                             
090900        INSERT INTO MAGAUTO.CAPO                                          
091000               VALUES(:CAPO-DATANAS,                                      
091100                      :CAPO-DATAVAR,                                      
091200                      :CAPO-ID-BARCODE,                                   
091300                      :CAPO-MODELLO-MAXIMA,                               
091400                      :CAPO-INDICE-TG,
      *baruni
                            :CAPO-BARUNI,
      *baruni                                                       
091500                      :CAPO-ID-MOVCOR,                                    
091600                      :CAPO-ID-MOVMAG,                                    
091700                      :CAPO-ID-PROGR-SESS,                                
091800                      :CAPO-DATA-CNTR-RIEN,                               
091900                      :CAPO-DATA-CAR-VITE,                                
092000                      :CAPO-CAPOC,                                        
092100                      :CAPO-CONTO,                                        
092200                      :CAPO-RIF-BOLLA,                                    
092300                      :CAPO-MAGAZZINO )                                   
092400     END-EXEC                                                             
092500     MOVE "Insert MAGAUTO.CAPO " TO ER-DESCRIZIONE                        
092600     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
092700 INSERISCI-CAPO-EX.                                                       
092800     EXIT.
      *
      *
      *STESA*
087100 CREA-CAPOSA.                                                               
087200     MOVE AAAAMMGG-2000 OF PARDAT-2000
                     TO CAPOSA-DATANAS CAPOSA-DATAVAR                      
078600     STRING PREF-STESO-APPESO C-STESO-INP-RID 
                DELIMITED BY SIZE
                INTO CAPOSA-ID-BARCODE.                            
087400     MOVE C-MAT-TRANS-RID TO CAPOSA-MODELLO-MAXIMA
      *ESTETA*                                                          inizio
           MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN.
           MOVE FUNCTION idxtg(NTG-IN) TO NTG-OUT .
           MOVE NTG-OUT TO CAPOSA-INDICE-TG.       
      *ESTETA*                                                          fine                                                   
087500*     MOVE TAGLIA OF C-MAT-A-BARRE TO CAPOSA-INDICE-TG                       
087600     MOVE 0 TO CAPOSA-DATA-CAR-SORT                     
087900     MOVE AAAAMMGG-2000 OF PARDAT-2000 TO CAPOSA-DATA-CNTR-RIEN                            
088000     MOVE PROGRESSIVO-SESSIONE TO CAPOSA-ID-PROGR-SESS                      
088100     MOVE SPACES TO CAPOSA-CAPOC CAPOSA-CONTO.                                
088200     MOVE  999999 TO CAPOSA-RIF-BOLLA.                                      
088300     MOVE MAG-P-IN-R TO CAPOSA-MAGAZZINO.  
           MOVE SPACES TO CAPOSA-ID-UDC
                          CAPOSA-NUMERO-BATCH.
           MOVE '0' TO  CAPOSA-TIPO-BATCH.
087600     MOVE 0 TO CAPOSA-ID-PROGR-PREP                                            
087700               CAPOSA-UDC-VIRTUALE 
      *BARUNI
           IF SI-BARUNI
              MOVE C-MAT-INPUT-BARUNI TO CAPOSA-BARUNI
           ELSE
              MOVE ' ' TO CAPOSA-BARUNI
           END-IF  
      *BARUNI           
088400*                                                                         
088500     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
088600             PERFORM BEGIN-CS                                             
088700                THRU BEGIN-CS-EX                                          
088800             IF SQLCODE = OK                                              
088900                PERFORM INSERISCI-CAPOSA
                             THRU INSERISCI-CAPOSA-EX             
089000             END-IF                                                       
089100     END-PERFORM.                                                         
089200     PERFORM S-COMMIT THRU S-COMMIT-EX.                                       
089300*----*                                                                    
089400 EX-CREA-CAPOSA.                                                            
089500     EXIT.                                                                
089600*                                                                  
090600*                                                                         
090700 INSERISCI-CAPOSA.                                                          
090800     EXEC SQL                                                             
090900        INSERT INTO STESAUTO_CAPO                                          
091000               VALUES(:CAPOSA-DATANAS,                                      
091100                      :CAPOSA-DATAVAR,                                      
091200                      :CAPOSA-ID-BARCODE,                                   
091300                      :CAPOSA-MODELLO-MAXIMA,                               
091400                      :CAPOSA-INDICE-TG,
      *baruni
                            :CAPOSA-BARUNI,
      *baruni                                                     
091700                      :CAPOSA-ID-PROGR-SESS,                                
091800                      :CAPOSA-DATA-CNTR-RIEN,  
                            :CAPOSA-TIPO-BATCH,
091900                      :CAPOSA-DATA-CAR-SORT,                                
092000                      :CAPOSA-CAPOC,                                        
092100                      :CAPOSA-CONTO,                                        
092200                      :CAPOSA-RIF-BOLLA,                                    
092300                      :CAPOSA-MAGAZZINO,
                            :CAPOSA-ID-UDC,
                            :CAPOSA-NUMERO-BATCH ,
                            :CAPOSA-ID-PROGR-PREP,
                            :CAPOSA-UDC-VIRTUALE)
092400     END-EXEC                                                             
092500     MOVE "Insert STESAUTO.CAPO " TO ER-DESCRIZIONE                        
092600     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
092700 INSERISCI-CAPOSA-EX.                                                       
092800     EXIT.                                                                
      *
      *
      *COCE*                                                            inizio
       LEGGI-PARAM-IMPIANTO.
           PERFORM TEST-PARAM-IMPIANTO THRU EX-TEST-PARAM-IMPIANTO.
           IF FLAG-ERRORE > 0
             GO TO EX-LEGGI-PARAM-IMPIANTO.
      *
           IF PI-MAX-CELLE = 0
052500       DISPLAY "Nro max celle errato dai parametri"    
             CALL "FAIBEEP"
052700       ADD 1 TO FLAG-ERRORE  
             GO TO EX-LEGGI-PARAM-IMPIANTO.   
       EX-LEGGI-PARAM-IMPIANTO.
           EXIT.
           
037500 TEST-PARAM-IMPIANTO.  
037600     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
037700          PERFORM BEGIN-RC                                                
037800          THRU BEGIN-RC-EX                                                
037900            IF SQLCODE = OK                                               
038000              PERFORM SELECT-PARAM-IMPIANTO                                       
038100              THRU EX-SELECT-PARAM-IMPIANTO                                  
038200            END-IF                                                        
038300     END-PERFORM.                                                         
038400     IF SQLCODE NOT = OK THEN                                                 
052500       DISPLAY "Non trovati parametri"      
             CALL "FAIBEEP"
052700       ADD 1 TO FLAG-ERRORE
038800     END-IF.                                                              
039000     PERFORM S-COMMIT THRU S-COMMIT-EX.                                       
039100 EX-TEST-PARAM-IMPIANTO.                                                          
039200     EXIT.                                                                
039300*  
039400 SELECT-PARAM-IMPIANTO.                                                           
039600     EXEC SQL                                                             
039700       SELECT  MAX_CELLE
039800       INTO  :PI-MAX-CELLE                                             
040300       FROM STESAUTO.PARAM_IMPIANTO_PF
040500     END-EXEC.                                                            
040600     MOVE "SELECT PARAM-IMPIANTO-PF " TO ER-DESCRIZIONE.                             
040700     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
040800 EX-SELECT-PARAM-IMPIANTO.                                                        
040900     EXIT.  

       CONTA-CELLE.
           MOVE CLASSE OF C-MAT-TRANSITO TO N10
           MOVE X10 TO RAGGR-1-COM
           MOVE SOCIETA-MOD OF C-MAT-TRANSITO
                   TO N10
           MOVE X10 TO RAGGR-2-COM
           COMPUTE N10 = ANNO OF C-MAT-TRANSITO * 10 +
                         STAGIONE-MEM
           MOVE X10 TO RAGGR-3-COM
           PERFORM VARYING L FROM 1 BY 1
                      UNTIL L > NRO-CELLE OR
                         ( RAGGR-1-COM = RAGGR-1 OF EL-CELLE(L) AND
                           RAGGR-2-COM = RAGGR-2 OF EL-CELLE(L) AND
                           RAGGR-3-COM = RAGGR-3 OF EL-CELLE(L) )
                  CONTINUE
           END-PERFORM
           IF L > NRO-CELLE
               IF NRO-CELLE = MAX-CELLE
                  DISPLAY "TAB-CELLE da allargare" 
                  CALL "FAIBEEP"
                  ADD 1 TO FLAG-ERRORE
               ELSE
                 IF NRO-CELLE = PI-MAX-CELLE
                   ADD 1  TO NRO-CELLE GIVING Z5
                   MOVE PI-MAX-CELLE TO Z4
                   DISPLAY "Celle necessarie: " Z5
                       "; max celle " Z4
                   CALL "FAIBEEP"       
                   ADD 1 TO FLAG-ERRORE
                 ELSE          
                   ADD 1 TO NRO-CELLE 
                   MOVE RAGGR-1-COM TO RAGGR-1 OF EL-CELLE(NRO-CELLE)
                   MOVE RAGGR-2-COM TO RAGGR-2 OF EL-CELLE(NRO-CELLE)
                   MOVE RAGGR-3-COM TO RAGGR-3 OF EL-CELLE(NRO-CELLE)
                   MOVE 1 TO NRO-CAPI(NRO-CELLE)
                   MOVE NRO-CELLE TO L-MEM
                 END-IF
               END-IF
             ELSE
               ADD 1 TO NRO-CAPI(L)
               MOVE L TO L-MEM
           END-IF.      
           
       EX-CONTA-CELLE.
           EXIT.
      *                                                                 fine
      *LETNPS*
      *
       ELABORA-SITPF-VIRTUALE.
      *
           MOVE 'N' TO FLAG-GIAC-NEG.
           MOVE C-MAT-TRANS-RID TO SITPFVIR-C-MAT.
           MOVE MAG-P-IN-R TO SITPFVIR-MAG.
      *ESTETA*                                                          inizio
           MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN.
           MOVE FUNCTION idxtg(NTG-IN) TO NTG-OUT .
      *ESTETA*                                                          fine                          
           PERFORM VARYING INDICE-VIR FROM 1 BY 1 
                              UNTIL INDICE-VIR > NTG-NTG
                   MOVE 0 TO QTA-TAGLIA OF TAB-R-VIRTUALE(INDICE-VIR)
           END-PERFORM.  
      *                 
           MOVE -1 TO QTA-TAGLIA OF TAB-R-VIRTUALE                                
                                  (NTG-OUT).            
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(1) TO              
                               SITPFVIR-QTA-GIAC-1.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(2) TO              
                               SITPFVIR-QTA-GIAC-2.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(3) TO              
                               SITPFVIR-QTA-GIAC-3.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(4) TO              
                               SITPFVIR-QTA-GIAC-4.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(5) TO              
                               SITPFVIR-QTA-GIAC-5.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(6) TO              
                               SITPFVIR-QTA-GIAC-6.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(7) TO              
                               SITPFVIR-QTA-GIAC-7.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(8) TO              
                               SITPFVIR-QTA-GIAC-8.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(9) TO              
                               SITPFVIR-QTA-GIAC-9.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(10) TO              
                               SITPFVIR-QTA-GIAC-10.
      *
           PERFORM SELECT-SITPF-VIRTUALE THRU    
                       SELECT-SITPF-VIRTUALE-EX.                     
      * 
           PERFORM CONTROLLA-GIACENZA THRU 
                       CONTROLLA-GIACENZA-EX.
      *  
           IF FLAG-GIAC-NEG = 'N'                    
              PERFORM UPDATE-SITPF-VIRTUALE
                 THRU UPDATE-SITPF-VIRTUALE-EX
              PERFORM S-COMMIT THRU S-COMMIT-EX.
       ELABORA-SITPF-VIRTUALE-EX.
           EXIT.
      *
       SELECT-SITPF-VIRTUALE.
      * 
           EXEC SQL
              SELECT      GQF1, GQF2, GQF3, GQF4,
                          GQF5, GQF6, GQF7, GQF8,
                          GQF9, GQF10
                INTO     :TAB-QTA-GIAC-1,
                         :TAB-QTA-GIAC-2,
                         :TAB-QTA-GIAC-3,
                         :TAB-QTA-GIAC-4,
                         :TAB-QTA-GIAC-5,
                         :TAB-QTA-GIAC-6,
                         :TAB-QTA-GIAC-7,
                         :TAB-QTA-GIAC-8,                                                                                                                                                
                         :TAB-QTA-GIAC-9,                                                                                                                                                    
                         :TAB-QTA-GIAC-10                                                                                                                                                     
                FROM      SITPF_VIRTUALE
                WHERE C_MAT = :SITPFVIR-C-MAT 
                AND   MAG   = :SITPFVIR-MAG
           END-EXEC
           MOVE "SELECT SITPF-VIRTUALE " TO ER-DESCRIZIONE                         
           IF SQLCODE NOT = MULTIPLE-ROWS
              PERFORM TEST-ERR THRU TEST-ERR-EX.
      *
           PERFORM S-COMMIT THRU S-COMMIT-EX.        
      *                                 
       SELECT-SITPF-VIRTUALE-EX. 
      *           
       CONTROLLA-GIACENZA.  
      *
           COMPUTE SITPFVIR-QTA-GIAC-1 = 
                      TAB-QTA-GIAC-1 +  SITPFVIR-QTA-GIAC-1.                                    
      * 
           COMPUTE SITPFVIR-QTA-GIAC-2 = 
                      TAB-QTA-GIAC-2 +   SITPFVIR-QTA-GIAC-2.
      * 
           COMPUTE SITPFVIR-QTA-GIAC-3 = 
                      TAB-QTA-GIAC-3  +  SITPFVIR-QTA-GIAC-3.                                    
      *
           COMPUTE SITPFVIR-QTA-GIAC-4 = 
                      TAB-QTA-GIAC-4 +   SITPFVIR-QTA-GIAC-4.
      *   
           COMPUTE SITPFVIR-QTA-GIAC-5 = 
                      TAB-QTA-GIAC-5  +  SITPFVIR-QTA-GIAC-5.                                    
      *
           COMPUTE SITPFVIR-QTA-GIAC-6 = 
                      TAB-QTA-GIAC-6  +  SITPFVIR-QTA-GIAC-6.
      * 
           COMPUTE SITPFVIR-QTA-GIAC-7 = 
                      TAB-QTA-GIAC-7  +  SITPFVIR-QTA-GIAC-7.                                    
      *
           COMPUTE SITPFVIR-QTA-GIAC-8 = 
                      TAB-QTA-GIAC-8  +  SITPFVIR-QTA-GIAC-8.
      *
           COMPUTE SITPFVIR-QTA-GIAC-9 = 
                      TAB-QTA-GIAC-9  +  SITPFVIR-QTA-GIAC-9.
      *
           COMPUTE SITPFVIR-QTA-GIAC-10 = 
                      TAB-QTA-GIAC-10  +  SITPFVIR-QTA-GIAC-10.
      *              
           IF (SITPFVIR-QTA-GIAC-1 < 0) OR (SITPFVIR-QTA-GIAC-2 <0) OR 
              (SITPFVIR-QTA-GIAC-3 < 0) OR (SITPFVIR-QTA-GIAC-4 <0) OR
              (SITPFVIR-QTA-GIAC-5 < 0) OR (SITPFVIR-QTA-GIAC-6 <0) OR
              (SITPFVIR-QTA-GIAC-7 < 0) OR (SITPFVIR-QTA-GIAC-8 <0) OR
              (SITPFVIR-QTA-GIAC-9 < 0) OR (SITPFVIR-QTA-GIAC-10 <0) 
              MOVE 'S' TO FLAG-GIAC-NEG
              DISPLAY "Manca Giac Virtuale, CMAT letto ugualmente"
              CALL "FAIBEEP"
           END-IF.
      *          
       CONTROLLA-GIACENZA-EX.
           EXIT. 
      * 
       UPDATE-SITPF-VIRTUALE.
      *    
           MOVE W-FORMATO-INTERNO TO SITPFVIR-DT-UV.                                             
           EXEC SQL                                                             
              UPDATE SITPF_VIRTUALE                                          
                SET GQF1     =  :SITPFVIR-QTA-GIAC-1,
                    GQF2     =  :SITPFVIR-QTA-GIAC-2,
                    GQF3     =  :SITPFVIR-QTA-GIAC-3,
                    GQF4     =  :SITPFVIR-QTA-GIAC-4,
                    GQF5     =  :SITPFVIR-QTA-GIAC-5,
                    GQF6     =  :SITPFVIR-QTA-GIAC-6,
                    GQF7     =  :SITPFVIR-QTA-GIAC-7,
                    GQF8     =  :SITPFVIR-QTA-GIAC-8,
                    GQF9     =  :SITPFVIR-QTA-GIAC-9,
                    GQF10    =  :SITPFVIR-QTA-GIAC-10,
                    DT_UV    = :SITPFVIR-DT-UV                            
                    WHERE  C_MAT  = :SITPFVIR-C-MAT
                    AND     MAG   = :SITPFVIR-MAG
           END-EXEC                                                             
           MOVE "Update SIT-PF-VIRT MANCA GIACENZA" TO ER-DESCRIZIONE                        
           PERFORM TEST-ERR THRU TEST-ERR-EX.
      *                
       UPDATE-SITPF-VIRTUALE-EX.
           EXIT.    
      *
      *
       ANNULLA-SITPF-VIRTUALE.
      *
           MOVE C-MAT-TRANS-RID TO SITPFVIR-C-MAT.
           MOVE MAG-P-IN-R TO SITPFVIR-MAG.
           PERFORM VARYING INDICE-VIR FROM 1 BY 1 
                              UNTIL INDICE-VIR > NTG-NTG
                   MOVE 0 TO QTA-TAGLIA OF TAB-R-VIRTUALE(INDICE-VIR)
           END-PERFORM.  
      *                 
           MOVE 1 TO QTA-TAGLIA OF TAB-R-VIRTUALE                                
                                  (TAGLIA OF C-MAT-A-BARRE).            
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(1) TO              
                               SITPFVIR-QTA-GIAC-1.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(2) TO              
                               SITPFVIR-QTA-GIAC-2.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(3) TO              
                               SITPFVIR-QTA-GIAC-3.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(4) TO              
                               SITPFVIR-QTA-GIAC-4.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(5) TO              
                               SITPFVIR-QTA-GIAC-5.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(6) TO              
                               SITPFVIR-QTA-GIAC-6.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(7) TO              
                               SITPFVIR-QTA-GIAC-7.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(8) TO              
                               SITPFVIR-QTA-GIAC-8.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(9) TO              
                               SITPFVIR-QTA-GIAC-9.
           MOVE QTA-TAGLIA OF TAB-R-VIRTUALE(10) TO              
                               SITPFVIR-QTA-GIAC-10.
      *     
           PERFORM UPDATE-SITPF-VIRTUALE
                 THRU UPDATE-SITPF-VIRTUALE-EX.
      *
           PERFORM S-COMMIT THRU S-COMMIT-EX.
       ANNULLA-SITPF-VIRTUALE-EX.
           EXIT.
      *      
       TRATTA-MAG.
           DISPLAY "Mag. Scarico    ".
           DISPLAY "4 o 6 o 7 ".
               ACCEPT  MAG-P-IN.
043400          MOVE 3 TO QD-LL-A                                               
043500                    QD-LL-B                                               
043600          MOVE 0 TO QD-STATO OF PARDEED                                   
043700                    QD-NR-DEC                                             
           CANCEL "QDEEDIT"
043800          CALL "QDEEDIT" USING PARDEED                                    
043900                             MAG-P-IN MAG-P-IN-R                          
044000          IF QD-STATO OF PARDEED NOT = 0 OR                               
044100                (QD-STATO OF PARDEED = 0 AND    
                          MAG-P-IN-R NOT = 4 AND NOT = 6 AND NOT = 7) 
044500             DISPLAY "CODICE Errato " MAG-P-IN                    
                   CALL "FAIBEEP"
                   GO TO TRATTA-MAG-EX
                ELSE
                   MOVE 1 TO OK-MAG.    
       TRATTA-MAG-EX. 
           EXIT. 
      *LETNPS*                                                          inizio
      *
      *BARUNI*                                                          inizio 
      *
       CONTROLLA-BARUNI.
      *
       MOVE 0 TO FLAG-OK-BARUNI.
       MOVE 0 TO TALLY-COM.                            
       INSPECT C-MAT-INPUT-BARUNI
                  TALLYING TALLY-COM FOR ALL " "     
       IF TALLY-COM > 0 
          MOVE 1 TO FLAG-OK-BARUNI.                        
      *                                                     
       CONTROLLA-BARUNI-EX. 
           EXIT. 
      * 
       ELABORA-BARUNI.
      *    
       PERFORM CHIAMA-DBGENSKU THRU CHIAMA-DBGENSKU-EX
      * 
       IF OUTPUT-VAL-RET = "1"
          DISPLAY "Inserire il barcode-negozio    "
          ACCEPT BARCODE-NEG-INPUT
          MOVE BARCODE-NEG-INPUT TO BARCODE-NEG-MEM
          MOVE BARCODE-NEG-INPUT TO C-MAT-INPUT
          MOVE 'N' TO FLAG-BARUNI
       ELSE
          MOVE OUTPUT-VAL-BARCODE TO BARCODE-NEG-MEM 
          MOVE OUTPUT-VAL-BARCODE TO C-MAT-INPUT
          MOVE 'S' TO FLAG-BARUNI
       END-IF.     
      *
       ELABORA-BARUNI-EX.
           EXIT. 
      *
       CHIAMA-DBGENSKU.
      *
           MOVE C-MAT-INPUT TO INPUT-VAL
           CALL "PYTHON" USING "sku" "get_barcode" 
                               PY-INPUT-REC
                               PY-OUTPUT-REC.
      *
       CHIAMA-DBGENSKU-EX.
           EXIT.
      *
      *BARUNI*                                                          fine     
      *ALLOCAZIONE_NPS                                                                    inizio
       SCRIVO-ALLOCAZIONE.
           MOVE FUNCTION CURRENT-DATE 
                 TO STRINGA-CURRENT-DATE.
           STRING "N" PROGRESSIVO-SESSIONE-STR INTO ENTITA.
           MOVE COD-ALLOC-IN             TO CMAT-SETTORE.
           MOVE COD-ALLOC-IN(1:2)        TO AREA-ALLOC  .
           MOVE COD-ALLOC-IN(3:1)        TO PIANO       .
           MOVE COD-ALLOC-IN(4:1)        TO SETTORE     .
           MOVE COD-ALLOC-IN(5:3)        TO CANNA       .
           MOVE MAG-P-IN-R               TO MAG         .
           MOVE "NPS"                    TO TIPO        .
           MOVE PROGRESSIVO-SESSIONE-STR TO ENTITA-REALE.
           MOVE DATA-ORA-CURRENT-DATE    TO DT-CREAZIONE.
088400*                                                                         
088500     PERFORM WITH TEST AFTER UNTIL NOT DEAD-NOMEM                         
088600             PERFORM BEGIN-CS                                             
088700                THRU BEGIN-CS-EX                                          
088800             IF SQLCODE = OK                                              
088900                PERFORM INSERISCI-ALLOCAZIONE
                             THRU INSERISCI-ALLOCAZIONE-EX             
089000             END-IF                                                       
089100     END-PERFORM.                                                         
089200     PERFORM S-COMMIT THRU S-COMMIT-EX.  
           PERFORM S-SET-1 THRU S-SET-1-EX.                                     
       EX-SCRIVO-ALLOCAZIONE.
           EXIT.
090600*                                                                         
090700 INSERISCI-ALLOCAZIONE.                                                          
090800     EXEC SQL                                                             
090900        INSERT INTO ALLOCAZIONI                                          
091000               VALUES(0,                                      
091100                      :ENTITA       ,                          
091200                      :CMAT-SETTORE ,                          
091300                      :AREA-ALLOC   ,                          
091400                      :PIANO       ,
                            :SETTORE     ,
                            :CANNA       ,
                            :MAG          ,              
091500                      :TIPO         ,                          
091700                      :DT-CREAZIONE ,
091800                      0,                                                                
091600                      :ENTITA-REALE                          
091900                      )                                   
092400     END-EXEC  
092500     MOVE "Insert ALLOCAZIONE " TO ER-DESCRIZIONE                        
092600     PERFORM TEST-ERR THRU TEST-ERR-EX.                                   
092700 INSERISCI-ALLOCAZIONE-EX.                                                       
092800     EXIT.
      *
      *ALLOCAZIONE_NPS                                                                    fine