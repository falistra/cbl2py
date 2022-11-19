000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. IDSAMPLE.
000300 ENVIRONMENT DIVISION.
006600 DATA DIVISION.  
007000 WORKING-STORAGE SECTION.
      *ESTETA* 
       COPY NTG.
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
046000 PERFORM ELABORA THRU EX-ELABORA.   
045500 PERFORM TTLOCK THRU EX-TTLOCK.                                       
      *     display "valeria ex-ttlock".
045600 PERFORM LEGGI-PARAMDT THRU EX-LEGGI-PARAMDT.                         
045700 PERFORM AGG-DPARAM THRU EX-AGG-DPARAM.                               
      *     display "valeria ttunlock".
045800 PERFORM TTUNLOCK THRU EX-TTUNLOCK.  
      *     display "valeria ex-ttunlock".
      *                                                             
054500 ELABORA.
055800 DISPLAY "PROGR. SESS. ==> "                                          
055900     PROGRESSIVO-SESSIONE.                                              
       DISPLAY "Vuoi scalare la Giacenza Virtuale ? (S o N )  "
           ACCEPT FLAG-VIRTUALE.
056600 MOVE "S" TO FLAG-SORTER.                                             
056700*     DISPLAY "&dJ CODICE       &d@".                                 
056800*                                                                         
056900*    DISPLAY "l".
      *LETNPS*
       MOVE 0 TO OK-MAG. 
056000*ALLOCAZIONE_NPS                                                                         
056100     DISPLAY "   ".      
           DISPLAY "Vuoi allocare ? (S o N )  "
           ACCEPT FLAG-ALLOCAZIONE.
           DISPLAY "Cod Allocazione"
           ACCEPT COD-ALLOC-IN.
  
057400 EX-ELABORA.                                                              
057500 EXIT.
048600 LEGGI-PARAMDT.                                                           
      *     display "valeria leggi-paramdt".
048700     MOVE "DPARAM;" TO W-NOME-DATA-SET.                                   
048800     MOVE "C-AZIENDA;" TO W-NOME-CAMPO.                                   
048900     MOVE 0 TO W-VALORE-CAMPO-HW.                                         
      *     display "valeria TTDBFIND".
049000     PERFORM TTDBFIND THRU EX-TTDBFIND.                                   
      *     display "valeria ex-TTDBFIND".
051800 EX-LEGGI-PARAMDT.                                                        
051900     EXIT. 





054500 TTLOCK.
      *     DISPLAY "Vuoi allocare ? (S o N )  "
      *     ACCEPT FLAG-ALLOCAZIONE.
      *     DISPLAY "Cod Allocazione"
      *     ACCEPT COD-ALLOC-IN.
057400 EX-TTLOCK.                                                              
057500 EXIT.

000600 STOP RUN.