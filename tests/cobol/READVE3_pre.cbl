      *> CONTROL DYNAMIC,BOUNDS                                           
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. READVE3.       
      *> 
      *>    ricavato da READRST2 per gestire vendite da mag 3 (come fallat
      *> 
      *> 
       
      *>                                                                  
      *> BOLL*                                                            
      *>    22/02/97   aggiunto mag in input e controllo su BOLLE         
      *>                                                                  
      *> BUDA*                                                            
      *>    17/06/97  vendite a BUDAPEST: scrive file XESTERO             
      *>                                  e stampa cartellini             
      *>                                                                  
      *>   ricavato da READRSTK- con riduzione dei DISPLAY a 25 colonne   
      *>                                                                  
      *> 2000*        05/08/99                                            
      *>      tratta date a 6 cifre                                       
      *>                                                                  
      *> MAG6/7*                                                          
      *>    20/03/00   aggiunto mag di provenienza in input               
      *>                                                                  
      *> NOPRZ*                                                           
      *>     11/04/00   tratta mancanza prezzo al cliente                 
      *>                come mancanza giacenza                            
      *>                                                                  
      *> NODMAT*     06/07/00                                             
      *>          con il messaggio "CONFERMI MANCA PREZZO ?" visualizza   
      *>          descrizione articolo precedente:  corretto errore       
      *>                                                                  
      *> EURO*        27/12/00                          EURO/LIRE         
      *>      trattamento importi in EURO                                 
      *>                                                                  
      *> NOPRZ1*      01/03/01                                            
      *>       scrittura di movmag con COSTO-STD = 0                      
      *>                                                                  
      *>                                                                  
      *> EURO1*       03/12/01                                            
      *>       trattamento prezzi di vendita in Euro                      
      *>                                                                  
      *> T5000*       05/11/02                                            
      *>        Introdotta scelta del dispositivo di uscita               
      *>                                                                  
      *> PRZBU*       04/12/02                                            
      *>       Non scrive il movmag se il COSTO-STD e' 0 oppure           
      *>       senza sconto ma lo tratta come un manca giacenza           
      *>                                                                  
      *> FIFRA*      08/01/03                                             
      *>      passaggio file a franchising                                
      *>                                                                  
      *> PRODI*      12/06/03                                             
      *>      produzione divise: abilitate vendite da mag 2               
      *>      con prezzo da PREZZIA senza sconto                          
      *>                                                                  
      *> PRZANABU*   11/05/04                                             
      *>      se prezzo scontato = costo-anamat e se Vendita per          
      *>      Budapest ne permette il trattamento                         
      *>                                                                  
      *> TRAVMAG*   01/07/04                                              
      *>   Travaso da mag 7 via F.lli Cervi a mag 7 via Santi             
      *>                                                                  
      *> PRZ-PUBBL*     13/LUG/2005 - LAUROS                              
      *>      Aggiunto il prezzo di listino al pubblico nella stampa      
      *>      dei cartellini solo per il conto DEMA = 10010101            
      *>      (richiesta di Edoardo Testi)                                
      *>                                                                  
      *> PRINTDD6*      20/LUG/2005 - LAUROS                              
      *>      PRINTDD6 al posto di PRINTDD3                               
      *>      PRINTDD6 va su ANAMAT.MODELLI per ogni MODELLO              
      *>      PRINTDD3 carica tutta ANAMAT.MODELLI (+ lento)              
      *>                                                                  
      *> TASTO-PER-CONTINUARE*  21/LUG/2005 - LAUROS                      
      *>      Aggiunto "premi un tasto per continuare..."                 
      *>                                                                  
      *> etich-vuota*  17/FEB/2006  -  LAUROS
      *>      aggiunta un'etichetta vuota alla fine, per evitare che
      *>      l'ultima etichetta di fine lotto venga stampata dopo
      *>      un salto pagina... (con il passaggio a linux si comporta
      *>      in questo modo...!)
      *> 
      *> volante*      04/04/07
      *>      modifica fatta per scaricare EUROSTOCK con data
      *>      22/12/06  e vecchio parametro 2006 + 1
      *> 
      *> sempre0*      07/11/07
      *>      in caso di manca prezzo metto il prezzo sempre a 0
      *>      in modo da evitare fatturazioni a prezzo pieno !!
      *> 
      *> FSTOCK*       10/04/08    (annullato)
      *>      nuova dicitura per fatture stock
      *> 
      *> Mag3_V/F*     27/01/09    -  CAIO
      *>      per il magazzino 3, chiede all'utente se la roba e` roba
      *>      buona o fallata
      *> 
      *> MAXCA*        06/11/09
      *>      aggiunto param. in input (MAX-CAPI) per limitare il numero 
      *>      di capi trattati
      *> 
      *> VIBLO*        10/12/09
      *>      chiede in input mag (4 o 6) e non usa pi� fisso mag 3; 
      *>      non chiede valido o fallato      
      *>      non chiede valido o fallato      
      *> 
      *> ASZERO*       06/10/10    -  CAIO
      *>      correzione bug: non distingue l'anno "0" dal dato "tutti
      *>      gli anni"
      *> 
      *> VACO*         25/10/10
      *>            valorizza costo industriale (PREZZO) su MOVMAG con
      *>            COSTO di ANAMAT variante (per Elisa)
      *>                     
      *> ACQUO*     28/11/2011  -  LAUROS + LANDUX
      *>          acquisizione outlet esteri
      *>          effettua test esistenza PREZZI solo se deve stampare le 
      *> 
      *> MOVSKU   24/06/15
      *>        Scrive MOVSKU usando il baruni restituitogli dal py e 
      *>        aggiungere baruni nella stampa cartellino
      *>     
      *> ASOLOB2C*   12/04/2018
      *>      valorizza costo acquisto su MOVMAG vendita da ANAMAT_CST dis
      *>      per neg B2C (no DT 575) e altri neg
      *> 
      *> ESTETA*     20/11/18
      *>       estensione taglie
      *> 
      *> UNICODDT*
      *>      VALERIA NOVEMBRE 2020
      *>      poter inserire piu' as e per ogni as piu' classi e per ogni 
      *>      per formare un unico ddt
      *> 
      *> ************************************
      *> NO-DATGE 03 DICEMBRE 2020 VALERIA 
      *>      dismissione DATGE >> sostituita PF.SOCIETA con COPY MAPPASOC
      *>          sostituite anamat_modelli e anamat_pezzi 
      *>          con prezzi_modelli_dbg e anagrafica_modelli_dbg 
      *> 
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       SOURCE-COMPUTER.  HP-3000.                                       
       OBJECT-COMPUTER.  HP-3000.                                       
       SPECIAL-NAMES.   DECIMAL-POINT IS COMMA.          
      *> ESTETA* 
      *> REPOSITORY.
      *>       FUNCTION idxtg
      *>       FUNCTION tgxid.                   
      *> BUDA*                                                            
       INPUT-OUTPUT SECTION.                                            
           FILE-CONTROL.                                                
           SELECT FILE-BC ASSIGN TO "BARCNEG"                           
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT FILE-PEND ASSIGN TO "PEND"                            
              ORGANIZATION IS LINE SEQUENTIAL.
      *>                                                                  
       DATA DIVISION.                                                   
      *> BUDA*                                                            
      *>                                                                  
       FILE SECTION.                                                    
      *>  movsku                                                          
       FD FILE-BC DATA RECORD REC-BC.                                   
       01 REC-BC.                                                       
        05 C-MAT-S             PIC 9(13).   
        05 T-1                 PIC X.                   
        05 TAGLIA-S            PIC 9.                
        05 T-2                 PIC X.          
        05 MAG-S               PIC 999.  
        05 T-3                 PIC X.                    
        05 SETTORE-S           PIC X(4).  
        05 T-4                 PIC X.                     
        05 NOME-S              PIC X(7).  
        05 T-5                 PIC X.                     
        05 PREZZO-S            PIC 9(8).  
        05 T-6                 PIC X.                     
        05 NOME-F-S            PIC X(15).  
        05 T-7                 PIC X.                    
        05 COL-F-S             PIC X(5).   
        05 T-8                 PIC X.                    
        05 TG-OUT-S            PIC XX.   
        05 T-9                 PIC X.
        05 BARUNI-S            PIC X(13).                               
      *>                                                                  
       FD FILE-PEND DATA RECORD REC-PEND.                               
       01 REC-PEND             PIC X(132).                              
      *>                                                                  
       WORKING-STORAGE SECTION.                                         
      *>       
      *> ESTETA* 
      *>      ===PREPROCESSOR==>COPY NTG START
       01 NTG-NTG PIC S9(4) COMP VALUE 10.
       01 NTG-IN PIC S9(4) COMP.
       01 NTG-OUT PIC S9(4) COMP.
      *>      ===PREPROCESSOR==>COPY NTG END

 
       77 NTG-MEM PIC S9(4) COMP.                                       
       77 ERR-DISP               PIC -(6).                              
       77 DISP-4  PIC ZZZ9-.                                            
       77 DISP-8  PIC ZZZZZZZZ-.                                        
       77 STATO-DISPLAY  PIC ZZZZ-.                                     
      *> BUDA*                                                            
       77 FLAG-DT-ESTERO          PIC S9(4) COMP.                       
        88 SI-DT-ESTERO    VALUE 1.                                     
       77 PREZZO-MEM              PIC S9(9) COMP.                       
       77 PREZZO-TOT              PIC 9(11) COMP-3.                     
       77 IR   PIC S9(4) COMP.                                          
       77 JRUNC   PIC S9(4) COMP-5 VALUE 0.
       77 IT      PIC S9(4) COMP.
       77 IC      PIC S9(4) COMP.
      *>                                                                  
      *> ******************************************                       
      *>                                                                  
       01 CAMPI-ANAGRAFICI.                                             
        05  INDIRIZZO-STD         PIC X(66).                            
        05  INDIRIZZO-COM         PIC X(60) VALUE SPACES.               
        05  LOCALITA-COM          PIC X(60) VALUE SPACES.               
        05  CAP-COM               PIC S9(5) COMP-3 VALUE 0.             
        05  PROV-COM              PIC XX VALUE SPACES.                  
        05  STATO-COM             PIC XXX VALUE SPACES.                 
      *>                                                                  
        05  INDIRIZZO-C-COM         PIC X(60) VALUE SPACES.             
        05  LOCALITA-C-COM          PIC X(60) VALUE SPACES.             
        05  CAP-C-COM               PIC S9(5) COMP-3 VALUE 0.           
        05  PROV-C-COM              PIC XX VALUE SPACES.                
      *>                                                                  
        05 D-CONTO-MEM     PIC X(24).                                   
        05 D-CONTO-AGG-MEM  PIC X(24).                                  
        05 D-CONTO-VET     PIC X(24).                                   
      *>                                                                  
        05  INDIRIZZO-C-VET         PIC X(60) VALUE SPACES.             
        05  LOCALITA-C-VET          PIC X(60) VALUE SPACES.             
        05  CAP-C-VET               PIC S9(5) COMP-3 VALUE 0.           
        05  PROV-C-VET              PIC XX VALUE SPACES.                
      *>                                                                  
       01 CAMPI-COMODO.                                                 
        05 RIF-BOLLA-DDT         PIC 9(12).                             
        05 FILLER REDEFINES RIF-BOLLA-DDT.                              
         10 AA-MM-GG-DDT       PIC 9(6).                                
         10 NUMERO-DDT         PIC 9(6).                                
        05 CLIENTE-DDT           PIC S9(9) COMP.                        
        05 MAGAZZINO-DDT         PIC S9(4) COMP.                        
        05 CAUSALE-DDT           PIC X(4).                              
        05 TIPO-DOC-DDT          PIC S9(4) COMP.                        
           88 DOC-DDT      VALUE 1.                                     
           88 DOC-NOT-DDT  VALUE 2.                                     
        05 TIPO-MOVIMENTO-DDT    PIC S9(4) COMP.                        
           88 VENDITA       VALUE 1.                                    
           88 TRASFERIMENTO VALUE 2.                                    
           88 C-VISIONE     VALUE 3.                                    
           88 C-LAVAGGIO    VALUE 4.                                    
           88 C-LAVORAZIONE VALUE 5.                                    
        05 TIPO-STAMPA-DDT       PIC S9(4) COMP.                        
           88 PRODOTTI-FINITI   VALUE 1.                                
           88 MATERIE-PRIME     VALUE 9.                                
        05 LOC-PART-DDT          PIC X(56).                             
        05 NOTE-DDT              PIC X(44) OCCURS 2.                    
        05 TIPO-DATA-SET-DDT     PIC X.                                 
           88 MOVMAG-DDT    VALUE "0" , " ".                            
           88 MOVTRANS-DDT  VALUE "1".                                  
      *>                                                                  
       01 IMPORTO-X-PL           PIC S9(11) COMP-3.                     
      *>                                                                  
      *> BUDA*                                                            
       01 FILE-FAT-DDT PIC X.                                           
        88 SI-FILE-FAT VALUE "S".                                       
      *>                                                                  
      *> TRAVMAG*                                                         
       01 RIGA-1-DDT   PIC X(65).                                       
       01 RIGA-2-DDT   PIC X(65).                                       
      *>                                                                  
      *> ******************************************                       
      *>                                                                  
       01  PAR-INDIRIZZO.                                               
        05  STATO-IND            PIC S9(4) COMP.                        
        05  FUNZIONE-IND         PIC S9(4) COMP.                        
        05  LL-STRINGA-IND       PIC S9(4) COMP.                        
        05  LL-SUBSTRINGA-IND    PIC S9(4) COMP.                        
        05  FILLER               PIC X(6).                              
        05  TIPO-SEP             PIC XX VALUE " ;".                     
      *>                                                                  
       01 AREA-REC-SET         PIC X(512).                              
      *>                                                                  
       01 FILLER REDEFINES AREA-REC-SET.                                
        05 REC-ANACON      *>      ===PREPROCESSOR==>COPY YANACON START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>           ***********************************                    
      *>           *  REC-ANACON             LL=100  *                    
      *>           ***********************************                    
         15 CONTO                         PIC S9(8) COMP.               
         15 D-CONTO                       PIC X(24).                    
         15 FLAGS.                                                      
          20 FLAG-ANA-1                   PIC X.                        
           88 CONTO-A-PARTITE             VALUE "1".                    
          20 FLAG-ANA-2                   PIC X.                        
           88 CONTO-A-SCADENZA            VALUE "1".                    
          20 FLAG-ANA-3                   PIC X.                        
           88 RICHIEDE-CDC                VALUE "1".                    
           88 RICHIEDE-FIN                VALUE "2".                    
           88 RICHIEDE-DIP                VALUE "3".                    
          20 FLAG-ANA-4                   PIC X.                        
           88 SPLIT-PAYMENT VALUE "A".                                  
          20 FLAG-ANA-5                   PIC X.                        
           88 FATTURAZ-ELETTRONICA VALUE "A".                           
          20 FLAG-ANA-6                   PIC X.                        
              88 SCONTO-F    VALUE "0" THRU "9".                        
          20 FLAG-ANA-7                   PIC X.                        
           88 MOSTRA-PREZZO-SELLOUT VALUE "S".
          20 FLAG-ANA-8                   PIC X.                        
           88 SCRIVI-REC-ESTERO VALUE  "3".                             
           88 SCRIVI-REC-RESIDUO VALUE "2".                             
          20 FLAG-ANA-9                   PIC X.                        
           88 FILIALE-DT-ESTERO VALUE  "B".                             
           88 BUDAPEST-KFT      VALUE  "B".                             
           88 SL-BRATISLAVA     VALUE  "S".                             
          20 FLAG-ANA-10                  PIC 9.                        
           88 CLI-CLE                     VALUE 1.                      
           88 FOI-FOE                     VALUE 2.                      
           88 AGI-AGE                     VALUE 3.                      
           88 PORTAF-I-E                  VALUE 4.                      
           88 PORTAF-CO-BANCHE            VALUE 5.                      
           88 BANCHE                      VALUE 6.                      
           88 CRED-DEB-DIV                VALUE 7.                      
           88 ALTRI-CONTI                 VALUE 8.                      
         15 FILLER REDEFINES FLAGS.                                     
          20 FLAG                         PIC X OCCURS 10.              
         15 P-DARE                        PIC S9(15) COMP-3.            
         15 P-AVERE                       PIC S9(15) COMP-3.            
         15 P-DARE-C                      PIC S9(15) COMP-3.            
         15 P-AVERE-C                     PIC S9(15) COMP-3.            
         15 C-RAGG                        PIC S9(8) COMP OCCURS 2.      
         15 FIDO                          PIC S9(4) COMP.               
      *>    in RESIDUO contiene il codice del magazzino di DIFFTESS       
      *>    corrispondente al CONTO                                       
         15 DATA-FIDO                     PIC S9(8) COMP.               
         15 DATA-NA                       PIC S9(8) COMP.               
         15 DATA-UM                       PIC S9(8) COMP.               
         15 DATA-UV                       PIC S9(8) COMP.               
         15 TIPO-CONTO                    PIC XX.                       
            88 CONT-GENERALE              VALUE "CG".                   
            88 CONT-INDUSTRIALE           VALUE "CI".                   
            88 CONT-FINANZIARIA           VALUE "CF".                   
         15 VALIDITA-REC                  PIC XX.                       
          88 ANNULLATO                    VALUE "**".                   
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YANACON END

                                    
      *>                                                                  
       01 FILLER REDEFINES AREA-REC-SET.                                
        05 REC-BOLLE      *>      ===PREPROCESSOR==>COPY YBOLLE START
         .                                                              
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                                                  
      *>             ************************************                 
      *>             * REC-BOLLE               LL.  22  *                 
      *>             ************************************                 
      *>                                                                  
              10 CONTO               PIC S9(9) COMP.                    
              10 RIF-INTERNO         PIC S9(15) COMP-3.                 
      *>                               riferimento di MOVMAG              
      *>                               (data scarico per vend. da neg)    
      *>                               (data bolla per vend. da sede )    
              10 DATA-NASCITA        PIC S9(9) COMP.                    
      *>                               (data bolla   per vend. da neg)    
      *>                               (data scarico per vend. da sede)   
              10 NUM-PRE-FATT        PIC S9(4) COMP.                    
              10 NUMERO              PIC S9(4) COMP.                    
              10 VAL-REC             PIC XX.                            
                 88 REC-AGGIORNATO VALUE "**".                          
              10 MAGAZZINO           PIC S9(4) COMP.                    
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YBOLLE END

                                   
      *>                                                                  
       01 FILLER REDEFINES AREA-REC-SET.                                
        05 REC-ANAMAT      *>      ===PREPROCESSOR==>COPY YANAMAT START
      *>                                            ********************  
      *>             *********************************                    
      *>             * REC-ANAMAT            LL:94   *                    
      *>             *********************************                    
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                                                  
           20  C-MAT                   PIC S9(15)   COMP-3.             
           20  D-MAT                   PIC X(24).                       
           20  DT-NA                  PIC S9(8)     COMP.               
           20  DT-UV                  PIC S9(8)     COMP.               
           20  P-STOCK                 PIC X(2).                        
      *> ************* P-STOCK  contiene il campo COMPOS. CLASSE          
           20  CTO-RICAVI             PIC S9(8)     COMP.               
           20  CTO-COSTI              PIC S9(9)     COMP.               
      *> ************* CTO-COSTI contiene il COSTO - lo sconto            
           20  FLAGS-A.                                                 
            25 FLAG                    PIC X  OCCURS 8.                 
           20  FLAGS-RID REDEFINES FLAGS-A.                             
            25  FLAG1                  PIC X.                           
             88  GESTIONE-1-QTA        VALUE " ", "0".                  
             88  GESTIONE-PER-TAGLIE   VALUE "1".                       
            25  FLAG2                  PIC X.                           
             88  GESTIONE-A-PEZZE      VALUE "1".                       
             88  NO-GESTIONE-A-PEZZE   VALUE " ", "0".                  
            25  FLAG3                  PIC X.                           
             88  CAPO-APPESO           VALUE "1".                       
             88  CAPO-IN-SCATOLA       VALUE "0" , " ".                 
            25  FLAG4                  PIC X.                           
      *> ************* FLAG4 contiene il numero di pezzi                  
            25  FLAG5                  PIC X.                           
              88  CAPO-MODA VALUE "1".                                  
              88 NO-CAPO-MODA  VALUE "0" , " ".                         
              88 MAT-CONSUMO-MP VALUE "1".                              
              88 MAT-NO-CONSUMO-MP VALUE "0", " ".                      
              88 CAPO-DIVISA VALUE "D".                                 
              88 PROTOTIPO  VALUE "P".                                  
              88 PROMOZIONALE  VALUE "Z".                               
            25  FLAG6                  PIC X.                           
              88 NORMALE VALUE "0", " ".                                
              88 COMPON-TAILLEUR VALUE "1".                             
              88 TAILLEUR VALUE "2".                                    
            25 FLAG7  PIC X.                                            
              88 CAPO-ACQUISTO VALUE "1".                               
              88 CAPO-PROD     VALUE "2".                               
              88 ACCESS-ACQ    VALUE "3".                               
              88 CAPO-PROD-DIFF-TESS VALUE "5".                         
              88 CAPO-PROD-TERZI VALUE "6".                             
              88 CAPO-X-MAXIMA VALUE "1", "2", "3", "4".                
              88 ACCESS-FACON  VALUE "4".                               
              88 CAPO-ESTERNI-DIFF-TESS VALUE "E".                      
              88 CAPO-SCONTO-STOCK VALUE "E","2","5","6","4".           
            25 FLAG8  PIC X.                                            
              88 NO-CONFORM    VALUE "0" , " ".                         
              88 CONFORMATO    VALUE "1".                               
              88 MAXECO        VALUE "2".                               
      *> *** aggiunto INTREND = 3 modelli con collezione = 4,5,6,8        
      *> *** e societa = 5 ( non valido per riass. Maxima/MM/B2B          
      *> *** collez 7,9 )
              88 INTREND       VALUE "3".                               
              88 P-BLACK       VALUE "4".                               
              88 MARELLA       VALUE "5".                               
              88 SPORTMAX      VALUE "6".                               
              88 PERSONA       VALUE "7".                               
              88 WEEK-END      VALUE "8".                               
           20  PERC-MAGG              PIC S9(4) COMP.                   
      *> ************* PERC-MAGG contiene il campo DISEGNO                
           20  ALIQ-IVA               PIC S9(4)     COMP.               
           20  CL-GR                   PIC S9(4)    COMP.               
           20  COLLEZIONE              PIC S9(4)    COMP.               
           20  ANNO                    PIC S9(4)    COMP.               
           20  STAGIONE                PIC S9(4)    COMP.               
           20  COSTO                   PIC S9(9)    COMP.               
           20  UN-MIS                  PIC X(4).                        
           20  CAT-TAGLIO              PIC XX.                          
      *> ************* CAT-TAGLIO contiene il campo COLORE MAXIMA         
           20  MATER-MAX               PIC S9(4)    COMP.               
           20  CATEG-GHELDA REDEFINES MATER-MAX PIC S9(4) COMP.         
           20  TG-BASE                 PIC S9(4)    COMP.               
           20  PRIMA-TG                PIC S9(4)    COMP.               
           20  ULTIMA-TG               PIC S9(4)    COMP.               
           20  SCORTA-IND.                                              
            25  SCORTA                 PIC X.                           
            25  IND                    PIC X.                           
           20  TIPO-MAT                PIC XX.                          
           20  VALID-REC               PIC XX.                          
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YANAMAT END

                                     
      *>                                                                  
      *> BUDA*                                                            
       01 REC-CONFATT      *>      ===PREPROCESSOR==>COPY YCONFAT START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>           ***********************************                    
      *>           *  REC-CONFAT             LL=86   *                    
      *>           ***********************************                    
         15 CONTO                         PIC S9(8) COMP.               
         15 COND-PAG                       PIC S9(15) COMP-3.           
         15 COND-PAGAMENTO REDEFINES COND-PAG.                          
          20 CPAG                          PIC S9(5) COMP-3.            
          20 SCPAG                         PIC S9(4) COMP-3.            
          20 GGPAG                         PIC S99 COMP-3.              
         15 SC1                           PIC S9(4) COMP.               
         15 SC2                           PIC S9(4) COMP.               
         15 COD-FISCALE                    PIC X(16).                   
         15 COD-IVA                       PIC S9(9) COMP.               
         15 BANCA-APP                      PIC X(36).                   
         15 CAUSALE-IVA                   PIC S9(4) COMP.               
         15 DIVISA                         PIC X(4).                    
         15 MERCATO                       PIC S9(4) COMP.               
         15 NR-COPIE-FATT                 PIC S9(4) COMP.               
         15 LISTINO                       PIC S9(4) COMP.               
         15 VALIDITA-REC                   PIC XX.                      
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YCONFAT END

                                   
      *>                                                                  
      *> BUDA*                                                            
       01 REC-PREZZI      *>      ===PREPROCESSOR==>COPY YPREZZI START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                           *********************  
      *>             *************************************                
      *>             * REC-PREZZI           LL:38        *                
      *>             *************************************                
      *>                                                                  
           20 C-MAT                     PIC S9(15)    COMP-3.           
           20 MERCATO                   PIC S9(4)     COMP.             
           20 DIVISA                    PIC X(4).                       
           20 MAGAZZINO                 PIC S9(4) COMP.                 
           20 PREZZO-VENDITA-SUP.                                       
            25 PREZZO-VENDITA           PIC S9(9)     COMP OCCURS 4.    
           20 DATA-ULT-AGG              PIC S9(9) COMP.                 
           20 VALID-REC                 PIC X(2).                       
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YPREZZI END

                                    
      *>                                                                  
      *>                                                                  
      *> PRZ-PUBBL*                                                       
       01 REC-PREZZI-PUB      *>      ===PREPROCESSOR==>COPY YPREZZI START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                           *********************  
      *>             *************************************                
      *>             * REC-PREZZI           LL:38        *                
      *>             *************************************                
      *>                                                                  
           20 C-MAT                     PIC S9(15)    COMP-3.           
           20 MERCATO                   PIC S9(4)     COMP.             
           20 DIVISA                    PIC X(4).                       
           20 MAGAZZINO                 PIC S9(4) COMP.                 
           20 PREZZO-VENDITA-SUP.                                       
            25 PREZZO-VENDITA           PIC S9(9)     COMP OCCURS 4.    
           20 DATA-ULT-AGG              PIC S9(9) COMP.                 
           20 VALID-REC                 PIC X(2).                       
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YPREZZI END

                                  
      *>                                                                  
      *>                                                                  
       01 REC-INDIRIZZI      *>      ===PREPROCESSOR==>COPY YINDIRIZ START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>           ***********************************                    
      *>           *  REC-INDIRIZ            LL=236  *                    
      *>           ***********************************                    
         15 CONTO                        PIC S9(8) COMP.                
         15 D-AGG                         PIC X(24).                    
         15 D-BANCA REDEFINES D-AGG.                                    
          20 D-AGG-BANCA                  PIC X(12).                    
          20 CC-BANCA                     PIC X(12).                    
         15 INDIRIZZO                     PIC X(66)   OCCURS 2.         
         15 TIPO-INDIRIZZO                PIC XX.                       
          88  IND-FATT                    VALUE " F".                   
          88  IND-SPED                    VALUE "S ".                   
          88  IND-SPED-FATT               VALUE "SF".                   
         15 CAP                          PIC S9(8) COMP   OCCURS 2.     
         15 SIGLA-PROV                    PIC XX     OCCURS 2.          
         15 STATO                         PIC XXXX.                     
         15 TELEX                         PIC S9(8) COMP.               
      *>  per i clienti (da 10000001 a 10000899) assume i valori :        
      *>      0          invio anagrafica e dati a PC NEGOZIO             
      *>      99999      nessun invio                                     
         15 TELEFONO                       PIC S9(15) COMP-3.           
         15 CONTO-FATTURA                 PIC S9(8) COMP.               
         15 INF-COMM-INDIRIZ               PIC X(40).                   
         15 INF-COMM-ABB  REDEFINES  INF-COMM-INDIRIZ.                  
          20 PRIORITA                     PIC S9(4) COMP.               
      *>  nell'account RESIDUO se il valore e' 4 significa                
      *>  ristampa del CARTELLINO PREZZO                                  
          20 PROVINCIA                    PIC S9(4) COMP.               
          20 CAMPO-AGE  OCCURS 3.                                       
           25 CONTO-PROVV                 PIC S9(8) COMP.               
           25 PERC-PROVV                  PIC S9(4) COMP.               
           25 COLLEZIONI.                                               
            30 COLL-VENDITA                PIC S9 COMP-3 OCCURS 6.      
         15 VALIDITA-REC                   PIC XX.                      
          88 ANNULLATO                    VALUE "**".                   
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YINDIRIZ END

                                 
      *>                                                                  
       01 REC-SITPF      *>      ===PREPROCESSOR==>COPY YSITPF START
      *>                                                                  
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                             ******************** 
      *>             *************************************                
      *>             * REC SITPF         LL: 224         *                
      *>             *************************************                
            15 C-MAT               PIC S9(15) COMP-3.                   
            15 MAGAZZINO           PIC S9(4)  COMP.                     
            15 QTA-GIAC.                                                
             20  QTA-GIAC-PF        PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

      
            15 VAL-GIAC            PIC S9(11) COMP-3.                   
            15 QTA-INV.                                                 
             20 QTA-INV-PF       PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

         
            15 VAL-INV             PIC S9(11) COMP-3.                   
            15 DT-UM               PIC S9(8)  COMP.                     
            15 DT-INV              PIC S9(8)  COMP.                     
            15 QTA-ORDINATA.                                            
             20 QTA-ORD           PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

        
            15 QTA-ORDINATA-C.                                          
             20  QTA-ORD-C        PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

        
            15 QTA-IMPEGNATA.                                           
             20  QTA-IMP          PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

        
            15 QTA-IMPEGNATA-C.                                         
             20  QTA-IMP-C        PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

        
            15 VAL-REC             PIC XX.                              
             88 BOX-SOSPESO   VALUE "S ".                               
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YSITPF END

    
      *>                                                                  
       01 MOVMAG      *>      ===PREPROCESSOR==>COPY YMOVMAG START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>             **********************************                   
      *>             * REC MOVIMENTI MAGAZZINO LL: 96 *                   
      *>             **********************************                   
        14   D-MOVMAG.                                                  
        15 RIF-INTERNO                    PIC S9(15) COMP-3.            
        15 NUMERO-RIGA                   PIC S9(4) COMP.                
        15  RIF-ORDINE                    PIC S9(15) COMP-3.            
        15  RIF-BOLLA-FORN                PIC S9(15) COMP-3.            
        15  CLI-FINALE  REDEFINES RIF-BOLLA-FORN                        
                         PIC S9(15) COMP-3.                             
        15  C-MAT                         PIC S9(15) COMP-3.            
        15  CONTO                        PIC S9(8)  COMP.               
        15  C-OPE                         PIC X(4).                     
        15  PREZZO                          PIC S9(9) COMP.             
        15  COSTO-STD                    PIC S9(9) COMP.                
        15  SETTIMANA                    PIC S9(4) COMP.                
        15  FILLER-MOVMAG                PIC S9(4) COMP.                
        15  CATEG-GHELDA REDEFINES FILLER-MOVMAG PIC S9(4) COMP.        
        15  MOD-IMPUTAZ                   PIC S9(15) COMP-3.            
        15  DATA-AGG-TRASF-MOV REDEFINES                                
                       MOD-IMPUTAZ       PIC S9(15) COMP-3.             
        15  MAGAZZINO                        PIC S9(4) COMP.            
        15  DIVISA                           PIC X(4).                  
        15  UN-MIS-FATT                      PIC X(4).                  
        15 QTA-TAGLIE.                                                  
         20 QTA-TAGLIA               PIC S9(4) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

     
        15 QUANTITA                        PIC S9(11) COMP-3.           
       15  VAL-REC                           PIC XX.                    
      *>  Questi campi di MOVTRANS hanno un significato particolare       
      *>  per comodita' di trattamento :   (scritto da ANASOCM)           
      *>                                                                  
      *>        NUMERO-RIGA    1     se CARICO                            
      *>                      -1     se STORNO                            
      *>                                                                  
      *>        VAL-REC        BLANK se ORDINE NORMALE                    
      *>                       I     se ORDINE INSERITO                   
      *>                       R     se ORDINE RIASSORTIMENTO             
      *>                       XX    se SPEDIZIONE di MAXIMA     
      *> RESSDT*                                                          
      *>                       FR    se reso Franchising (SSDT)
      *>                       MX    se reso Maxima      (SSDT)
      *>                                                                  
      *> RETOPO*
      *>                       MN    se reso ManNord 
      *> 
      *>        MOD-IMPUTAZ    cod societa destinazione                   
      *>                                                                  
      *>  Questi significati vengono persi nel MOVMAG                     
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YMOVMAG END

                                         
      *>                                                                  
       01 REC-PARAMETRI      *>      ===PREPROCESSOR==>COPY YPARAMDT START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>           ***********************************                    
      *>           *  REC-PARAMDT            LL=150  *                    
      *>           ***********************************                    
         10   ENTRY-PARAM-DETAIL.                                       
          15  C-AZIENDA                   PIC 9(4)  COMP.               
          15  TIPO-PARAMETRI              PIC 9(4) COMP.                
            88  P-ANAGRAFICI              VALUE 1.                      
            88  P-ORDINI                  VALUE 2.                      
            88  P-MAGAZZINO               VALUE 3.                      
            88  P-CONTAB-GEN              VALUE 4.                      
            88  P-CONTAB-IND              VALUE 5.                      
            88  P-CONTAB-FIN              VALUE 6.                      
            88  P-DISTINTA-BASE           VALUE 7.                      
            88  P-FATTURAZIONE            VALUE 8.                      
            88  P-PAGHE                   VALUE 9.                      
            88  P-EXTRAMAG                VALUE 13.                     
            88  P-PROCEDURE-CED           VALUE 15.                     
            88  P-SUPERMAG                VALUE 23.                     
            88  P-RIPRADI                 VALUE 55.                     
            88  P-SERVIZI                 VALUE 99.                     
          15  STRINGA-PARAMETRI           PIC X(144).                   
          15  VALIDITA-REC                PIC XX.                       
          88 ANNULLATO                    VALUE "**".                   
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YPARAMDT END

                          
       01 REC-PARAM-RID REDEFINES REC-PARAMETRI.                        
        03 FILLER               PIC X(4).                               
        03 PARAM-MAG      *>      ===PREPROCESSOR==>COPY WPARAM13 START
      *> ********  ^ Non deve essere Azzerato   ***************           
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>             ************************************                 
      *>             * REC PARAMETRI MAGAZZINO  LL:144  *                 
      *>             ************************************                 
      *>                                                                  
           30     CAMPI-FLAG-13.                                        
            35    FLAG-1                    PIC X.                      
            35    FLAG-2                    PIC X.                      
            35    FLAG-3                    PIC X.                      
            35    FLAG-4                    PIC X.                      
            35    FLAG-5                    PIC X.                      
            35    FLAG-6                    PIC X.                      
            35    FLAG-7                    PIC X.                      
            35    FLAG-8                    PIC X.                      
            35    FILLER-FLAG               PIC X(24).                  
           30     CAMPI-FLAG-RID REDEFINES CAMPI-FLAG-13.               
            35    CAMPO-FLAG                PIC X OCCURS 32             
                                            INDEXED BY I-FLAG-13.       
           30     CAMPI-DATE-13.                                        
            35    DATA-BOLLA-TAGLIO-TESSUTO       PIC S9(8) COMP.       
            35    DATA-BOLLA-RESI-PF REDEFINES                          
                                           DATA-BOLLA-TAGLIO-TESSUTO    
                                                      PIC S9(8) COMP.   
            35    DATA-BOLLA-TAGLIO-INTERNI       PIC S9(8) COMP.       
            35    DATA-BOLLA-TAGLIO-FODERE        PIC S9(8) COMP.       
            35    DATA-BOLLA-MATERASSO            PIC S9(8) COMP.       
            35    DATA-TRAVASO REDEFINES DATA-BOLLA-MATERASSO           
                                                      PIC S9(8) COMP.   
            35    DATA-RIEP-MAG                   PIC S9(8) COMP.       
            35    DATA-6                          PIC S9(8) COMP.       
            35    DATA-7                          PIC S9(8) COMP.       
            35    DATA-8                          PIC S9(8) COMP.       
           30     CAMPI-DATE-RID REDEFINES CAMPI-DATE-13.               
            35    CAMPO-DATA                PIC S9(8) COMP OCCURS 8     
                                            INDEXED BY I-CAMPO-DATA-13. 
           30     CAMPI-NUMERI-13.                                      
            35    NUM-BOLLA-RESI-PF                   PIC S9(8) COMP.   
      *> ********  ^ Numero di partenza  350001 ***************           
            35    NUM-BOLLA-TAGLIO-INTERNI            PIC S9(8) COMP.   
            35    NUM-BOLLA-TAGLIO-FODERE             PIC S9(8) COMP.   
            35    NUM-BOLLA-MATERASSO                 PIC S9(8) COMP.   
            35    NUM-TRAVASO REDEFINES NUM-BOLLA-MATERASSO             
                                                      PIC S9(8) COMP.   
            35    NUM-BUONO-PRELIEVO                  PIC S9(8) COMP.   
            35    NUM-CONSEGNA-NO-BOLLA               PIC S9(8) COMP.   
            35    NUM-CONSEGNA-BOLLA                  PIC S9(8) COMP.   
      *> ********  ^ Numero di partenza  090001 ***************           
            35    NUMERO-PEZZA                        PIC S9(8) COMP.   
      *> ********  ^ Non deve essere Azzerato   ***************           
           30     CAMPI-NUMERI-RID REDEFINES CAMPI-NUMERI-13.           
            35    CAMPO-NUMERO              PIC 9(8)  COMP OCCURS 8     
                                            INDEXED BY I-CAMPO-NUM-13.  
           30     CAMPI-CHIAVE-13.                                      
            35    KEY-1                     PIC X(4).                   
            35    KEY-2                     PIC X(4).                   
            35    KEY-3                     PIC X(4).                   
            35    KEY-4                     PIC X(4).                   
           30     CAMPI-CHIAVE-RID REDEFINES CAMPI-CHIAVE-13.           
            35    CAMPO-CHIAVE              PIC X(4) OCCURS 4           
                                  INDEXED BY I-CAMPO-KEY-13.            
           30    PARAMETRI-VARI             PIC X(32).                  
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY WPARAM13 END

                             
      *> 
      *> volante*
       01 REC-PARAM-FITTIZI      *>      ===PREPROCESSOR==>COPY YPARAMDT START
           .                                                            
      *> IF X7=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>           ***********************************                    
      *>           *  REC-PARAMDT            LL=150  *                    
      *>           ***********************************                    
         10   ENTRY-PARAM-DETAIL.                                       
          15  C-AZIENDA                   PIC 9(4)  COMP.               
          15  TIPO-PARAMETRI              PIC 9(4) COMP.                
            88  P-ANAGRAFICI              VALUE 1.                      
            88  P-ORDINI                  VALUE 2.                      
            88  P-MAGAZZINO               VALUE 3.                      
            88  P-CONTAB-GEN              VALUE 4.                      
            88  P-CONTAB-IND              VALUE 5.                      
            88  P-CONTAB-FIN              VALUE 6.                      
            88  P-DISTINTA-BASE           VALUE 7.                      
            88  P-FATTURAZIONE            VALUE 8.                      
            88  P-PAGHE                   VALUE 9.                      
            88  P-EXTRAMAG                VALUE 13.                     
            88  P-PROCEDURE-CED           VALUE 15.                     
            88  P-SUPERMAG                VALUE 23.                     
            88  P-RIPRADI                 VALUE 55.                     
            88  P-SERVIZI                 VALUE 99.                     
          15  STRINGA-PARAMETRI           PIC X(144).                   
          15  VALIDITA-REC                PIC XX.                       
          88 ANNULLATO                    VALUE "**".                   
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY YPARAMDT END

                         
       01 REC-PARAM-FITTIZ-R REDEFINES REC-PARAM-FITTIZI.               
        03 FILLER               PIC X(4).                               
        03 PARAM-RIPRADI      *>      ===PREPROCESSOR==>COPY WPARAM55 START
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                            ********************* 
      *>             ************************************                 
      *>             * REC PARAMETRI MAGAZZINO  LL:144  *                 
      *>             ************************************                 
      *>                                                                  
           30     CAMPI-FLAG-55.                                        
            35    FLAG-1                    PIC X.                      
            35    FLAG-2                    PIC X.                      
            35    FLAG-3                    PIC X.                      
            35    FLAG-4                    PIC X.                      
            35    FLAG-5                    PIC X.                      
            35    FLAG-6                    PIC X.                      
            35    FLAG-7                    PIC X.                      
            35    FLAG-8                    PIC X.                      
            35    FILLER-FLAG               PIC X(24).                  
           30     CAMPI-FLAG-RID REDEFINES CAMPI-FLAG-55.               
            35    CAMPO-FLAG                PIC X OCCURS 32             
                                            INDEXED BY I-FLAG-55.       
           30     CAMPI-DATE-55.                                        
            35    FILLER                          PIC S9(8) COMP.       
            35    FILLER                          PIC S9(8) COMP.       
            35    FILLER                          PIC S9(8) COMP.       
            35    FILLER                          PIC S9(8) COMP.       
            35    FILLER                          PIC S9(8) COMP.       
            35    DATA-6                          PIC S9(8) COMP.       
            35    DATA-7                          PIC S9(8) COMP.       
            35    DATA-8                          PIC S9(8) COMP.       
           30     CAMPI-DATE-RID REDEFINES CAMPI-DATE-55.               
            35    CAMPO-DATA                PIC S9(8) COMP OCCURS 8     
                                            INDEXED BY I-CAMPO-DATA-55. 
           30     CAMPI-NUMERI-55.                                      
            35    PAR-PROGR-SESS                      PIC S9(8) COMP.   
      *>             ****SESSIONE DI CONTROLLO***********                 
            35    PAR-PROGR-SORTER                    PIC S9(8) COMP.   
      *>             ***SETTORE LOGICO VITE ESTERNA******                 
            35    PAR-PROGR-PRESPED                   PIC S9(8) COMP.   
      *>             ***NUMERO DI PRE SPEDIZIONE*********                 
            35    PAR-FITTIZIO-1                      PIC S9(8) COMP.   
      *>             ***utilizzo di comodo      *********                 
            35    NUM-TRASF-DA-MAG-4                  PIC S9(8) COMP.   
            35    FILLER                              PIC S9(8) COMP.   
            35    PAR-RESI-SS                         PIC S9(8) COMP.   
      *>             ***numero rif. interno resi stock service            
            35    FILLER                              PIC S9(8) COMP.   
           30     CAMPI-NUMERI-RID REDEFINES CAMPI-NUMERI-55.           
            35    CAMPO-NUMERO              PIC 9(8)  COMP OCCURS 8     
                                            INDEXED BY I-CAMPO-NUM-55.  
           30     CAMPI-CHIAVE-55.                                      
            35    KEY-1                     PIC X(4).                   
            35    KEY-2                     PIC X(4).                   
            35    KEY-3                     PIC X(4).                   
            35    KEY-4                     PIC X(4).                   
           30     CAMPI-CHIAVE-RID REDEFINES CAMPI-CHIAVE-55.           
            35    CAMPO-CHIAVE              PIC X(4) OCCURS 4           
                                  INDEXED BY I-CAMPO-KEY-55.            
           30    PARAMETRI-VARI             PIC X(32).                  
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY WPARAM55 END

                         
      *>       
       01 RIGA-PENDENTI.                                                
        03 ANTE-PRIMA-RIGA.                                             
          10 FILLER        PIC X(9).                                    
          10 NUMERO-P      PIC 9(6).                                    
          10 FILLER        PIC X(18).                                   
        03 PRIMA-RIGA.                                                  
          10 FILLER        PIC X(9).                                    
          10 CODICE-P      PIC 9(14).                                   
          10 FILLER        PIC X(10).                                   
        03 SECONDA-RIGA.                                                
          10 FILLER        PIC X(9).                                    
          10 NOME-P        PIC X(14).                                   
          10 FILLER        PIC X(10).                                   
      *> EURO*                                                            
      *>                                                                  
        03 TERZA-RIGA.                                                  
          10 DIV-LIT       PIC X(9).                                    
          10 PREZZO-P      PIC ZZ.ZZZ.ZZZ.ZZZ.                          
          10 FILLER        PIC X(10).                                   
      *>                                                                  
        03 QUARTA-RIGA.                                                 
          10 DIV-EUR       PIC X(11).                                   
          10 PREZZO-P-E    PIC Z(7),ZZ.                                 
          10 FILLER        PIC X(12).                                   
      *>                                                                  
      *> BUDA*                                                            
       01 CAMPI-X-WRITE.                                                
        05 RIF-INTR-WR        PIC 9(12).                                
        05 CONTO-CLI-WR       PIC S9(9) COMP.                           
        05 CONTO-DEST-WR      PIC S9(9) COMP.                           
        05 MAGAZZINO-WR       PIC S9(4) COMP.                           
        05 DEST-WR            PIC S9(4) COMP.                           
           88 X-ESTERO     VALUE 3.                                     
           88 X-RESIDUO    VALUE 2.                                     
        05 DIVISA-WR          PIC XXXX.                                 
        05 LISTINO-WR         PIC 9(4).                                 
        05 CAUSALE-WR         PIC X(4).                                 
      *>                                                                  
       01 DATA-CARICO-WR      PIC 9(6).                                 
      *>                                                                  
      *>                                                                  
      *> BUDA*                                                            
      *>                                                                  
       01 LISTINO-MEM      PIC 9999.                                    
       01 DIVISA-MEM    PIC X(4).                                       
      *>                                                                  
      *> PRODI*                                                           
       01 CAMBIO-MEM   PIC S9(9) COMP.                                  
      *>                                                                  
       01 CAMPI-UTILI.                                                  
        05 OK-GIAC           PIC S9(4) COMP.                            
           88 GIAC-OK        VALUE 1.                                   
      *> NOPRZ*                                                           
        05 OK-PREZZO         PIC S9(4) COMP.                            
           88 PREZZO-OK      VALUE 1.                                   
      *>                                                                  
        05 CONTA-PAGINE          PIC S9(4) COMP.                        
        05 TOT-CAPI-NO-GIAC      PIC 9(4).                              
      *>                                                                  
        05 CONTA-RIGHE           PIC S9(4) COMP.                        
        05 USCITA-PROGRAMMA      PIC S9(4) COMP.                        
        05 RISP-NO-GIAC        PIC X.                                   
      *> NOPRZ*                                                           
        05 RISP-NO-PREZZO      PIC X.                                   
      *> BUDA*                                                            
        05 FLAG-ANACON       PIC X.                                     
        05 SOC-COM              PIC 99.                                 
        05 FILLER REDEFINES SOC-COM.                                    
         10 PRE-SOC       PIC 9.                                        
         10 SOC-REALE     PIC 9.                                        
        05 TROVATO-GIAC    PIC S9(4) COMP.                              
           88 GIAC-TROVATA   VALUE 1.                                   
        05 NUM-BOLLE             PIC S9(8) COMP.                        
        05 IND-CAPI-LETTI        PIC S9(4) COMP.                        
        05 TOT-BOLLA-C              PIC S9(4) COMP.                     
        05 TOT-CAPI-RIGA-C              PIC S9(4) COMP.                 
        05 IND-PAG        PIC S9(4) COMP.                               
        05 ITB-T          PIC S9(4) COMP.                               
        05 ITB-T-5        PIC S9(4) COMP.                               
        05 IND-CL          PIC S9(4) COMP.                              
        05 VARIAZIONE        PIC S9(4) COMP.                            
          88 FINE-VARIAZIONI   VALUE 1.                                 
        05 INDIRIZZO-DPARAM    PIC S9(9) COMP.                          
        05 D-MAT-MEM       PIC X(24).                                   
        05 VAL-REC-MEM  PIC XX.                                         
        05 IND-RIGA        PIC S9(4) COMP.                              
        05 CNTR-ANAMAT      PIC S9(4) COMP.                             
           88 C-MAT-OK   VALUE 1.                                       
        05 DISP-15         PIC 9(15).                                   
        05 DISP-3          PIC 999.                                     
      *> BUDA*                                                            
        05 TG-CAL          PIC 99.                                      
        05 PTG-MEM         PIC S9(4) COMP.                              
        05 TAGLIO-MEM      PIC S9(4) COMP.                              
        05 IND-FILE           PIC 9(6).                                 
        05 COD-REC      PIC S9(4) COMP.                                 
        05 ESIST-VECCHIO   PIC S9(4) COMP.                              
           88 VECCHIO-ESIST VALUE 1.                                    
        05 OK-O-N          PIC S9(4) COMP.                              
           88 O-N-OK VALUE 1.                                           
        05 OK-NEG          PIC S9(4) COMP.                              
           88 NEG-OK VALUE 1.                                           
        05 CONT                 PIC S9(4) COMP.                         
        05 CONT-D               PIC ZZZZ.                               
        05 PREZZO-D             PIC Z(6)9,99.                           
        05 PREZZO-TOT-D         PIC ZZZ.ZZZ.ZZ9,99.                     
        05 FINITO             PIC S9(4) COMP.                           
           88 FINE-FILE VALUE 1.                                        
        05 IND-4              PIC S9(4) COMP.                           
        05 CONFERMA-STORNO PIC XX.                                      
        05 C-MAT-MEM  PIC 9(15).                                        
      *> T5000*                                                           
        05 USCITA-DEVICE  PIC S9(4) COMP.                               
           88 DEV-OK VALUE 1.                                           
      *>                                                                  
      *>                                                                  
       01 COL-COM.                                                      
        05 PRE-COL         PIC 9.                                       
        05 COL-VAR         PIC 99.                                      
       01 COL-COM-R REDEFINES COL-COM  PIC 999.                         
      *>                                                                  
      *> 2000*                                                            
      *> 01 DATA-BOLLA-COM        PIC 9(6).                               
      *> 01 FILLER REDEFINES DATA-BOLLA-COM.                              
      *>  05 AA-COM           PIC 99.                                     
      *>  05 MM-COM           PIC 99.                                     
      *>  05 GG-COM           PIC 99.                                     
      *>                                                                  
      *>                                                                  
      *> 2000*                                                            
      *> 01 RIF-INTR.                                                     
      *>   05 AA-MM-GG PIC 9(6).                                          
      *>   05 NUMERO PIC 9(6).                                            
      *> 01 RIF-INTR-RID REDEFINES RIF-INTR    PIC 9(12).                 
      *>                                                                  
      *> 2000*                                                            
      *> 01 DATA-BOLLA-COM-R          PIC 9(6).                           
      *> 01 FILLER REDEFINES DATA-BOLLA-COM-R.                            
      *>  05 GG-COM-R         PIC 99.                                     
      *>  05 MM-COM-R         PIC 99.                                     
      *>  05 AA-COM-R         PIC 99.                                     
      *>                                                                  
      *>                                                                  
       01 PARQDATA      *>      ===PREPROCESSOR==>COPY QPARDATS START
      *>                                            ********************* 
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05  Q-PARAMETRI-DATA.                                          
          10  Q-DATA-E.                                                 
           15  Q-DATA.                                                  
            20 Q-GG                  PIC 99.                            
            20 Q-MM                  PIC 99.                            
            20 Q-AA                  PIC 99.                            
           15 Q-DATA-9 REDEFINES Q-DATA   PIC 9(6).                     
           15 FILLER                 PIC X(6).                          
          10  FILLER REDEFINES Q-DATA-E.                                
           15 Q-DATA-EE.                                                
            20 Q-GG-S                PIC XXX.                           
            20 Q-MM-S                PIC X(4).                          
            20 Q-AA-S                PIC X(4).                          
           15 FILLER                 PIC X.                             
      *>                                                                  
         05  Q-DATA-I                PIC S9(8)   COMP.                  
      *>                                                                  
         05  Q-SETTIMANA             PIC S9(4)   COMP.                  
      *>                                                                  
      *>                                                                  
      *>      FUNZ. = 1  Q-DATA-E  IN  Q-DATA-I                           
      *>      FUNZ. = 2  Q-DATA-I  IN  Q-DATA-E                           
      *>      FUNZ. = 3  Q-DATA-I  IN  Q-DATA-EE                          
      *>      STATO = 0  TUTTO OK                                         
      *>      STATO = -1 ERR MESE                                         
      *>      STATO = -2 ERR GIORNO                                       
      *>      STATO = -3 ERR MESE PER FUNZIONE = 3                        
      *>      STATO = -4 ERR CAMPI NON NUMERICI                           
      *>                                                                  
      *> *****************************                                    
      *>  La funzione 2 serve solo per capovolgere una data dal           
      *>  formato AAMMGG al formato GGMMAA non esegue controlli           
      *>  per fare un controllo bisogna prima metterla in formato         
      *>  GGMMAA poi eseguire il controllo con la funzione 1 poi          
      *>  riportarla nel formato AAMMGG                                   
      *>                                                                  
      *> CONTROL LIST                                                     
      *>      ===PREPROCESSOR==>COPY QPARDATS END

                                      
       01 PARGEN      *>      ===PREPROCESSOR==>COPY QPARGEN START
      *>                                            ********************* 
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05  Q-PARAMETRI-GEN.                                           
          10  Q-STATO              PIC S9(4)    COMP.                   
          10  Q-FUNZIONE           PIC  9(4)    COMP.                   
          10  Q-PARAMETRO-2        PIC  9(4)    COMP.                   
          10  Q-PARAMETRO-3        PIC  9(4)    COMP.                   
          10  Q-PARAMETRO-4        PIC  9(4)    COMP.                   
          10  Q-PARAMETRO-5        PIC  9(4)    COMP.                   
          10  Q-PARAMETRO-6        PIC  9(4)    COMP.                   
          10  Q-PARAMETRO-7        PIC  XX.                             
          10  FILLER               PIC  XX.                             
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY QPARGEN END

                                       
       01 PARAGGPF      *>      ===PREPROCESSOR==>COPY PARAGGPF START
      *>                                                                  
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           20  C-MAT                   PIC S9(15) COMP-3.               
           20  MAGAZZINO               PIC S9(4) COMP.                  
           20  VALORE                  PIC S9(9) COMP.                  
           20  QTA-8.                                                   
            25  QTA         PIC S9(4) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

              
           20  FLAGS-AGGIORNAMENTO.                                     
            25  F-GIAC                 PIC S9(4) COMP.                  
                   88  NO-GIAC         VALUE 0.                         
            25  F-QTA-ORD              PIC S9(4) COMP.                  
                   88  NO-QTA-ORD      VALUE 0.                         
            25  F-QTA-ORD-C            PIC S9(4) COMP.                  
                   88  NO-QTA-ORD-C    VALUE 0.                         
            25  F-QTA-IMP              PIC S9(4) COMP.                  
                   88  NO-QTA-IMP      VALUE 0.                         
            25  F-QTA-IMP-C            PIC S9(4) COMP.                  
                   88  NO-QTA-IMP-C    VALUE 0.                         
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PARAGGPF END

                                      
      *>                                                                  
       01 CODICE-CONTO PIC 9(8).                                        
       01 CODICE-CONTO-R REDEFINES CODICE-CONTO.                        
         05 CAPO-CONTO PIC 9(3).                                        
         05 SOTTO-CONTO PIC 9(5).                                       
         05 SOTTO-CONTO-R REDEFINES SOTTO-CONTO.                        
           10 SOTTO-CONTO-3 PIC 999.                                    
           10 SOTTO-CONTO-2 PIC 99.                                     
      *>                                                                  
      *>                                                                  
       01 TABELLA-SINGOLI.                                              
      *> MOVSKU                             
      *>   05 ELEM-TAB-SING     PIC X(23) OCCURS 9999.                    
        05 ELEM-TAB-SING     PIC X(36) OCCURS 9999.
      *>                                                                  
       01 ELEMENTO-SINGOLI.                                             
      *>   05 CONT-SING         PIC S9(4) COMP.                           
        05 C-MAT-SING        PIC S9(15) COMP-3.
        05 CONT-SING         PIC S9(4) COMP.  
        05 D-MAT-SING        PIC X(7).                                  
        05 PREZZO-SING       PIC S9(9) COMP.                            
        05 PRIMA-TG-SING     PIC S9(4) COMP. 
      *> MOVSKU
        05 SKU-SING          PIC X(13).                                 
      *>                                                                  
       01 PARTAB-SING      *>      ===PREPROCESSOR==>COPY QPARTAB START
      *>                                 ******************************   
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05 QT-PARAMETRI.                                               
          10 QT-STATO               PIC S9(4) COMP.                     
          10 QT-NUM-ELEM-EFF        PIC  9(4) COMP.                     
          10 QT-NUM-ELEM-MAX        PIC  9(4) COMP.                     
          10 QT-LL-ELEM             PIC  9(4) COMP.                     
          10 QT-ADDR-KEY            PIC  9(4) COMP.                     
          10 QT-LL-KEY              PIC  9(4) COMP.                     
          10 QT-INDEX-ELEM          PIC  9(4) COMP.                     
          10 QT-FUNZIONE            PIC  XX.                            
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY QPARTAB END

                               
      *>                                                                  
       01  DATI-INPUT.                                                  
        05 CONTO-IN         PIC X(8).                                   
        05 CONTO-IN-R REDEFINES CONTO-IN   PIC 9(8).                    
      *> PRZ-PUBBL*                                                       
          88 CONTO-DEMA     VALUES ARE 10010101 10010362.               
      *>                                                                  
        05 CONTO-FINE REDEFINES CONTO-IN   PIC XXX.                     
      *> BUDA*                                                            
        05 FILLER REDEFINES CONTO-IN.                                   
          10 FILLER         PIC XXX.                                    
          10 FILLER         PIC XX.                                     
          10 NEG-IN         PIC 999.                                    
      *>                                                                  
        05 COD-IN      *>      ===PREPROCESSOR==>COPY DANCODBC START
      *>                                                                  
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
      *>                                                                  
      *>          *****************************************               
      *>          *  DESCRIZIONE CODICE ARTICOLO A BARRE  *               
      *>          *****************************************               
      *>                                                                  
           15 C-MAT-A-BARRE.                                            
            20 MODELLO               PIC 9(7).                          
            20 MOD-RID REDEFINES MODELLO.                               
             25 MARCHIO              PIC 9.                             
             25 CLASSE               PIC 99.                            
             25 STAGIONE             PIC 9.                             
             25 PROGR-ART            PIC 99.                            
             25 ANNO                 PIC 9.                             
            20 VESTIBILITA           PIC 9.                             
            20 SOCIETA               PIC 99.                            
            20 FILLER REDEFINES SOCIETA.                                
             25 PREFBC-V-F           PIC 9.                             
             25 SOC-BC-MOD           PIC 9.                             
            20 PEZZO                 PIC 9.                             
            20 VARIANTE-COL          PIC 99.                            
            20 TAGLIA                PIC 9.                             
           15 C-MAT-A-BARRE-RID REDEFINES C-MAT-A-BARRE  PIC 9(14).     
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY DANCODBC END

                                      
        05 COD-IN-RID REDEFINES COD-IN   PIC X.                         
           88 LETT-FINE      VALUE ".".                                 
           88 LETT-ANN-ULT   VALUE "%".                                 
           88 LETT-ANN-TUTTO VALUE "@".                                 
           88 LETT-STAMPA    VALUES "S", "s".
      *> 
      *> Mag3_V/F*
       01 F-V-INPUT   PIC X.
      *> 
       01 MEM-COD-IN  PIC X(14).                                        
      *>                                                                  
      *> T5000*                                                           
       01 DEV-IN           PIC X(2).
           01 DISIMPEGNA       PIC XX.
           01 DA-TRASFERIRE    PIC S9(8) COMP.
      *>                                                                  
       01 C-MAT-COM      *>      ===PREPROCESSOR==>COPY DANCODMT START
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           15 C-MAT-TRANSITO.                                           
             20  MODELLO                  PIC 9(7).                     
             20 MOD-RID  REDEFINES MODELLO.                             
              25  COLLEZIONE              PIC 9.                        
              25  CLASSE                  PIC 99.                       
              25  STAGIONE                PIC 9.                        
              25  PROGR-MOD               PIC 99.                       
              25  ANNO                    PIC 9.                        
             20  ARTICOLO                 PIC 9(5).                     
             20 ART-RID  REDEFINES ARTICOLO.                            
              25 GR-MERC                  PIC 99.                       
              25 FILLER REDEFINES GR-MERC.                              
                30 VEST-A                 PIC 9.                        
                30 PEZZO-A                PIC 9.                        
              25 PROGR-ART                PIC 999.                      
              25 FILLER REDEFINES PROGR-ART.                            
               30 FILLER                  PIC 9.                        
               30 PREFISSO-V-F            PIC 9.                        
               30 SOCIETA-MOD             PIC 9.                        
             20  COLORE                   PIC 999.                      
      *>                                                                  
           15 C-MAT-TRANS-RID REDEFINES C-MAT-TRANSITO PIC 9(15).       
      *> CONTROL LIST                                                     
      *>      ===PREPROCESSOR==>COPY DANCODMT END

                                      
      *>                                                                  
       01 COM-QTA-DISP     PIC S9(4) COMP.                              
      *>                                                                  
       01 TABELLA-ARTICOLI-LETTI.                                       
        03 ART-TAB-LETTI   OCCURS 5000.                                 
         05 TAB-ART        PIC S9(15) COMP-3.                           
         05 D-MAT-TAB      PIC X(7).                                    
      *> BUDA*                                                            
         05 PRIMA-TG-TAB     PIC S9(4) COMP.                            
         05 PREZZO-TAB       PIC S9(9) COMP.                            
         05 CAMBIO-TAB       PIC S9(9) COMP.                            
         05 TIPO-ANA-TAB  PIC XX.                                       
         05 QTA-GIAC-TAB.                                               
           10 QTA-GIAC-PF-TAB  PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

 
         05 QTA-TAGLIE-TAB.                                             
           10 QTA-TAGLIA-TAB PIC S9(4) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

 
      *> VACO*                                                            
         05 COSTO-TAB       PIC S9(9) COMP.
      *>                                                                  
       01 ART-ELEM-LETTI.                                               
         05 ELEM-ART        PIC S9(15) COMP-3.                          
         05 D-MAT-ELEM     PIC X(7).                                    
      *> BUDA*                                                            
         05 PRIMA-TG-ELEM    PIC S9(4) COMP.                            
         05 PREZZO-ELEM      PIC S9(9) COMP.                            
         05 CAMBIO-ELEM      PIC S9(9) COMP.                            
         05 TIPO-ANA-ELEM    PIC XX.                                    
         05 QTA-GIAC-ELEM.                                              
           10 QTA-GIAC-PF-ELEM  PIC S9(8) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

        
         05 QTA-TAGLIE-ELEM.                                            
           10 QTA-TAGLIA-ELEM PIC S9(4) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

    
      *> VACO*                                                            
         05 COSTO-ELEM       PIC S9(9) COMP.
      *>                                                                  
       01 QTA-TAGLIE-NEG.                                               
           10 QTA-TAGLIA-NEG PIC S9(4) COMP      *>      ===PREPROCESSOR==>COPY NTGOCCURS START
              OCCURS 10.
      *>      ===PREPROCESSOR==>COPY NTGOCCURS END

             
      *>                                                                  
       01 NUM-ELEM-MAX-ART  PIC S9(4) COMP VALUE 5000.                  
      *>                                                                  
       01 PARTAB-ART      *>      ===PREPROCESSOR==>COPY QPARTAB START
      *>                                 ******************************   
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05 QT-PARAMETRI.                                               
          10 QT-STATO               PIC S9(4) COMP.                     
          10 QT-NUM-ELEM-EFF        PIC  9(4) COMP.                     
          10 QT-NUM-ELEM-MAX        PIC  9(4) COMP.                     
          10 QT-LL-ELEM             PIC  9(4) COMP.                     
          10 QT-ADDR-KEY            PIC  9(4) COMP.                     
          10 QT-LL-KEY              PIC  9(4) COMP.                     
          10 QT-INDEX-ELEM          PIC  9(4) COMP.                     
          10 QT-FUNZIONE            PIC  XX.                            
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY QPARTAB END

                                    
      *>                                                                  
       01 TABELLA-NO-GIAC.                                              
        05 ELEM-NO-GIAC    OCCURS 1000.                                 
         10 C-MAT-NO-GIAC       PIC S9(15) COMP-3.                      
         10 PREZZO-NO-GIAC       PIC S9(9) COMP.                        
         10 D-MAT-NO-GIAC        PIC X(7).                              
      *> PRZBU*                                                           
         10 CAUSALE-NO-GIAC      PIC X(10).                             
         10 CAUSALE-NO-PRZ       PIC X(10).                             
      *>                                                                  
       01 IND-CAPI-NO-GIAC      PIC S9(4) COMP.                         
      *>                                                                  
       01 COMANDO-BUILD.                                                
         05 FILLER PIC X(7) VALUE "BUILD P".                            
         05 BUILD-N-DDT      PIC 9(6).                                  
         05 FILLER           PIC X(30) VALUE                            
                  ";REC=-132,3,F,ASCII;DISC=20000".                     
         05 CARRIAGE-RETURN PIC X VALUE X"13".                          
      *>                                                                  
       01 COMANDO-FILE.                                                 
         05 FILLER PIC X(11) VALUE "FILE PEND=P".                       
         05 FILE-N-DDT       PIC 9(6).                                  
         05 CARRIAGE-RETURN PIC X VALUE X"13".                          
      *>                                                                  
       01 COMANDO-FILE-2.                                               
         05 FILLER PIC X(6) VALUE "FILE P".                             
         05 FILE-N-DDT-2     PIC 9(6).                                  
         05 FILLER PIC X(9) VALUE ";DEV=91,5".                          
         05 CARRIAGE-RETURN PIC X VALUE X"13".                          
      *>                                                                  
       01 COMANDO-PURGE.                                                
         05 FILLER PIC X(7) VALUE "PURGE P".                            
         05 PURGE-N-DDT      PIC 9(6).                                  
         05 CARRIAGE-RETURN PIC X VALUE X"13".                          
      *>                                                                  
       01 COMANDO-PRINT.                                                
         05 FILLER PIC X(7) VALUE "PRINT P".                            
         05 PRINT-N-DDT         PIC 9(6).                               
         05 FILLER              PIC X(7) VALUE ";OUT=*P".               
         05 PRINT-N-DDT-2       PIC 9(6).                               
         05 CARRIAGE-RETURN PIC X VALUE X"13".                          
      *>                                                                  
      *> conv
      *> 
       01 COMANDO-LPR-LINUX.
         05 FILLER                PIC X(9) VALUE "lpr -P p1".
         05 LPR-NUM-STAMPANTE     PIC 99.
         05 FILLER                PIC X VALUE " ".
         05 LPR-NOME-FILE         PIC X(80).
         05 FILLER                PIC X VALUE X"00".
      *> 
       01 WK-VAR-NAME             PIC X(80).
       01 WK-VAR-VALUE            PIC X(80).
      *> 
       01 DIR-VAR-NAME            PIC X(80).
       01 DIR-VAR-VALUE           PIC X(80).
      *> 
       01 USER-VAR-NAME           PIC X(80).
       01 USER-VAR-VALUE          PIC X(80).
      *> 
       01 FILE-VAR-NAME           PIC X(80).
       01 FILE-VAR-VALUE          PIC X(80).
      *> 
      *> conv-end
       01 ERR   PIC S9999  COMP VALUE 0.                                
       01 ERR-PARM  PIC S9999 COMP VALUE 0.                             
      *>                                                                  
       01 LOCALITA-PART-STR      PIC X(52).
      *>   "Magazzino Via Santi 8, Cavriago (R.E.) ".                     
      *> 
      *>  Tabella di mappatura magazzino -> localita'
      *> 
       01 IND-LOC                PIC S9(4) COMP.
      *>  allineare con il numero di occorrenze della tabella espansa!
       01 MAX-LOC                PIC S9(4) COMP VALUE 4.
      *> 
       01 TAB-LOC-EXP.
         05 FILLER               PIC 9(3)  VALUE   2.
         05 FILLER               PIC X(52) VALUE
            "Magazzino Via Santi 8, Cavriago (R.E.) ".
         05 FILLER               PIC 9(3)  VALUE   3.
         05 FILLER               PIC X(52) VALUE
      *>  "Via Dell'Artigianato 2/A Qre SPIP(PR) c/o LA GIOVANE".       
            "Magazzino Via Santi 5, Cavriago (R.E.) ".
         05 FILLER               PIC 9(3)  VALUE   6.
         05 FILLER               PIC X(52) VALUE
            "Magazzino Via Santi 8, Cavriago (R.E.) ".
         05 FILLER               PIC X(52) VALUE
            "Magazzino Via Santi 8, Cavriago (R.E.) ".            
         05 FILLER               PIC 9(3)  VALUE   7.
         05 FILLER               PIC X(52) VALUE
            "Magazzino Via Santi 8, Cavriago (R.E.) ".
      *>  allineare le occorrenze con quelle della tabella espansa!
       01 TAB-LOC REDEFINES TAB-LOC-EXP.
         05 FILLER OCCURS    4.
           10 COD-LOC            PIC 9(3).
           10 DESC-LOC           PIC X(52).
      *> 
      *>                                                                  
       01 RIGA-DISP.                                                    
        03 DATI-DISP-4   OCCURS 3.                                      
         05 FILLER        PIC XXX.                                      
         05 DISP-ART      PIC Z(14).                                    
        05 FILLER      PIC X.                                           
         05 PARE1  PIC X.                                               
         05 QTA-DISP  PIC ZZZ.                                          
         05 PARE2  PIC X.                                               
      *>                                                                  
       01 TOT-CAPI-LETTI-1     PIC 9(4).                                
      *>                                                                  
       01 TAB-LOCK.                                                     
         05 FILLER PIC S9(4) COMP VALUE 4.                              
         05 FILLER PIC S9(4) COMP VALUE 17.                             
         05 FILLER PIC X(16) VALUE "DPARAM;".                           
         05 FILLER PIC X(16) VALUE "@".                                 
         05 FILLER PIC S9(4) COMP VALUE 17.                             
         05 FILLER PIC X(16) VALUE "SITPF;".                            
         05 FILLER PIC X(16) VALUE "@".                                 
         05 FILLER PIC S9(4) COMP VALUE 17.                             
         05 FILLER PIC X(16) VALUE "MOVMAG;".                           
         05 FILLER PIC X(16) VALUE "@".                                 
         05 FILLER PIC S9(4) COMP VALUE 17.                             
         05 FILLER PIC X(16) VALUE "BOLLE;".                            
         05 FILLER PIC X(16) VALUE "@".                                 
      *>                                                                  
      *>                                                                  
       01 STK-NOME       PIC X(30).                                     
       01 STK-C-MAT      PIC 9(15) COMP-3.                              
       01 STK-STAGIONE   PIC 9.                                         
       01 STK-SCO        PIC 9(5) COMP.                                 
       01 STK-COLL    PIC 99.                                           
       01 STK-PRZ-SCO    PIC 9(9) COMP.                                 
       01 STK-PRZ-LORDO  PIC 9(9) COMP.                                 
       01 STK-MSG.                                                      
         05 STK-MSG-1          PIC X(30).                               
         05 STK-MSG-2          PIC 9(15).                               
       01 STK-PRIMA-VOLTA      PIC S9(4) COMP.                          
          88 PRIMA-VOLTA  VALUE 0.                                      
       01 STK-CAMBIO           PIC 9(9) COMP.                           
      *>                                                                  
       01 NOME-IN   PIC X(30) VALUE "TABSTK.TABELLE".                   
       01 NOME-IN-B PIC X(30) VALUE "TABSTB.TABELLE".                   
      *>                                                                  
       01  PAR-PRINT.                                                   
        05  STATO         PIC S9(4) COMP.                               
        05  LL-RIGA       PIC  9(4) COMP.                               
        05  N-MAX-RIGHE   PIC  9(4) COMP.                               
        05  FLAG-ROUTINE  PIC  9(4) COMP.                               
        05  NUM-FILE-ID   PIC  9(4) COMP.                               
        05  NOME-FILE.                                                  
         10 PRE-NOME-FILE     PIC X.                                    
         10 TERM-N-FILE       PIC 9(6).                                 
         10 FILLER            PIC XXX VALUE ".ST".                      
      *>                                                                  
       01  RIGA.                                                        
        05  N-STAMPANTE   PIC 9.                                        
        05  COMANDO       PIC X.                                        
        05  N-RIGA-STAMPA PIC 9(4) COMP.                                
        05  DATI-RIGA     PIC X(132).                                   
      *>                                                                  
        05 RIGA-INTESTA REDEFINES DATI-RIGA.                            
          10 FILLER        PIC X.                                       
          10 CONTO-T       PIC ZZ9/99999.                               
          10 FILLER        PIC X.                                       
          10 D-CONTO-T     PIC X(24).                                   
          10 FILLER        PIC XXX.                                     
          10 DATA-T        PIC X(12).                                   
          10 FILLER        PIC X(5).                                    
          10 D-PAG-T       PIC X(5).                                    
          10 FILLER        PIC X.                                       
          10 NUM-PAG-T     PIC ZZ9.                                     
      *>                                                                  
        05 RIGA-DETTAGLIO REDEFINES DATI-RIGA.                          
          10 FILLER        PIC X(7).                                    
          10 C-MAT-ST      PIC 9(15).                                   
          10 FILLER        PIC XX.                                      
          10 TAGLIA-ST     PIC 9.                                       
          10 FILLER        PIC X(6).                                    
          10 NOME-MOD-ST   PIC X(7).                                    
          10 FILLER        PIC X(6).                                    
          10 PREZZO-ST     PIC Z(8).                                    
      *> EURO1*                                                           
          10 PREZZO-ST-EU REDEFINES PREZZO-ST  PIC Z(5),ZZ.             
      *> PRZBU*                                                           
          10 FILLER        PIC X(6).                                    
          10 NOGIAC-ST     PIC X(10).                                   
          10 FILLER        PIC X(3).                                    
          10 NOPRZ-ST      PIC X(10).                                   
      *>                                                                  
      *>                                                                  
       01 BUFFER.                                                       
        05 N-BUF               PIC S9(4) COMP VALUE 37.                 
        05 FILLER              PIC XX.                                  
        05 FILLER              PIC X(5120).                             
      *>                                                                  
      *> MAG6/7*                                                          
       01 MAG-INPUT   PIC X(3).                                         
       01 MAG-INPUT-R REDEFINES MAG-INPUT PIC 9(3).
      *> VIBLO*
      *>    88 MAG-OK             VALUES  2, 3, 6, 7.
      *> MAG1
      *>    88 MAG-OK             VALUES  4, 6, 7.
         88 MAG-OK             VALUES  1, 4, 6, 7, 852, 853.
      *> 
         88 MAG-VALIDO         VALUES  4, 7, 852, 853.
         88 MAG-FALLATO        VALUES  1, 6.
         88 MAG-STOCK          VALUES  1, 4, 6, 7, 852, 853.
       01 SUGG-MAG-DISP        PIC X(50)
      *> VIBLO*
      *>     VALUE "accettato MAG 2 o 3 o 6 o 7".
          VALUE "accettato MAG 1, 4, 6, 7, 852 o 853".
      *> 
       01 CLASSE-INPUT.
         05 CLASSE-INPUT-R     PIC 99.
           
           
       01 SOCIETA-INPUT.
         05 SOCIETA-INPUT-R    PIC 9.
       01 AS-INPUT  .
         05 A-INPUT-R         PIC 9.
         05 S-INPUT-R         PIC 9.
      *> ASZERO*
       01 FILLER REDEFINES AS-INPUT PIC XX.
         88 TUTTI-AS          VALUES "tt", "TT".
      *> 
       01 AS-INPUT-R REDEFINES AS-INPUT
                              PIC 99.
       
      *> UNICODDT*                                                        
       01 STRINGA-TUTTI-AS.
          05 PIC X(30) VALUE "02.04.12.14.22.24.32.34.42.44.".
          05 PIC X(30) VALUE "52.54.62.64.72.74.82.84.92.94.".
       
       01 ELENCO-AS.
          88 TUTTI-AS-ELENCO VALUE "TT", "tt".
          88 FINE-AS          VALUES "chiudi", "CHIUDI".
          05 OCCURS 20.
             10 AS-IN.
                15 AS-IN-R PIC 99.
             10            PIC X.
       
       01 ELENCO-CL.
          88 TUTTI-CL-ELENCO VALUE "TT", "tt".
          05 OCCURS  99.
             10 CL-IN.
                15 CL-IN-R PIC 99.
             10            PIC X.
       01 I-APP PIC S9(4) COMP.
       01 I-AS PIC S9(4) COMP.
       01 I-CL PIC S9(4) COMP.
       01 PRO PIC X.
       01 SINO PIC XX.
          88 SINO-SI VALUE "SI", "si".
          88 SINO-NO VALUE "NO", "no".
       
       01 APP-AS PIC 99.
       01 REDEFINES APP-AS.
           05 APP-A PIC 9.
           05 APP-S PIC 9.
           
       01 SW-AS-ERR PIC 9.
          88 AS-ERR VALUE 1.
       01 SW-CL-ERR PIC 9.
          88 CL-ERR VALUE 1.
       01 SW-MAX-CAPI-RAGGIUNTO PIC 9.
          88 MAX-CAPI-RAGGIUNTO VALUE 1.
       01 SW-ERR-AS-CL pic 9.
          88 err-as-cl value 1.
       01 SW-FINE-CARICA-TAB PIC 9.
          88 FINE-CARICA-TAB VALUE 1.
      *>  01 XD PIC X VALUE "S".                                          
       01 XD PIC X VALUE "N".                                           
      *> ----------------------------------------------------------------*
       01 PAR-TAB-UNICO-DDT      *>      ===PREPROCESSOR==>COPY QPARTABX START
      *>                                 ******************************   
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05 QT-PARAMETRI.                                               
          10 QT-STATO               PIC S9(9) COMP.                     
          10 QT-NUM-ELEM-EFF        PIC  9(9) COMP.                     
          10 QT-NUM-ELEM-MAX        PIC  9(9) COMP.                     
          10 QT-LL-ELEM             PIC  9(9) COMP.                     
          10 QT-ADDR-KEY            PIC  9(9) COMP.                     
          10 QT-LL-KEY              PIC  9(9) COMP.                     
          10 QT-INDEX-ELEM          PIC  9(9) COMP.                     
          10 QT-FUNZIONE            PIC  XX.                            
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY QPARTABX END


      *> 
       01 TAB-UNICO-DDT.
          05 ELE-TAB-UNICO-DDT      PIC X(16) OCCURS   1980.
      *> 
       01 DEP-TAB-UNICO-DDT.
          05 KEY-TAB-UNICO-DDT. 
             10 TAB-AS PIC 99.
             10 TAB-CL PIC 99.
          05 DATI-TAB-UNICO-DDT. 
             10 TAB-MAX-CAPI PIC 9(6).
             10 TAB-CAPI-LETTI PIC 9(6).
      *> ----------------------------------------------------------------*
      *> UNICODDT*                                                        
      *>                                                                  
       01 NOME-IN-35.                                                   
         05 NOME-IN-3   PIC XXX.                                        
         05 NOME-IN-5   PIC 9(5).                                       
         05 FILLER      PIC X(8) VALUE ".TABELLE".                      
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *> NOPRZ*                                                           
       01 PREZZO-ANAMAT  PIC S9(9) COMP.                                
      *>                                                                  
      *>                                                                  
       01 PARDEED      *>      ===PREPROCESSOR==>COPY QPARDEED START
      *>                                 ******************************   
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05 QD-PARAMETRI.                                               
          10 QD-STATO               PIC S9(4) COMP.                     
          10 QD-NR-DEC              PIC  9(4) COMP.                     
          10 QD-LL-A                PIC  9(4) COMP.                     
          10 QD-LL-B                PIC  9(4) COMP.                     
          10 FILLER                 PIC  X(8).                          
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY QPARDEED END

                                       
      *>                                                                  
      *> EURO*                                                            
       01 PAR-INEU      *>      ===PREPROCESSOR==>COPY QPARINEU START
      *>                                 ******************************   
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         05 IE-PARAMETRI.                                               
          10 IE-STATO               PIC S9(4) COMP.                     
           88 IE-ERRORE  VALUE -1.                                      
          10 IE-IMPORTO-IN          PIC  S9(18) COMP.                   
          10 IE-IMPORTO-IN-V REDEFINES IE-IMPORTO-IN                    
                                    PIC  S9(16)V99 COMP.                
          10 IE-IMPORTO-OU          PIC  S9(18) COMP.                   
          10 IE-IMPORTO-OU-V REDEFINES IE-IMPORTO-OU                    
                                    PIC  S9(16)V99 COMP.                
          10 IE-DIVISA-IN           PIC  X(004).                        
          10 IE-DIVISA-OU           PIC  X(004).                        
           88  IE-LIRE   VALUE "LIT".                                   
           88  IE-EURO VALUE "EUR".                                     
          10 IE-MSG                 PIC  X(40).                         
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY QPARINEU END

                                       
      *>                                                                  
      *> EURO1*                                                           
       01 DIVISA-PRIMO-LETTO  PIC X(4).                                 
      *>                                                                  
      *> T5000*                                                           
       01 DESTINO-USCITA  PIC 9(2).                                     
         88 DESTINO-VALIDO VALUES ARE 73 90 94 27 28 29 34 22.
      *>                                                                  
      *>                                                                  
      *> FIFRA*                                                           
       01 CONTO-FATTURA-MEM   PIC S9(8) COMP.                           
      *>                                                                  
      *>  NO-DATGE                                                        
        01 TAB-RIGHE-SOCIETA      *>      ===PREPROCESSOR==>COPY MAPPASOCIETA START
      *>                                                                  
           .                                                            
      *> IF X9=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
            20 TAB-MAPPA-SOCIETA.                                       
                25 FILLER   PIC S9(9) COMP VALUE 9.                     
                25 SOC-1 PIC XX            VALUE "CA".                  
                25 COD-1 PIC S9(9) COMP    VALUE 1.                     
                25 SOC-2 PIC XX            VALUE "MA".                  
                25 COD-2 PIC S9(9) COMP    VALUE 2.                     
                25 SOC-3 PIC XX            VALUE "MN".                  
                25 COD-3 PIC S9(9) COMP    VALUE 3.                     
                25 SOC-4 PIC XX            VALUE "MR".                  
                25 COD-4 PIC S9(9) COMP    VALUE 4.                     
                25 SOC-5 PIC XX            VALUE "DT".                  
                25 COD-5 PIC S9(9) COMP    VALUE 5.                     
                25 SOC-6 PIC XX            VALUE "MM".                  
                25 COD-6 PIC S9(9) COMP    VALUE 6.                     
                25 SOC-7 PIC XX            VALUE "YE".                  
                25 COD-7 PIC S9(9) COMP    VALUE 7.                     
                25 SOC-8 PIC XX            VALUE "MH".                  
                25 COD-8 PIC S9(9) COMP    VALUE 8.                     
                25 SOC-9 PIC XX            VALUE "IM".                  
                25 COD-9 PIC S9(9) COMP    VALUE 9.                     
      *>                                                                  
                                                                        
             20 TAB-MAPPA-SOCIETA-RID REDEFINES TAB-MAPPA-SOCIETA.      
                25 NUMERO-MAX-SOCIETA PIC S9(9) COMP.                   
                25 EL-TAB-SOC OCCURS 9.                                 
                   30 SOCIETA-SIGLA      PIC XX.                        
                   30 SOCIETA-CODICE     PIC S9(9) COMP.                
                                                                        
      *>   {1: 'CA',                                                      
      *>   2: 'MA',                                                       
      *>   3: 'MN',                                                       
      *>   4: 'MR',                                                       
      *>   5: 'DT',                                                       
      *>   6: 'MM',                                                       
      *>   7: 'YE',                                                       
      *>   8: 'MH',                                                       
      *>   9: 'IM'}                                                       
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY MAPPASOCIETA END

                         
      *>  NO-DATGE                                                        
      *>                                                                  
      *> PRZ-PUBBL*                                                       
       01 PREZZO-PUBBL        PIC S9(9) COMP.                           
      *>                                                                  
      *> PRZ-PUBBL*                                                       
      *> EXEC SQL BEGIN DECLARE SECTION END-EXEC.                         
      *>                                                                  
      *>  NO-DATGE                                                        
      *>  EXEC SQL INCLUDE MODELLI.IF END-EXEC. 
      *>  EXEC SQL INCLUDE PREZZI1.IF END-EXEC. 
      *>  EXEC SQL INCLUDE SOCIETA.IF END-EXEC.
       
        01 CC-C-MAT         PIC 9(15) .
        01 CC-SOCIETA       PIC XX.
      *>   01 CC-ANNO          PIC 9(4).
      *>   01 CC-STAGIONE      PIC 9.
        01 CC-LISTINO       PIC 99.
        01 CC-TIPO-PREZZO   PIC X.
        01 CC-PREZZO-DBG    PIC  S9(13)V99 COMP-3.           
            
         
      *>  NO-DATGE                                                        
      *> movsku   
      *>      ===PREPROCESSOR==>COPY YMOVSKU START
      *>     
      *>            *************************************                 
      *>            *     TAV. MOV_SKU                  *               
      *>            *************************************                 
      *>                                                                  
        01  MOVSKU-RIF-INTERNO                    PIC S9(15) COMP-3. 
      *>   01  MOVSKU-BARCODE                        PIC S9(15) COMP-3.
        01  MOVSKU-CMAT                           PIC S9(15) COMP-3.
        01  MOVSKU-TG                             PIC S9(4) COMP.       
        01  MOVSKU-BARUNI                         PIC X(13). 
        01  MOVSKU-CONTO                          PIC S9(8)  COMP.
        01  MOVSKU-MAG                            PIC S9(4)  COMP.
        01  MOVSKU-SKU                            PIC X(8).        
        01  MOVSKU-IS-BARUNI-READ                 PIC 9(1).
        01  MOVSKU-IS-BARUNI-CERTIFIED            PIC 9(1).
        01  MOVSKU-SKU-FATTURAZIONE               PIC X(8).        
      *>      ===PREPROCESSOR==>COPY YMOVSKU END

     
       
      *> ASOLOB2C*                                                        
      *>      ===PREPROCESSOR==>COPY ANACST.IF START
      *>      
      *>                 tav. ANAMAT_CST  (ANACST.IF)                 
       01 ANACST-C-MAT                    PIC S9(15) COMP-3.            
       01 ANACST-CST-STD                  PIC S9(9) COMP.              
       01 ANACST-CST-STD-2                PIC S9(9) COMP.
       01 ANACST-TS-CST                   PIC S9(15) COMP-3.
      *>                     
       
      *>      ===PREPROCESSOR==>COPY ANACST.IF END


       01 TAB-B2C-NO-DT.
          05 EL-B2C-NO-DT  OCCURS 100.
            10 MAG-B2C-NO-DT  PIC S9(4) COMP.
      *> ASOLOB2C*                                                        
       
      *> EXEC SQL END DECLARE SECTION END-EXEC.                           
      *>                                                                  
       01 SQL-CONST      *>      ===PREPROCESSOR==>COPY SQLCONST START
      *>                                                                  
      *>     Costanti usate per gestione Hp-Sql                           
         .                                                              
         05  COSTANTI-SQL.                                              
           10  DEADLOCK           PIC S9(9) COMP VALUE -14024.          
           10  NO-MEMORY          PIC S9(9) COMP VALUE  -4008.          
           10  MULTIPLE-ROWS      PIC S9(9) COMP VALUE  -2112.          
           10  NOT-FOUND          PIC S9(9) COMP VALUE   100.          
           10  MODULE-NOT-FOUND   PIC S9(9) COMP VALUE  -2216.  
           10  CONSTR-VIOLATED-DF PIC S9(9) COMP VALUE  -2091.
           10  CONSTR-VIOLATED    PIC S9(9) COMP VALUE  -2292.        
           10  OK                 PIC S9(9) COMP VALUE     +0.          
      *>                                                                  
         05  SQL-STATUS           PIC S9(9) COMP.                       
           88 DEAD-NOMEM          VALUE -14024, -4008.                  
      *>      ===PREPROCESSOR==>COPY SQLCONST END

                       
       01 PAR-ERR      *>      ===PREPROCESSOR==>COPY PARERR START
           .                                                            
      *> ************************************************************     
      *>   area dati routine generalizzata ERRORI                         
      *> ************************************************************     
         03 ER-NUM                       PIC S9(4) COMP.                
            88 SQL-FINE                  VALUE 0.                       
            88 SQL-CONTINUA              VALUE 1.                       
         03 ER-IND                       PIC S9(4) COMP.                
         03 ER-DISP                      PIC X.                         
            88 ER-DISPLAY                VALUE "D".                     
            88 ER-WINDOW                 VALUE "W".                     
            88 ER-DISPLAY-CONTINUE       VALUE "C".                     
         03 ER-DESCRIZIONE               PIC X(80).                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PARERR END

                         
       01 AREA-HL      *>      ===PREPROCESSOR==>COPY AREAHL START
                   .                                                    
      *>                                                ******************
      *>                                                *  Area   HI-LI  *
      *>                                                ******************
        03 HL-COMMON-AREA.                                              
         05 HL-SEND-PAR.                                                
          15 HL-ENABLE-INPUT              PIC S9(8) COMP.               
          15 HL-WINDOW-ENH                PIC X(8).                     
          15 HL-BYPASS-FEATURE            PIC S9(8) COMP.               
      *>                                                                  
         05 HL-GLOBAL-PAR.                                              
          15 HL-EXPECTED-VUF              PIC X(8)  SYNC.               
          15 HL-CALL-PROTOCOL             PIC S9(8) COMP.               
          15 HL-COMAREA-LEN               PIC S9(8) COMP.               
          15 HL-COMAREA                   PIC X(300).                   
      *>                                                                  
         05 HL-RETURN-PAR.                                              
          15 HL-STATUS                    PIC S9(8) COMP.               
             88 HILI-OK                   VALUE 0.                      
             88 HILI-READ-TIMEOUT         VALUE 24.                     
             88 HILI-ERR-EDIT             VALUE 33.                     
          15 HL-RETURN-SUBSTATUS          PIC S9(8) COMP.               
          15 HL-RETURN-MSGLENGTH          PIC S9(8) COMP.               
          15 HL-RETURN-MSG                PIC X(256).                   
          15 HL-LAST-ITEMTYPE             PIC S9(8) COMP.               
          15 HL-LAST-ITEMNUM              PIC S9(8) COMP.               
             88 HL-ENTER                  VALUE 0.                      
             88 HL-F1                     VALUE 1.                      
             88 HL-F2                     VALUE 2.                      
             88 HL-F3                     VALUE 3.                      
             88 HL-F4                     VALUE 4.                      
             88 HL-F5                     VALUE 5.                      
             88 HL-F6                     VALUE 6.                      
             88 HL-F7                     VALUE 7.                      
             88 HL-F8                     VALUE 8.                      
          15 HL-LAST-ITEMNAME             PIC X(32).                    
          15 HL-NUM-DATAERRS              PIC S9(8) COMP.               
          15 HL-NUM-CHANGEFIELDS          PIC S9(8) COMP.               
      *>                                                                  
         05 HL-TERM-PAR.                                                
          15 HL-TERM-FILE                 PIC X(88).                    
          15 HL-BYPASS-FEATURE-2          PIC S9(8) COMP.               
      *>                                                                  
         05 HL-FORM-PAR.                                                
          15 HL-FORM-NAME                 PIC X(32).                    
          15 HL-FORM-POSITION             PIC S9(8) COMP.               
          15 HL-CHANGE-LISTTYPE           PIC S9(8) COMP.               
          15 HL-LIST-COUNT                PIC S9(8) COMP.               
          15 HL-CHANGE-ENTRY              OCCURS 64.                    
           20 HL-FIELD-ID                 PIC X(32).                    
           20 HL-CHANGE-TYPE              PIC S9(8) COMP.               
           20 HL-CHANGE-SPEC              PIC X(8).                     
      *>                                                                  
         05 HL-PROMPT-PAR.                                              
          15 HL-PROMPT-REPAINT            PIC S9(8) COMP.               
          15 HL-PROMPT-WINDENH            PIC X(8).                     
          15 HL-PROMPT-RESET              PIC S9(8) COMP.               
      *>                                                                  
         05 HL-READ-PAR.                                                
          15 HL-READ-TIME                 PIC S9(8) COMP.               
          15 HL-ENABLE-FOR                PIC S9(8) COMP.               
          15 HL-DOREREAD                  PIC S9(8) COMP.               
          15 HL-FILLER                    PIC S9(8) COMP.               
      *>                                                                  
         05 HL-READ-ITEMS.                                              
          15 HL-READITEM-COUNT            PIC S9(8) COMP.               
          15 HL-READITEM-ENTRY            OCCURS 9.                     
           20 HL-READITEM-TYPE            PIC S9(8) COMP.               
           20 HL-READITEM-ID              PIC S9(8) COMP.               
           20 HL-READITEM-OPTION          PIC S9(8) COMP.               
      *>                                                                  
         05 HL-CURSOR-POSITION.                                         
          15 HL-CURSOR-POS-NUM            PIC S9(8) COMP.               
          15 HL-CURSOR-POS-NAME           PIC X(32).                    
      *>                                                                  
         05 HL-PROMPT-CURSOR-POSITION.                                  
          15 HL-FIL-PROMPT                PIC XX.                       
          15 HL-ERR-CURSOR-POS            PIC X(34).                    
      *>                                                                  
         05 HL-DATA-DESC.                                               
          15 HL-DESC-TYPE                 PIC S9(8) COMP.               
          15 HL-BUFF-LENGTH               PIC S9(8) COMP.               
          15 HL-RET-BUFLEN                PIC S9(8) COMP.               
      *>                                                                  
         05 HL-LABEL-DESC.                                              
          15 HL-LABEL-NUM                 PIC S9(8) COMP.               
          15 HL-LABEL-ELEM                OCCURS 8.                     
           20 HL-LABEL-ID                 PIC S9(8) COMP.               
           20 HL-LABEL-ENH                PIC X(8).                     
      *>                                                                  
         05 HL-LABEL-BUFF.                                              
          15 HL-LABEL-ENTRY               OCCURS 8.                     
           20 HL-LABEL-TEXT               PIC X(16).                    
      *>                                                                  
         05 HL-MSG-WINDOW.                                              
          15 HL-MSG-LENGTH                PIC S9(8) COMP.               
          15 HL-WINDOW                    PIC X(256).                   
      *>                                                                  
         05 HL-FORMCNTRL-PAR.                                           
          15 HL-FC-NAME                   PIC X(32).                    
          15 HL-FC-UNDLCNTR               PIC S9(8) COMP.               
          15 HL-FC-PAGECNTR               PIC S9(8) COMP.               
          15 HL-FC-ENREF                  PIC S9(8) COMP.               
      *>                                                                  
         05 HL-FILLCNTRL-PAR.                                           
          15 HL-FC-DESC                   PIC S9(8) COMP.               
          15 HL-FC-ENTRYCNT               PIC S9(8) COMP.               
          15 HL-FC-FIELDID                PIC S9(8) COMP.               
      *>                                                                  
         05 HL-PRINT-DEV                  PIC S9(8) COMP.               
      *>                                                                  
         05 HL-FORMS-FILE                 PIC X(88).                    
      *>                                                                  
         05 HL-UNUSED-PAR                 PIC S9(8) COMP.               
      *>                                                                  
         05 HL-ERROR-PAR.                                               
          15 HL-ERR-LIST-TYPE             PIC S9(9) COMP.               
          15 HL-ERR-LIST-ALLOC            PIC S9(9) COMP.               
          15 HL-ERR-LIST-ACTUAL           PIC S9(9) COMP.               
          15 HL-ERR-FIELD                 PIC X(32).                    
      *>                                                                  
         05 HL-CALL                       PIC S9(8) COMP.               
      *>                                                                  
      *> *****************************************************************
      *>                                                                  
         05 TP-PARAM.                                                   
          15 TP-ERRORI                    PIC S9(8) COMP.               
             88 TP-SENZA-ERRORI           VALUE 0.                      
          15 TP-FLAG.                                                   
           20 TP-FLAG-SEND                PIC S9(8) COMP.               
              88 TP-SEND                  VALUE 0.                      
           20 TP-FLAG-READ                PIC S9(8) COMP.               
              88 TP-READ                  VALUE 0.                      
           20 TP-FLAG-AGG-FASE            PIC S9(8) COMP.               
              88 TP-AGGIORNA-PER-FASE     VALUE 1.                      
      *>                                                                  
          15 TP-NUMERO-FASI               PIC S9(8) COMP.               
          15 TP-FASE-ATTUALE              PIC S9(8) COMP.               
             88 TP-PRIMA-FASE             VALUE 1.                      
          15 TP-SET-KEYF                  PIC S9(8) COMP.               
             88 ALTRE-CHIAVI              VALUE 1.                      
      *>                                                                  
          15 TP-RIGHE.                                                  
           20 TP-RIGHE-FASE               PIC S9(8) COMP.               
              88 TP-SENZA-RIGHE           VALUE 0.                      
           20 TP-PASSO-ROLL               PIC S9(8) COMP.               
           20 TP-RIGA-END                 PIC S9(8) COMP.               
           20 TP-RIGA-START               PIC S9(8) COMP.               
           20 TP-RIGHE-EFF                PIC S9(8) COMP.               
           20 TP-IND-RIGA                 PIC S9(8) COMP.               
           20 TP-IND-TERM                 PIC S9(8) COMP.               
      *>                                                                  
          15 TP-COMANDO.                                                
           20 TP-FIL1                     PIC XXX.                      
              88 TP-COMANDO-ROLL          VALUE ".SI",                  
                                                ".SA".                  
              88 TP-SCORRI-AVANTI         VALUE ".SA".                  
              88 TP-SCORRI-INDIETRO       VALUE ".SI".                  
              88 TP-CAMBIA-FASE           VALUE ".FS",                  
                                                ".FP".                  
              88 TP-FASE-SEGUENTE         VALUE ".FS".                  
              88 TP-FASE-PRECEDENTE       VALUE ".FP".                  
              88 TP-CHIUDI-PROGRAMMA      VALUE ".CP".                  
              88 TP-ANNULLA-FUNZIONE      VALUE ".AO".                  
              88 TP-ANNULLA-OPERAZIONE    VALUE ".AO".                  
              88 TP-ALTRE-CHIAVI          VALUE ".AC".                  
              88 TP-RICREA-MASCHERA       VALUE ".RM".                  
              88 TP-CANCELLA-OPERAZIONE   VALUE ".DO".                  
              88 TP-CHIUDI-OPERAZIONE     VALUE ".CO".                  
              88 TP-BREAK                 VALUE ".BR".                  
              88 TP-STAMPA                VALUE ".ST".                  
              88 TP-HELP                  VALUE ".HE".                  
              88 TP-COMANDO-VALIDO        VALUE ".FS", ".FP",           
                                                ".SI", ".SA",           
                                                ".CP", ".CO",           
                                                ".DO",                  
                                                ".AO", ".AC",           
                                                ".BR", ".HE",           
                                                ".ST", ".RM".           
           20 TP-RESTO-COMANDO.                                         
            25 TP-RIGA1                     PIC X.                      
            25 TP-START1 REDEFINES TP-RIGA1 PIC 9.                      
            25 FILLER                       PIC X(2).                   
           20 FILLER REDEFINES TP-RESTO-COMANDO.                        
            25 TP-RIGA2                     PIC XX.                     
            25 TP-START2 REDEFINES TP-RIGA2 PIC 99.                     
            25 FILLER                       PIC X.                      
           20 FILLER REDEFINES TP-RESTO-COMANDO.                        
            25 TP-RIGA3                     PIC X(3).                   
            25 TP-START3 REDEFINES TP-RIGA3 PIC 9(3).                   
          15 FILLER REDEFINES TP-COMANDO.                               
           20 FILLER                        PIC X.                      
              88 TP-COMANDO-DIGITATO       VALUE ".".                   
           20 FILLER                        PIC X(5).                   
          15 FILLER REDEFINES TP-COMANDO.                               
           20 FILLER-COM                    PIC XX.                     
              88 TP-SCORRI                 VALUE ".S".                  
           20 TP-RIGA4                      PIC X(4).
           20 TP-START4 REDEFINES TP-RIGA4  PIC 9(4).
           20 TP-RIGA41 REDEFINES TP-RIGA4  PIC X.
           20 TP-START41 REDEFINES TP-RIGA4  PIC 9.
           20 TP-RIGA42 REDEFINES TP-RIGA4  PIC X(2).
           20 TP-START42 REDEFINES TP-RIGA4 PIC 9(2).
           20 TP-RIGA43 REDEFINES TP-RIGA4  PIC X(3).
           20 TP-START43 REDEFINES TP-RIGA4 PIC 9(3).
          15 TP-INFO.                                                   
           20 TP-DISAB-FKEY.                                            
            25 TP-NUM-DISAB                 PIC S9(9) COMP.             
            25 TP-TABELLA-DISAB.                                        
             30 TP-COM-DISAB OCCURS 16      PIC X(3).                   
           20 TP-INFO-2                     PIC X(72).                  
      *>                                                                  
        05 H-COMAREA.                                                   
           10 H-COM-STATUS       PIC S9(4) COMP-5 .                     
           10 H-COM-LANGUAGE     PIC S9(4) COMP-5.                      
           10 H-COM-COMAREALEN   PIC S9(4) COMP-5.                      
           10   FILLER         PIC S9(4) COMP-5.                        
           10 H-COM-MODE         PIC S9(4) COMP-5.                      
           10 H-COM-LASTKEY      PIC S9(4) COMP-5.                      
           10 H-COM-NUMERRS      PIC S9(4) COMP-5.                      
           10   FILLER         PIC S9(4) COMP-5.                        
           10   FILLER         PIC S9(4) COMP-5.                        
           10 H-COM-KEYLABOPT    PIC S9(4) COMP-5.                      
           10 H-COM-CFNAME       PIC X(15) .                            
           10   FILLER         PIC X(1) .                               
           10 H-COM-NFNAME       PIC X(15).                             
           10   FILLER         PIC X(1) .                               
           10 H-COM-REPEATOPT    PIC S9(4) COMP-5 .                     
           10 H-COM-NFOPT        PIC S9(4) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10 H-COM-DBUFLEN      PIC S9(4) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10 H-COM-DELETEFLAG   PIC S9(4) COMP-5.                      
           10 H-COM-SHOWCONTROL  PIC S9(4) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10 H-COM-FRMSTORSIZE  PIC S9(4) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10 H-COM-NUMRECS      PIC S9(9) COMP-5 .                     
           10 H-COM-RECNUM       PIC S9(9) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10 H-COM-TERMFILENUM  PIC S9(4) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10 H-COM-TERMOPTIONS  PIC S9(4) COMP-5 .                     
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
           10   FILLER         PIC S9(4) COMP-5 .                       
                                                                        
      *>      ===PREPROCESSOR==>COPY AREAHL END

                         
       01 AREA-SI      *>      ===PREPROCESSOR==>COPY AREASI START
             .                                                          
      *>                                             *********************
      *>                                             * Area dati SISTEMA *
      *>                                             *********************
      *>                                                                  
        05 SI-AREA-SISTEMA.                                             
         07 SI-DATI-UTENTE.                                             
          10 SI-SOTTOSISTEMA                     PIC XX.                
          10 SI-TIMEOUT                          PIC S9(9) COMP.        
          10 SI-STAMPANTE                        PIC X(8).              
          10 SI-STFORM                           PIC X(8).              
          10 SI-CODICE-AZIENDA                   PIC XX.                
          10 SI-DATA-DEL-GIORNO.                                        
           15 SI-FORMATO-INTERNO                 PIC 9(8).              
           15 FILLER                             PIC X(2).              
           15 SI-FORMATO-GG-MM-AA                PIC X(8).              
           15 SI-FORMATO-GG-MMM-AAAA             PIC X(12).             
           15 SI-FORMATO-GGMMAAAA                PIC X(8).              
           15 FILLER REDEFINES SI-FORMATO-GGMMAAAA.                     
              20 FILLER                          PIC X(4).              
              20 SI-AAAA                         PIC X(4).              
           15 SI-FORMATO-GGMMAA.                                        
            20 SI-GG                             PIC 99.                
            20 SI-MM                             PIC 99.                
            20 SI-AA                             PIC 99.                
           15 SI-FORMATO-GMA-9 REDEFINES SI-FORMATO-GGMMAA              
                                                 PIC 9(6).              
          10 SI-PARAMETRI-UTE.                                          
           15 SI-TIPO                            PIC S9(4) COMP.        
              88 SI-PROGRAMMA-BATCH              VALUE 8.               
          10 SI-DATI-PROCESSO.                                          
           15 SI-DATI-PROG.                                             
            20 SI-NOME-PROG.                                            
             25 SI-NOME-PROC                     PIC XX.                
             25 FILLER                           PIC X(6).              
            20 SI-NOME-GROUP-PROG                PIC X(8).              
            20 SI-NOME-ACCT-PROG                 PIC X(8).              
           15 SI-GROUP                           PIC X(8).              
           15 SI-USER                            PIC X(8).              
           15 SI-ACCOUNT                         PIC X(8).              
           15 SI-SESSION-NAME                    PIC X(8).              
           15 SI-TERM                            PIC S9(4) COMP.        
           15 SI-NOME-FUNZIONE                   PIC X(8).              
           15 SI-CHIAVE-FUNZIONE                 PIC X(8).              
           15 SI-NOME-CHIAMANTE                  PIC X(28).             
              88 SI-CHIAMATO-DA-CI VALUES                               
                 "CI.PUB.SYS                  ",                        
                 "TOOLSET.PUB.SYS             ",                        
                 "QEDIT.PUB.ROBELLE           ".                        
           15 FILLER REDEFINES SI-NOME-CHIAMANTE.                       
            20 SI-PRIMI4-CHIAMANTE               PIC X(4).              
               88 SI-CHIAMATO-DA-MENU            VALUE "MENU".          
            20 FILLER                            PIC X(24).             
          10 SI-PAR-SISTEMA.                                            
            20 SI-AREA-UTENTE                    PIC X(20).             
            20 SI-FLAG-1                         PIC X.                 
               88 LIRA-PESANTE                   VALUE "1" "2" "3" .    
            20 SI-FLAG-2                         PIC X.                 
               88 SI-GIAC-NEGATIVE               VALUE "S".             
            20 SI-DEV-OUTCLASS                   PIC X(4).              
            20 SI-PRI-OUTCLASS                   PIC X.                 
            20 SI-PRIORITA-OUT                   PIC X.                 
            20 SI-PRIORITA-JOB                   PIC X.                 
            20 SI-DATA-VALUTA                     PIC X.                
               88 SI-OBBLIGO-VALUTA          VALUE "X".                 
            20 SI-DATA-RIFERIMENTO                PIC X.                
               88 SI-OBBLIGO-RIFERIMENTO     VALUE "X".                 
            20  SI-FLAG-COMMESSA                  PIC X.                
               88 SI-OBBLIGO-COMMESSA        VALUE "X".                 
            20 FLAG-NUM-EFFETTI                  PIC X.                 
               88 NUM-EFFETTI-UNICA          VALUE "X".                 
            20 SI-DIVISA-DEFAULT                 PIC X(4).              
            20 SI-PREVIS-OLTRE                   PIC X.                 
               88 NO-PREVIS-DATA-OLTRE           VALUE "S".             
            20 FILLER                            PIC X(02).             
            20 SI-PAR-IVA                        PIC X(11).             
            20 SI-CODA-DEFAULT REDEFINES SI-PAR-IVA PIC X(11).
            20 SI-DIVISA-EURO                    PIC X(4).              
            20 SI-DATA-INIZIO-EURO               PIC X(8).              
            20 SI-DATA-INIZIO-EURO-NUM                                  
               REDEFINES SI-DATA-INIZIO-EURO     PIC 9(8).              
            20 SI-DATA-CONTAB-EURO               PIC X(8).              
            20 SI-DATA-CONTAB-EURO-NUM                                  
               REDEFINES SI-DATA-CONTAB-EURO     PIC 9(8).              
            20 SI-DIVISA-ITL                     PIC X(4).              
            20 FILLER                            PIC X(25).             
      *>                                                                  
         07 SI-AREE.                                                    
          10 SI-DESCR-FUNZIONE                    PIC X(12).            
          10 SI-NR-FUNZIONE                       PIC S9(4) COMP.       
          10 SI-FLAG-DISABLETERM                  PIC X.                
             88 SI-DISABLETERM                    VALUES " ", "D".      
             88 SI-NOT-DISABLETERM                VALUE  "N".           
          10 SI-AREA-MSG                          PIC X(80).            
          10 SI-FLAG-BATCH                        PIC X(2).             
             88 SI-BATCH                          VALUE "BT".           
             88 SI-TP                             VALUE "TP".           
          10 SI-INFO-AREA-LIBERA                  PIC X(126).           
          10 FILLER REDEFINES SI-INFO-AREA-LIBERA.                      
           15 SI-LINGUA-USER                      PIC X(4).             
           15 SI-CAMBIO-EURO-LIRA                 PIC 9(5)V9(6).        
           15 SI-DB-CONNESSO                      PIC X(30).            
           15 SI-PASSWORD                         PIC X(8). 
           15 SI-DIRECTORY                        PIC X(30).          
      *>                                                                  
         07 SI-AREE-PARAMETRI.                                          
          10 SI-PAR-SOTTOSISTEMA                  PIC X(80).            
          10 SI-PAR-FUNZIONE                      PIC X(80).            
          10 FILLER REDEFINES SI-PAR-FUNZIONE.                          
           15 SI-FLAG-UPD                         PIC X.                
             88 SI-UPDATE                         VALUE SPACE.          
           15 SI-FLAG-DEL                         PIC X.                
             88 SI-DELETE                         VALUE SPACE.          
           15 SI-RESTO-PAR-FUN                    PIC X(78).            
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY AREASI END

                         
      *>                                                                  
       77 FLAG-CURSORE       PIC S9(4) COMP.                            
         88 STOP-CURSORE VALUE 1.                                       
      *>                                                                  
       01 SQLCODE-MEM        PIC S9(9) COMP.                            
      *>                                                                  
      *>                                                                  
      *> TASTO-PER-CONTINUARE*                                            
       01 TASTO-INP          PIC X.                                     
      *>                                                                  
      *>                                                                  
      *> 
      *>  Comandi IGP
       01 COM-IGP-STANDARD.
        05 COMIGP-PTXSETUP   PIC X(10) VALUE "!PTX_SETUP".
        05 COMIGP-PTXCFG2    PIC X(13) VALUE "CONFIG-LOAD;2".
        05 COMIGP-PTXEND     PIC X(7)  VALUE "PTX_END".
        05 COMIGP-CREATE     PIC X(15) VALUE "^CREATE;LAB;144".
        05 COMIGP-EXECUTE    PIC X(14) VALUE "^EXECUTE;LAB;1".
        05 COMIGP-SCALEDOT   PIC X(17) VALUE "SCALE;DOT;300;300".
        05 COMIGP-ALPHA      PIC X(5)  VALUE "ALPHA".
        05 COMIGP-STOP       PIC X(4)  VALUE "STOP".
        05 COMIGP-END        PIC X(3)  VALUE "END".
        05 COMIGP-LISTEN     PIC X(7)  VALUE "^LISTEN".
        05 COMIGP-QUIET      PIC X(6)  VALUE "^QUIET".
      *> 
      *> 
       01 ROW-IGP            PIC 9(4).
       01 ROW-X-IGP          PIC X(4).
       01 COL-IGP            PIC 9(4).
       01 COL-X-IGP          PIC X(4).
       01 VERT-EXP-IGP       PIC 9.
       01 ORIZ-EXP-IGP       PIC 9.
      *> 
       01 TEMP-X-IN.
         05 TEMP-EL-X OCCURS 4 PIC X.
       01 TEMP-X-OUT           PIC X(4).
       01 PRIMO-NONZERO        PIC S9(4) COMP.
       01 K                    PIC S9(4) COMP.
      *> 
       01 RIGA-PEND-COM      PIC X(33).
      *> 
       01 IND-PEND           PIC S9(4) COMP.
      *> SS
      *> MAXCA*
        01 MAX-CAPI-INPUT.
         05 MAX-CAPI-INPUT-R         PIC 9(6).
      *> 
      *> VACO*                                                            
       01 COSTO-MEM                  PIC S9(9) COMP.
      *> VACO*                                                            
      *> 
      *> MOVSKU
       01  PY-INPUT-REC.
           05  INPUT-VAL           PIC 9(14).
          05 FILLER              PIC X VALUE ";".
          05 INPUT-VAL-B        PIC 9(12).
          05 FILLER              PIC X VALUE ";".
          05 INPUT-VAL-C        PIC X(10).
       01 PY-OUTPUT-REC.
          05  OUTPUT-VAL-A        PIC X.
          05  OUTPUT-VAL-B        PIC X(200).
          05  OUTPUT-VAL-B-OK REDEFINES OUTPUT-VAL-B PIC X(13).  
       01 T-TAB                      PIC X VALUE X"9". 
       01 IND-BARUNI                 PIC S9(4) COMP.     
      *> MOVSKU       
       
       01  PY-INPUT-TRASF.
           05  INPUT-RIF-TRASF    PIC X(12).
           05  INPUT-CONTO-TRASF  PIC X(8).
       01  PY-OUTPUT-TRASF.
           05  OUTPUT-STATO-TRASF PIC XX.
           05  OUTPUT-ERR-TRASF   PIC X(70).
       
       01 PY-INPUT-REC-DISIMPEGNA.
          05 LISTA-AS               OCCURS 20.
            10 AS-DISIMPEGNA.
              15 ANNO-DISIMPEGNA        PIC X.
              15 STAG-DISIMPEGNA        PIC X.
          05 MAG-DISIMPEGNA         PIC XXX.
          05 FORN-DISIMPEGNA        PIC X.
          05 LISTA-CLASSE-DISIMPEGNA.
            10 CLASSE-DISIMPEGNA       PIC XX OCCURS 99.
       
       01 PY-OUTPUT-DISIMPEGNO      PIC XX.
          88 PY-OUTPUT-DISIMPEGNO-OK VALUE "OK".
       
      *> ASOLOB2C*                                                        
       01 FLAG-B2C-NO-DT     PIC X.          
        88 B2C-NO-DT   VALUES 'S'.   
         
       01 NUM-B2C-NO-DT       PIC S9(4) COMP.
       01 IND-B2C-NO-DT       PIC S9(4) COMP.
       01 ANACST-MAG-COM      PIC S9(4) COMP.
       01 ANACST-C-MAT-COM    PIC S9(15) COMP-3.
       01 ANACST-CST-COM    PIC S9(9) COMP.
       
       
       01 FLAG-ANACST        PIC X. 
        88 ESISTE-ANACST VALUE "E".
        88 NON-ESISTE-ANACST VALUE " ".     
         
       01  PY-INPUT-REC-B.
           05  INPUT-RIF-INTR     PIC X(12).
           05  INPUT-FLAG         PIC X(1).
           05  INPUT-CONTO        PIC X(8).
           05  INPUT-MAG          PIC X(4).
       01  PY-OUTPUT-REC-B.
           05  OUTPUT-VAL         PIC X(2).  
       
       
       
      *> ASOLOB2C*                                                        
       
      *> 
       LINKAGE SECTION.                                                 
      *>                                                                  
       01 W-COMMON      *>      ===PREPROCESSOR==>COPY WCOMMONW START
           .                                                            
      *> IF  X9=OFF                                                       
      *> CONTROL NOLIST                                                   
      *> IF                                                               
         15   W-SOTTOSISTEMA              PIC 99.                       
         15   W-DATI-W-IMAGE.                                           
          20   W-NOME-DATA-BASE-1         PIC X(16).                    
          20   W-TAB-DB.                                                
           25   W-NOME-DB                 PIC X(16) OCCURS 8.           
          20   FILLER REDEFINES W-TAB-DB.                               
           25   W-NOME-DB-1               PIC X(16).                    
           25   W-NOME-DB-2               PIC X(16).                    
           25   W-NOME-DB-3               PIC X(16).                    
           25   W-NOME-DB-4               PIC X(16).                    
           25   W-NOME-DB-5               PIC X(16).                    
           25   W-NOME-DB-6               PIC X(16).                    
           25   W-NOME-DB-7               PIC X(16).                    
           25   W-NOME-DB-8               PIC X(16).                    
          20   W-MODO                     PIC S9(4) COMP.               
          20   W-NOME-CAMPO               PIC X(16).                    
          20   W-VALORE-CAMPO             PIC S9(15) COMP-3.            
          20   W-DB-KEY-P16 REDEFINES W-VALORE-CAMPO                    
                                          PIC S9(15) COMP-3.            
          20   W-VAL-1 REDEFINES W-VALORE-CAMPO.                        
           25   W-VALORE-CAMPO-W          PIC S9(9) COMP.               
           25   W-DB-KEY-W REDEFINES W-VALORE-CAMPO-W                   
                                          PIC S9(9) COMP.               
           25   FILLER                    PIC X(4).                     
          20   W-VAL-2 REDEFINES W-VALORE-CAMPO.                        
           25   W-VALORE-CAMPO-HW         PIC S9(4) COMP.               
           25   W-DB-KEY-HW REDEFINES W-VALORE-CAMPO-HW                 
                                          PIC S9(4) COMP.               
           25   FILLER                    PIC X(6).                     
          20   W-VAL-3 REDEFINES W-VALORE-CAMPO.                        
           25   W-VALORE-CAMPO-X4         PIC X(4).                     
           25   W-DB-KEY-X4 REDEFINES W-VALORE-CAMPO-X4                 
                                          PIC X(4).                     
           25   FILLER                    PIC X(4).                     
          20   W-VAL-4 REDEFINES W-VALORE-CAMPO.                        
           25   W-VALORE-CAMPO-12         PIC S9(11) COMP-3.            
           25   FILLER                    PIC XX.                       
          20   W-VAL-5 REDEFINES W-VALORE-CAMPO.                        
           25   W-VALORE-CAMPO-15         PIC S9(15) COMP.              
          20   W-NOME-DATA-SET            PIC X(8).                     
          20   W-PAROLA-CHIAVE-1          PIC X(8).                     
          20   W-TUTTO-RECORD             PIC XX.                       
          20   W-CHIUSURA-TOTALE          PIC XX.                       
      *>                                                                  
          20   W-CA-IMAGE.                                              
           25   W-STATUS-WORD-IMAGE       PIC S9(4) COMP.               
              88  W-OK-IMAGE              VALUE  0.                     
              88  W-ERRORI-TRAGICI        VALUE  -9999 THRU -1.         
              88  W-INIZIO-FILE           VALUE  10.                    
              88  W-FINE-FILE             VALUE  11.                    
              88  W-FUORI-FILE            VALUE  12 , 13.               
              88  W-INIZIO-CATENA         VALUE  14.                    
              88  W-FINE-CATENA           VALUE  15.                    
              88  W-DATA-SET-PIENO        VALUE  16.                    
              88  W-REC-NON-TROVATO       VALUE  17.                    
              88  W-ACCESSO-PROTETTO      VALUE  20.                    
              88  W-CHIAVE-DOPPIA         VALUE  43.                    
              88  W-CATENA-NON-ESAURITA   VALUE  44.                    
              88  W-CATENA-PIENA          VALUE 200 THRU 299.           
              88  W-MASTER-PIENO          VALUE 300 THRU 399.           
           25   W-WORD-L-BUFF             PIC S9(4) COMP.               
           25   W-WORD-ATT                PIC S9(9) COMP.               
           25   W-WORD-SIN                PIC S9(9) COMP.               
                88 W-CATENA-VUOTA         VALUE 0.                      
           25   W-WORD-PREC               PIC S9(9) COMP.               
           25   W-WORD-SEG                PIC S9(9) COMP.               
      *>                                                                  
         15   W-DATI-W-DEL.                                             
          20   W-CA-DEL.                                                
           25   W-STATUS-WORD-DEL         PIC S9(4) COMP.               
              88  W-OK-DEL                VALUE  0.                     
              88  W-ERRORE-DEL            VALUE  -1.                    
              88  W-ERRORE-FILE           VALUE  0 THRU 999.            
              88  W-ERRORE-SHOW           VALUE  1000 THRU 9999.        
              88  W-FINE-MESSAGGIO        VALUE  -2.                    
              88  W-ERRORE-EDIT           VALUE  -1.                    
              88  W-ERRORE-EDIT-SPECIALE  VALUE  -3.                    
              88  W-FLAG-EDIT             VALUE  -3 THRU 0.             
              88  W-ERRORI-TRAGICI-DEL    VALUE  -2007 THRU -1000.      
              88  W-ERRORE-DEL-TRASMIS    VALUE -2001.                  
               25        W-SW.                                          
          30  W-SW-1                          PIC S9(4) COMP.           
          30  W-SW-2                      PIC  S9(4) COMP.              
          30  W-SW-3                      PIC S9(4) COMP.               
          30  W-SW-4                      PIC S9(4) COMP.               
          30  W-SW-5                      PIC S9(4) COMP.               
          30  W-SW-6                      PIC S9(4) COMP.               
          30  W-SW-7                      PIC S9(4) COMP.               
          30  W-SW-8                      PIC S9(4) COMP.               
          30  W-SW-9                      PIC S9(4) COMP.               
          30  W-SW-10                     PIC S9(4) COMP.               
           25   FILLER                    PIC X(234).                   
          20   W-NOME-MODULO              PIC X(16).                    
          20   W-LL-MODULO                PIC S9(4) COMP.               
          20   W-NOME-PROX-MODULO         PIC X(16).                    
          20   W-CAMPO-ERRATO.                                          
           25   W-RIGA                    PIC  999.                     
           25   W-COLONNA                 PIC  999.                     
           25   FILLER                    PIC X(66).                    
           25   W-SYSMODULI               PIC X(36).                    
           25   W-PROX-MODULO             PIC X(16).                    
           25   W-TERMINALE               PIC X(8).                     
      *>                                                                  
         15   W-DATI-VIEW REDEFINES W-DATI-W-DEL.                       
          20   W-CA-VIEW.                                               
           25   W-CSTATUS                 PIC S9(4) COMP-5.             
              88 W-OK-VIEW                VALUE 0.                      
           25   W-LINGUAGGIO              PIC S9(4) COMP-5.             
              88  W-COBOL                 VALUE  0.                     
           25   W-LL-CA-VIEW              PIC S9(4) COMP-5.             
           25   W-EXT-BASIC               PIC S9(4) COMP-5.             
           25   W-COLLECT-BROWSE          PIC S9(4) COMP-5.             
              88  W-COLLECT               VALUE 0.                      
              88  W-BROWSE                VALUE 1.                      
           25   W-ULT-TASTO-FUNZ          PIC S9(4) COMP-5.             
              88  W-F0                    VALUE 0.                      
              88  W-F1                    VALUE 1.                      
              88  W-F2                    VALUE 2.                      
              88  W-F3                    VALUE 3.                      
              88  W-F4                    VALUE 4.                      
              88  W-F5                    VALUE 5.                      
              88  W-F6                    VALUE 6.                      
              88  W-F7                    VALUE 7.                      
              88  W-F8                    VALUE 8.                      
           25   W-NUMERO-ERRORI           PIC S9(4) COMP-5.             
              88  W-NO-ERR                VALUE 0.                      
              88  W-ERRORI-FORMALI        VALUE 9999.                   
           25   W-WIND-EN                 PIC S9(4) COMP-5.             
           25   FILLER REDEFINES W-WIND-EN.                             
            30   W-FILLER                 PIC X.                        
            30   W-WINDOW-ENH             PIC X.                        
           25   W-MULTIUSAGE              PIC S9(4) COMP-5.             
           25   W-LABEL-OPTION            PIC S9(4) COMP-5.             
           25   W-NOME-CFORM              PIC X(15).                    
           25   W-FILLER                  PIC X.                        
           25   W-NOME-NFORM              PIC X(15).                    
           25   W-FILLER                  PIC X.                        
           25   W-FLAG-REPEAT             PIC S9(4) COMP-5.             
              88  W-NORMAL                VALUE 0.                      
              88  W-REPEAT                VALUE 1.                      
              88  W-V-REPEAT-APP          VALUE 2.                      
           25   W-FLAG-FREEZE             PIC S9(4) COMP-5.             
              88  W-CLEAR                 VALUE 0.                      
              88  W-APP-NEXT              VALUE 1.                      
              88  W-FREEZE-APP            VALUE 2.                      
           25   W-NR-RIGHE-CFORM          PIC S9(4) COMP-5.             
           25   W-LL-BUFFER               PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   W-LOOK-AHEAD              PIC S9(4) COMP-5.             
           25   W-DELETE-FLAG             PIC S9(4) COMP-5.             
           25   W-SHOWCONTROL             PIC S9(4) COMP-5.             
              88  W-DFORM-BIT15           VALUE 1, 129.                 
              88  W-DDATI-BIT14           VALUE 2, 130.                 
              88  W-DWIND-BIT13           VALUE 4, 132.                 
           25   W-FILLER                  PIC S9(4) COMP-5.             
           25   W-PRINTFILE-NUM           PIC S9(4) COMP-5.             
           25   W-FILERRNUM               PIC S9(4) COMP-5.             
           25   W-ERRFILNUM               PIC S9(4) COMP-5.             
           25   W-FORM-STORE-SIZE         PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   W-NUM-RECS                PIC S9(9) COMP-5.             
           25   W-RECNUM                  PIC S9(9) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   W-TERMFILENUM             PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   FILLER                    PIC S9(4) COMP-5.             
           25   W-RETRIES                 PIC S9(4) COMP-5.             
           25   W-OPTIONS                 PIC S9(4) COMP-5.             
           25   W-ENVIRON                 PIC S9(4) COMP-5.             
           25   W-USER-TIME               PIC S9(4) COMP-5.             
           25   W-TERM-IDENTIFIER         PIC S9(4) COMP-5.             
                88 W-TERM-2624            VALUE 9, 13.                  
           25   W-LAB-INFO                PIC S9(4) COMP-5.             
      *>                                                                  
          20   W-NOME-FORMSFILE           PIC X(20).                    
          20   W-NOME-TERMINALE           PIC X(10).                    
          20   W-NOME-FORM-TEST           PIC X(14).                    
          20   W-NOME-FORM-DETT           PIC X(14).                    
          20   W-LL-FIELD                 PIC S9(4) COMP-5.             
          20   W-FLAGS-STD.                                             
           25   W-FLAG-ERRORI-STD         PIC S9(4) COMP.               
              88 W-NO-ERRORI              VALUE 0.                      
              88 W-ERR-TESTATA            VALUE 1.                      
              88 W-ERR-DETTAGLIO          VALUE 2.                      
           25  W-FLAG-COMANDO             PIC S9(4) COMP-5.             
              88 W-NO-COMANDO             VALUE 0.                      
              88 W-COMANDO-OK             VALUE 1.                      
              88 W-COMANDO-NO-OK          VALUE -1.                     
           25  W-FLAG-RICERCA             PIC S9(4) COMP-5.             
          20   W-NR-FIELD                 PIC S9(4) COMP-5.             
          20   W-LL-FIELD-MOSSO           PIC S9(4) COMP-5.             
          20   W-NR-PROX-FIELD            PIC S9(4) COMP-5.             
          20   W-PRINT-C                  PIC S9(4) COMP-5.             
          20   W-PAGE-C                   PIC S9(4) COMP-5.             
      *>                                                                  
          20   W-DATI-WINDOW.                                           
           25   W-LL-MAX-WINDOW           PIC S9(4) COMP-5.             
           25   W-LL-WINDOW               PIC S9(4) COMP-5.             
           25   W-MESS-X-WINDOW.                                        
            30   W-FIL-WINDOW             PIC X(54).                    
            30   W-RESTO-WINDOW           PIC X(24).                    
      *>                                                                  
          20   W-CAMPO-ERR.                                             
           25   W-FIL-ERR                 PIC X.                        
           25   W-NUM-ERR                 PIC Z(15)9.                   
           25   W-NUM-ERR-X REDEFINES W-NUM-ERR PIC X(16).              
           25   W-FILLER                  PIC X.                        
          20   W-LL-CAMPO-ERR             PIC S9(4) COMP.               
          20   W-LL-CAMPO-ERR-2           PIC S9(4) COMP.               
      *>                                                                  
          20   W-CAMPI-FLAG-STD.                                        
           25   W-FLAG-FINISH-TEST        PIC S9(4) COMP.               
           25   W-FLAG-FINISH-DETT        PIC S9(4) COMP.               
                88 W-FINISH-DETT          VALUE 1, 3.                   
                88 W-DETT-CIECO           VALUE 2, 3.                   
           25   W-NUMERO-FORMS            PIC S9(4) COMP.               
           25   W-FLAG-LOOP-TEST          PIC S9(4) COMP.               
           25   W-FLAG-TIPO-AGG           PIC S9(4) COMP.               
              88  W-AGG-FINALE            VALUE 1.                      
              88  W-AGG-PER-PAG           VALUE 2.                      
      *>                                                                  
          20   W-FLAG-CHIUDI-TEST             PIC S9(4)  COMP.          
           88   W-FINE-TESTATA              VALUE 1.                    
         20   W-FLAG-CHIUDI-DETT          PIC  S9(4)  COMP.             
           88   W-FINE-DETTAGLIO          VALUE 1.                      
         20  W-LL-DISPLAY               PIC S9(4) COMP.                 
         20  W-CTL-DISPLAY              PIC S9(4) COMP.                 
           20   W-CAMPO-SIGLA.                                          
            30   W-PAR-TESTP.                                           
            35   W-LL-MAX-SIGLA           PIC S9(4) COMP.               
            35   W-LL-SIGLA               PIC S9(4) COMP.               
            30   W-SIGLA-OUT.                                           
             35   W-POS-RC                PIC X(9).                     
             35   FILLER                  PIC XX.                       
             35   W-SIGLA-AZ              PIC X(8).                     
             35   FILLER                  PIC XX.                       
            30  FILLER REDEFINES W-SIGLA-OUT.                           
      *>       35  FILLER                   PIC X(20).                    
          35   W-CAMPO-COMANDO.                                         
           45   W-CAMPO-PUNTO             PIC X.                        
           45   W-FILLER                  PIC X.                        
                88 W-PAGINAZ              VALUE "P".                    
           45   W-FIL-COM-SPACE.                                        
            47  W-COMAND-SPACE-1          PIC X.                        
                88 W-P-1-9                VALUE "1" THRU "9".           
            47  W-COMAND-SPACE-2          PIC X.                        
                88 W-P-10-99              VALUE "0" THRU "9".           
           20   FILLER                    PIC X.                        
           20   W-PAR-SOPTV.                                            
            25   W-FUNZ-SOPTV             PIC S9(4) COMP.               
            25   W-STATO-SOPTV            PIC S9(4) COMP.               
            25   W-TIPO-SOPTV             PIC S9(4) COMP.               
            25   FILLER                   PIC X.                        
            25   W-RIGA-V                 PIC 99.                       
            25   FILLER                   PIC X.                        
            25   W-COLONNA-V              PIC 99.                       
      *>                                                                  
         15   W-MESSAGGI-COMANDO.                                       
          20   W-ULT-MESS-COMANDO         PIC X(4).                     
              88  W-CHIUDI-SOTTOSISTEMA   VALUE  ".CS ".                
              88  W-CHIUDI-FUNZIONE       VALUE  ".CF ".                
              88  W-CHIUDI-OPERAZIONE     VALUE  ".CO ".                
              88  W-ANNULLA-1               VALUE  ".A  ".              
              88  W-PROSEGUI-1            VALUE  ".P  ".                
              88  W-VARIA                 VALUE  ".V  ".                
              88  W-PAG-PRECEDENTE        VALUE  ".PP ".                
              88  W-PAG-SEGUENTE          VALUE  ".PS ".                
               88 W-INSERISCI             VALUE  ".I  ".                
               88 W-ANNULLA-RIGA          VALUE  ".AR ".                
               88 W-STAMPA                VALUE ".S  ".                 
          20 FILLER REDEFINES W-ULT-MESS-COMANDO.                       
           25 W-ULT-MESS-1                PIC XX.                       
            88 W-CHIUDI                   VALUE ".C".                   
            88 W-ANNULLA                  VALUE ".A".                   
            88 W-PROSEGUI                 VALUE ".P".                   
           25 W-NR-PAGINA-10-99           PIC 99.                       
           25 FILLER REDEFINES W-NR-PAGINA-10-99.                       
            30 W-NR-PAGINA-1-9            PIC 9.                        
            30 FILLER                     PIC X.                        
          20 FILLER REDEFINES W-ULT-MESS-COMANDO.                       
           25 W-ULT-MESS-2                PIC X.                        
            88 W-COMANDO                  VALUE ".".                    
           25 FILLER                      PIC X.                        
           25 FILLER                      PIC X.                        
             88 W-PAGINA-1-9              VALUE "1" THRU "9".           
           25 FILLER                      PIC X.                        
            88 W-PAGINA-10-99             VALUE "0" THRU "9".           
          20   W-ZONA-MESSAGGI-FISSI.                                   
            25 W-ZONA-MESSAGGI-PUNTO.                                   
             30 W-NR-MESS-PUNTO           PIC S9(4)  COMP.              
            30  W-PUNTO-CS.                                             
             35  W-PUNTO                  PIC X.                        
             35  FILLER                   PIC XXX.                      
            30  W-PUNTO-CF                PIC X(4).                     
            30  W-PUNTO-CO                PIC X(4).                     
            30  W-PUNTO-A                 PIC X(4).                     
            30  W-PUNTO-P                 PIC X(4).                     
            30  W-PUNTO-V                 PIC X(4).                     
            30  W-PUNTO-PP                PIC X(4).                     
            30  W-PUNTO-PS                PIC X(4).                     
            30  W-PUNTO-I                 PIC X(4).                     
            30  W-PUNTO-AR                PIC X(4).                     
          25 FILLER REDEFINES W-ZONA-MESSAGGI-PUNTO.                    
           30 FILLER                      PIC XX.                       
           30   W-MESS-FISSO    PIC X(4) OCCURS 10                      
                                  INDEXED BY  I-W-MESS-FISSO.           
      *>                                                                  
          15  W-FLAG-LAVORO               PIC S9(4)  COMP.              
           88  W-FINE-LAVORO              VALUE 1.                      
           88  W-LAVORO-CONTINUO          VALUE 0.                      
         15   W-DATI-GENERALI.                                          
          20   W-SIGLA-TERMINALE          PIC X(4).                     
          20   W-SIGLA-OUT-ASSOCIATO.                                   
            25    W-TIPO-TER       PIC XX.                              
            25    W-NR-OUT-ASSOCIATO    PIC XX.                         
          20   W-TIPO-ASSOCIAZIONE        PIC XX.                       
          20   W-INDICI-W-COMMON.                                       
           25   W-INDICE-1                PIC S9(4) COMP.               
           25   W-INDICE-2                PIC S9(4) COMP.               
           25   W-INDICE-3                PIC S9(4) COMP.               
           25   W-INDICE-4                PIC S9(4) COMP.               
           25   W-INDICE-5                PIC S9(4) COMP.               
           25   W-INDICE-6                PIC S9(4) COMP.               
           25   W-INDICE-7                PIC S9(4) COMP.               
           25   W-INDICE-8                PIC S9(4) COMP.               
      *>            USATO COME FLAG PER ROUTINES DEL E IMAGE              
          20   W-INDICI-W-COMMON-RID REDEFINES W-INDICI-W-COMMON.       
           25   W-INDICE                  PIC S9(4) COMP OCCURS 8       
                                          INDEXED BY I-W-INDICE.        
          20   W-SIGLA-UTENTE             PIC X(8).                     
          20   W-DATA-DEL-GIORNO.                                       
           25   W-FORMATO-INTERNO         PIC 9(8) COMP.                
           25   W-FORMATO-ESTERNO-1       PIC X(8).                     
           25   W-FORMATO-GG-MM-AA REDEFINES W-FORMATO-ESTERNO-1        
                                          PIC X(8).                     
           25   W-FORMATO-ESTERNO-2       PIC X(12).                    
           25 W-FORMATO-GG-MMM-AAAA REDEFINES W-FORMATO-ESTERNO-2       
                                          PIC X(12).                    
           25 W-FORMATO-GGMMAA.                                         
             30  W-GG           PIC 99.                                 
             30 W-MM            PIC 99.                                 
             30 W-AA            PIC 99.                                 
          20   W-PARAMETRI-UTE.                                         
           25   W-CODICE-FISCALE          PIC X(16).                    
           25   W-CONTI-BASE.                                           
            30   W-CLIENTI-ITA            PIC 9(4) COMP.                
            30   W-CLIENTI-EXP            PIC 9(4) COMP.                
            30   W-FORNITORI              PIC 9(4) COMP.                
            30   W-AGENTI-ITA             PIC 9(4) COMP.                
            30   W-AGENTI-EXP             PIC 9(4) COMP.                
            30   W-PORTAF-ITA             PIC 9(4) COMP.                
            30   W-PORTAF-EXP             PIC 9(4) COMP.                
            30   W-I-V-A                  PIC 9(4) COMP.                
            30   W-RICAVI-ITA-INV         PIC 9(4) COMP.                
            30   W-RICAVI-ITA-PE          PIC S9(4) COMP.               
            30   W-RICAVI-EXP-INV         PIC S9(4) COMP.               
            30   W-RICAVI-EXP-PE          PIC S9(4) COMP.               
            30   W-RICAVI-MP              PIC 9(4) COMP.                
            30   W-TRASPORTI              PIC 9(4) COMP.                
            30   W-IMBALLI                PIC 9(4) COMP.                
            30   W-SCONTI                 PIC 9(4) COMP.                
            30   W-BANCHE                 PIC 9(4) COMP.                
            30   W-DEBIT-DIV              PIC 9(4) COMP.                
            30   W-CREDIT-DIV             PIC 9(4) COMP.                
            30   W-EFFETTI-SCONTO         PIC 9(4) COMP.                
            30   W-EFFETTI-SBF            PIC 9(4) COMP.                
            30   W-EFFETTI-DOPO-INCASSO   PIC 9(4) COMP.                
            30   W-SPESE-VARIE-BOLLI      PIC 9(4) COMP.                
            30   W-RICAVI-CAUZ            PIC 9(4) COMP.                
            30   W-COSTI                  PIC 9(4) COMP.                
            30   W-FORN-ANTICIPI          PIC 9(4) COMP.                
            30   W-CLIENTI-ANTICIPI       PIC 9(4) COMP.                
            30   W-CONTO-RAG-1            PIC 9(4) COMP.                
            30   W-CONTO-RAG-2            PIC 9(4) COMP.                
            30   W-PERDITE-PROFITTI       PIC 9(4) COMP.                
            30   W-BILANCIO-CHIUSURA      PIC 9(4) COMP.                
            30   W-BILANCIO-APERTURA      PIC 9(4) COMP.                
           25   W-CONTI-BASE-RID REDEFINES W-CONTI-BASE.                
            30   W-CONTO-BASE             PIC 9(4) COMP OCCURS 32       
                                          INDEXED BY I-W-CONTO-BASE.    
           25   W-TIPO-LANCIO             PIC S9(4) COMP.               
           25   W-NUM-TERM                PIC  9(4) COMP.               
           25   W-UTENTE                  PIC X(8).                     
           25   W-GRUPPO                  PIC X(8).                     
           25   W-ACCOUNT                 PIC X(8).                     
           25   W-IND-REC-PARAM           PIC S9(9) COMP.               
      *> conv                                                             
      *>  directory di lavoro                                             
           25 AREE-VARIE-MENUTREE.                                      
             30 W-DIRECTORY               PIC X(60).                    
      *> conv-end                                                         
           25   W-PARAMETRI-FUNZIONE      PIC X(144).                   
           25   W-PAR-FUNZ-RID  REDEFINES W-PARAMETRI-FUNZIONE.         
            30   W-FLAGS.                                               
             35   W-FLAG-1                PIC X.                        
             35   W-FLAG-2                PIC X.                        
             35   W-FLAG-3                PIC X.                        
             35   W-FLAG-4                PIC X.                        
             35   W-FLAG-5                PIC X.                        
             35   W-FLAG-6                PIC X.                        
             35   W-FLAG-7                PIC X.                        
             35   W-FLAG-8                PIC X.                        
      *>                                                                  
            30   FILLER                   PIC X(136).                   
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *> CONTROL LIST                                                     
      *>      ===PREPROCESSOR==>COPY WCOMMONW END

                                       
      *>                                                                  
      *> EXEC SQL INCLUDE SQLCA END-EXEC.                                 
      *>                                                                  
       01 SALTO PIC S9(4) COMP.                                         
      *>                                                                  
      *> PAGE                                                             
      *>                                                                  
       PROCEDURE DIVISION USING W-COMMON SQLCA SALTO.                   
       INIZIO.                                                          
           MOVE 0 TO USCITA-PROGRAMMA CONT                              
      *> T5000*                                                           
                     USCITA-DEVICE.                                     
      *>                                                                  
           MOVE W-FORMATO-INTERNO TO AA-MM-GG-DDT.                      
      *> T5000*                                                           
           PERFORM TRATTA-DEV THRU EX-TRATTA-DEV                        
                  UNTIL DEV-OK.                                         
      *> 
      *> ASOLOB2C*                                                        
           PERFORM S-SET-1 THRU S-SET-1-EX 
           PERFORM CARICA-B2C-NO-DT THRU EX-CARICA-B2C-NO-DT.
      *>  NO-DATGE                                                        
      *>      PERFORM S-SET-2 THRU S-SET-2-EX 
      *>  NO-DATGE                                                        
       
      *> ASOLOB2C*                                                        
      *> 
                PERFORM TRATTA-IMPEGNATO THRU EX-TRATTA-IMPEGNATO.
       
           PERFORM TRATTA-NEG THRU EX-TRATTA-NEG                        
                     UNTIL USCITA-PROGRAMMA = 1.                        
       FINE.                                                            
           EXIT PROGRAM.                                                
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *> T5000*                                                           
       TRATTA-DEV.                                                      
           MOVE SPACES TO DEV-IN.                                       
           DISPLAY "Disp. USCITA >> " NO ADVANCING.                     
           ACCEPT DEV-IN.                                               
           MOVE 2 TO QD-LL-A QD-LL-B.                                   
           MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC.                     
           CANCEL "QDEEDIT"
           CALL "QDEEDIT" USING PARDEED DEV-IN                          
                                DESTINO-USCITA.                         
           IF QD-STATO OF PARDEED NOT = 0 OR                            
            (QD-STATO OF PARDEED = 0 AND NOT DESTINO-VALIDO)            
             DISPLAY "Dest. USCITA Err. " DEV-IN                        
             PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
           ELSE                                                         
             MOVE 1 TO USCITA-DEVICE.                                   
       EX-TRATTA-DEV.                                                   
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
            TRATTA-IMPEGNATO.
                MOVE SPACES TO DISIMPEGNA.
                DISPLAY "Si vuole eliminare impegnato ?(SI/NO)"
                ACCEPT DISIMPEGNA.
                IF DISIMPEGNA = "si" 
                  MOVE "SI" TO DISIMPEGNA
                END-IF
                IF DISIMPEGNA = "no"
                  MOVE "NO" TO DISIMPEGNA
                END-IF
                IF DISIMPEGNA NOT = "SI" AND DISIMPEGNA NOT = "NO"
                  DISPLAY "Input non valido."
                  PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                END-IF.
            EX-TRATTA-IMPEGNATO. EXIT. 
       
       TRATTA-NEG.                                   
           MOVE 100 TO IND-RIGA.                                        
           MOVE 0 TO OK-NEG IND-PAG.                                    
           MOVE 0 TO PREZZO-TOT.                                        
           PERFORM VERIF-NEG THRU EX-VERIF-NEG                          
                      UNTIL NEG-OK.                                     
           IF USCITA-PROGRAMMA = 1                                      
              GO TO EX-TRATTA-NEG.                                      
                                                                        
      *> MAG6/7*                                                          
           MOVE SPACE TO MAG-INPUT.                                     
           PERFORM VERIF-MAG THRU EX-VERIF-MAG                          
               UNTIL MAG-INPUT NUMERIC.   
      *> 
      *> Mag3_V/F*
           MOVE SPACE TO F-V-INPUT.                                     
           PERFORM VERIF-F-V THRU EX-VERIF-F-V                          
               UNTIL NOT F-V-INPUT = SPACE.   
      *> 
       
      *> UNICODDT*                                                        
      *>      MOVE 0 TO OK-NEG
      *>      PERFORM VERIF-AS-SOC-CL  
      *>          THRU EX-VERIF-AS-SOC-CL
      *>      IF NOT NEG-OK
      *>        GO TO EX-TRATTA-NEG.
      *> *MAXCA*
      *>      MOVE SPACE TO MAX-CAPI-INPUT.
      *>      PERFORM VERIF-MAX-CAPI  
      *>          THRU EX-VERIF-MAX-CAPI   
      *>         UNTIL MAX-CAPI-INPUT NUMERIC.
      *> 
       
           MOVE 0 TO OK-NEG.
           PERFORM VERIFICA-SOC THRU EX-VERIFICA-SOC
           IF NOT NEG-OK
              GO TO EX-TRATTA-NEG.
            
           PERFORM CARICA-TAB-UNICO-DDT THRU EX-CARICA-TAB-UNICO-DDT.
           IF QT-NUM-ELEM-EFF OF PAR-TAB-UNICO-DDT = 0
               MOVE 0 TO OK-NEG.
           
           IF NOT NEG-OK
              GO TO EX-TRATTA-NEG.
      *> UNICODDT*                                                        
      *> 
      *>                                                                  
      *> PRODI*       
      *>      IF MAG-STOCK
      *>         MOVE 0 TO STK-PRIMA-VOLTA
      *>         PERFORM CARICA-TABELLA THRU EX-CARICA-TABELLA
      *>      END-IF.
           IF DISIMPEGNA = "SI"
             PERFORM CICLO-DISIMPEGNO THRU EX-CICLO-DISIMPEGNO
           END-IF
       
           PERFORM INIZIA-TAB-ART THRU EX-INIZIA-TAB-ART.               
           PERFORM INIZIA-TAB-SING THRU EX-INIZIA-TAB-SING.             
           PERFORM TRATTA-OLD-NEW THRU EX-TRATTA-OLD-NEW.               
           PERFORM TRATTA-LETTI THRU EX-TRATTA-LETTI.                   
       EX-TRATTA-NEG.                                                   
           EXIT. 
      *> 
       
      *> UNICODDT*                                                        
       VERIFICA-SOC.
           MOVE SPACE TO SOCIETA-INPUT.
           DISPLAY "Soc >> (vuoto = tutti) " NO ADVANCING.              
           ACCEPT SOCIETA-INPUT.                                        
           MOVE 1 TO QD-LL-A QD-LL-B.                                   
           MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC.                     
           CANCEL "QDEEDIT"
           CALL "QDEEDIT" USING PARDEED SOCIETA-INPUT                   
                                  SOCIETA-INPUT-R.                      
           IF QD-STATO OF PARDEED NOT = 0                    
             DISPLAY "Soc Err. " SOCIETA-INPUT                  
             GO TO EX-VERIFICA-SOC.      
      *> 
           MOVE 1 TO OK-NEG.
       EX-VERIFICA-SOC. EXIT. 
      *> UNICODDT*                                                        
      *> 
      *> 
      *> UNICODDT*                                                        
       CARICA-TAB-UNICO-DDT.
            PERFORM INIT-PAR-TAB-UNICO-DDT THRU 
                 EX-INIT-PAR-TAB-UNICO-DDT.
                 
            MOVE 0 TO SW-FINE-CARICA-TAB.
            PERFORM  UNTIL FINE-CARICA-TAB
                PERFORM VERIFICA-AS THRU EX-VERIFICA-AS
                IF NOT FINE-AS
                    PERFORM VERIFICA-CL THRU  EX-VERIFICA-CL
                    PERFORM VERIFICA-MAX-CAPI THRU
                         EX-VERIFICA-MAX-CAPI
       
      *>               DISPLAY "INSERIMENTO-TAB-UNICO-DDT"
                    PERFORM VARYING I-AS FROM 1 BY 1 
                        UNTIL I-AS > 20
                        IF AS-IN-R(I-AS) > 0 
                            MOVE AS-IN-R(I-AS) 
                              TO TAB-AS OF DEP-TAB-UNICO-DDT
                            PERFORM VARYING I-CL FROM 1 BY 1 
                                UNTIL I-CL > 99
                                IF CL-IN-R(I-CL) > 0
                                     MOVE CL-IN-R(I-CL) 
                                       TO TAB-CL OF DEP-TAB-UNICO-DDT   
                                     MOVE MAX-CAPI-INPUT-R 
                                       TO TAB-MAX-CAPI  
                                     MOVE 0 TO TAB-CAPI-LETTI
      *>                                DISPLAY "INS " DEP-TAB-UNICO-DDT  
                                     PERFORM INS-TAB-UNICO-DDT THRU 
                                          EX-INS-TAB-UNICO-DDT 
                                END-IF
                            END-PERFORM
                        END-IF
                    END-PERFORM 
                END-IF
            END-PERFORM.
            
            display "---------------------------".
            DISPLAY "AS CL MAX-CAPI INSERITI".
            PERFORM MOSTRA-TAB-UNICO-DDT THRU 
                 EX-MOSTRA-TAB-UNICO-DDT.
            DISPLAY "CORRETTI? 'SI' per proseguire "
                    "'NO' per rifare elenco AS CL da capo"
            MOVE "NO" TO SINO.
            ACCEPT SINO.
            IF SINO-NO
                GO TO CARICA-TAB-UNICO-DDT.
            
            IF XD = "S"
                DISPLAY "sono dopo mostra-tab-unico"
      *>           display "return per proseguire"                        
      *>           accept pro
                .
       EX-CARICA-TAB-UNICO-DDT. EXIT.
      *> 
      *> 
       VERIFICA-AS.
      *>      DISPLAY "VERIFICA-AS".
           DISPLAY "AS >> (tt=tutti) (elenco separato da ,) (CHIUDI)".  
      *> 
           MOVE SPACES TO ELENCO-AS.
           ACCEPT ELENCO-AS
           IF FINE-AS
               MOVE 1 TO SW-FINE-CARICA-TAB
               GO TO EX-VERIFICA-AS.
      *> ASZERO*
           IF TUTTI-AS-ELENCO
               DISPLAY "Tratto tutti gli AS"
               MOVE STRINGA-TUTTI-AS TO ELENCO-AS
           ELSE
               MOVE 0 TO SW-AS-ERR
               PERFORM VARYING I-AS FROM 1 BY 1 
                 UNTIL I-AS > 10
                 OR AS-ERR
                    MOVE 2 TO QD-LL-A QD-LL-B                           
                    MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC             
                    CANCEL "QDEEDIT"
                    CALL "QDEEDIT" USING PARDEED AS-IN(I-AS)            
                                                AS-IN-R(I-AS)           
                    IF (QD-STATO OF PARDEED NOT = 0)
      *>              OR (AS-IN-R(I-AS) = 0)
                       DISPLAY "AS Err. " AS-IN(I-AS)
                       MOVE 1 TO SW-AS-ERR
                       GO TO VERIFICA-AS
                    END-IF
                END-PERFORM.                
      *>      DISPLAY "EX-VERIFICA-AS " ELENCO-AS.
       EX-VERIFICA-AS. EXIT.
      *> 
      *> 
       VERIFICA-CL.
      *>       DISPLAY "VERIFICA-CL".
            MOVE SPACES TO ELENCO-CL.
            DISPLAY "CL >> (elenco separato da ,)".
            ACCEPT ELENCO-CL.  
           
           IF TUTTI-CL-ELENCO
               DISPLAY "Tratto tutti le CL"
               MOVE SPACES TO ELENCO-CL
               PERFORM VARYING I-APP FROM 1 BY 1 UNTIL I-APP > 99
                    MOVE I-APP TO CL-IN-R(I-APP)
               END-PERFORM
           ELSE
               MOVE 0 TO SW-CL-ERR
               PERFORM VARYING I-CL FROM 1 BY 1
                 UNTIL I-CL > 10 OR CL-ERR     
                  MOVE 2 TO QD-LL-A QD-LL-B                             
                  MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC               
                  CANCEL "QDEEDIT"
                  CALL "QDEEDIT" USING PARDEED CL-IN(I-CL)              
                                             CL-IN-R(I-CL)              
                  IF QD-STATO OF PARDEED NOT = 0  
      *>             OR (QD-STATO OF PARDEED = 0 AND CL-IN(I-CL)  = 0)    
                      DISPLAY "Cl Err. " CL-IN(I-CL)                  
                      MOVE 1 TO SW-CL-ERR
                  END-IF
                END-PERFORM
                IF CL-ERR
                    GO TO VERIFICA-CL.
                
      *>       DISPLAY "EX-VERIFICA-CL " ELENCO-CL.
       EX-VERIFICA-CL. EXIT.
       
      *> *MAXCA*
        VERIFICA-MAX-CAPI.  
      *>       DISPLAY "VERIFICA-MAX-CAPI".
            DISPLAY "MaxCapi >> (vuoto = tutti) " NO ADVANCING.         
            ACCEPT MAX-CAPI-INPUT.                     
            MOVE 6 TO QD-LL-A QD-LL-B.                                  
            MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC.                    
            CANCEL "QDEEDIT"
            CALL "QDEEDIT" USING PARDEED MAX-CAPI-INPUT                 
                                   MAX-CAPI-INPUT-R. 
            IF QD-STATO OF PARDEED NOT = 0 
              DISPLAY "MaxCapi Err. " 
              GO TO VERIFICA-MAX-CAPI.
              
      *>        MOVE SPACE TO MAX-CAPI-INPUT.
      *>       DISPLAY "EX-VERIFICA-MAX-CAPI " MAX-CAPI-INPUT-R.
        EX-VERIFICA-MAX-CAPI.
            EXIT.
       
      *> UNICODDT*                                                        
       
       
      *> UNICODDT*   TOLTO PER CARICARE TAB-UNICO-DDT                     
      *>  VERIF-AS-SOC-CL.
      *>      MOVE SPACE TO AS-INPUT.
      *> *ASZERO*
      *> *     DISPLAY "AS >> (vuoto = tutti) " NO ADVANCING.             
      *>      DISPLAY "AS >> (tt = tutti) " NO ADVANCING.                 
      *> **
      *>      ACCEPT AS-INPUT.
      *> *ASZERO*
      *>      IF TUTTI-AS
      *>         DISPLAY "Tratto tutti gli AS"
      *>      ELSE
      *> **
      *>         MOVE 2 TO QD-LL-A QD-LL-B                                
      *>         MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC                  
      *>         CANCEL "QDEEDIT"
      *>         CALL "QDEEDIT" USING PARDEED AS-INPUT                    
      *>                                AS-INPUT-R                        
      *>         IF (QD-STATO OF PARDEED NOT = 0)
      *> *ASZERO*
      *>            OR (AS-INPUT-R = 0)
      *> **
      *> *     OR                                    
      *> *      (QD-STATO OF PARDEED = 0 AND S-INPUT-R NOT = 2 AND
      *> *             S-INPUT-R NOT = 4)                    
      *>           DISPLAY "AS Err. " AS-INPUT                  
      *>           GO TO EX-VERIF-AS-SOC-CL
      *>      END-IF.
      *> **
      *>      MOVE SPACE TO SOCIETA-INPUT.
      *>      DISPLAY "Soc >> (vuoto = tutti) " NO ADVANCING.             
      *>      ACCEPT SOCIETA-INPUT.                                       
      *>      MOVE 1 TO QD-LL-A QD-LL-B.                                  
      *>      MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC.                    
      *>      CANCEL "QDEEDIT"
      *>      CALL "QDEEDIT" USING PARDEED SOCIETA-INPUT                  
      *>                             SOCIETA-INPUT-R.                     
      *>      IF QD-STATO OF PARDEED NOT = 0                    
      *>        DISPLAY "Soc Err. " SOCIETA-INPUT                  
      *>        GO TO EX-VERIF-AS-SOC-CL.      
      *> *                   
      *>      MOVE SPACE TO CLASSE-INPUT.
      *>      DISPLAY "Cl >> " NO ADVANCING.                             
      *>      ACCEPT CLASSE-INPUT.                                        
      *>      MOVE 2 TO QD-LL-A QD-LL-B.                                  
      *>      MOVE 0 TO QD-STATO OF PARDEED QD-NR-DEC.                    
      *>      CANCEL "QDEEDIT"
      *>      CALL "QDEEDIT" USING PARDEED CLASSE-INPUT                   
      *>                             CLASSE-INPUT-R.                      
      *>      IF QD-STATO OF PARDEED NOT = 0  OR                          
      *>       (QD-STATO OF PARDEED = 0 AND CLASSE-INPUT-R  = 0)          
      *>        DISPLAY "Cl Err. " CLASSE-INPUT                  
      *>        GO TO EX-VERIF-AS-SOC-CL.
      *> **
      *>      MOVE 1 TO OK-NEG.
      *>  EX-VERIF-AS-SOC-CL.
      *>      EXIT.
      *> UNICODDT*                                                        
       
         CALL-DISIMPEGNA-MAG.
             CALL "PYTHON" USING "disimpegna_capi"
                                "elimina_impegnati"
                                 PY-INPUT-REC-DISIMPEGNA
                                 PY-OUTPUT-DISIMPEGNO.
         EX-CALL-DISIMPEGNA-MAG. EXIT.
       
      *> 
      *>                                                                  
       INIZIA-TAB-ART.                                                  
           MOVE 0 TO QT-STATO OF PARTAB-ART                             
                     QT-NUM-ELEM-EFF OF PARTAB-ART                      
                     QT-INDEX-ELEM OF PARTAB-ART.                       
           MOVE NUM-ELEM-MAX-ART TO QT-NUM-ELEM-MAX OF PARTAB-ART.      
           MOVE "K1" TO QT-FUNZIONE OF PARTAB-ART.   
      *> VACO*                                                            
      *> *BUDA*                                                           
      *>      MOVE 75 TO QT-LL-ELEM OF PARTAB-ART.
      *>      MOVE 79 TO QT-LL-ELEM OF PARTAB-ART.
            COMPUTE QT-LL-ELEM OF PARTAB-ART = 
                     FUNCTION LENGTH(ART-TAB-LETTI (1)). 
      *> VACO*                                                            
           MOVE 1 TO QT-ADDR-KEY OF PARTAB-ART.                         
           MOVE 8 TO QT-LL-KEY OF PARTAB-ART.                           
       EX-INIZIA-TAB-ART.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       INIZIA-TAB-SING.                                                 
           MOVE 0 TO QT-STATO OF PARTAB-SING                            
                     QT-NUM-ELEM-EFF OF PARTAB-SING                     
                     QT-INDEX-ELEM OF PARTAB-SING.                      
           MOVE 9999 TO QT-NUM-ELEM-MAX OF PARTAB-SING.
           MOVE "K1" TO QT-FUNZIONE OF PARTAB-SING.                     
      *> MOVSKU                            
      *>      MOVE 23 TO QT-LL-ELEM OF PARTAB-SING.       
           MOVE 36 TO QT-LL-ELEM OF PARTAB-SING.                        
           MOVE 1 TO QT-ADDR-KEY OF PARTAB-SING.                        
           MOVE 10 TO QT-LL-KEY OF PARTAB-SING.                         
       EX-INIZIA-TAB-SING.                                              
           EXIT.                                                        
      *>                                                                  
       LEGGI-PARAMDT.                                                   
           MOVE "DPARAM;" TO W-NOME-DATA-SET.                           
           MOVE "C-AZIENDA;" TO W-NOME-CAMPO.                           
           MOVE 0 TO W-VALORE-CAMPO-HW.                                 
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           IF NOT W-OK-IMAGE                                            
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON.                           
           MOVE 5 TO W-MODO.                                            
           PERFORM TTDBGET THRU EX-TTDBGET.                             
           MOVE AREA-REC-SET TO REC-PARAM-RID.                          
           PERFORM DBGET-PARAMDT THRU EX-DBGET-PARAMDT                  
            UNTIL                                                       
                 W-FINE-CATENA  OR                                      
                 P-EXTRAMAG OF REC-PARAMETRI.                           
           IF W-FINE-CATENA                                             
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON                            
             ELSE                                                       
                MOVE W-WORD-ATT TO INDIRIZZO-DPARAM                     
                MOVE NUM-BOLLA-TAGLIO-FODERE TO NUMERO-DDT.             
       EX-LEGGI-PARAMDT.                                                
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       DBGET-PARAMDT.                                                   
           PERFORM TTDBGET THRU EX-TTDBGET.                             
           MOVE AREA-REC-SET TO REC-PARAM-RID.                          
       EX-DBGET-PARAMDT.                                                
           EXIT.                                                        
      *> 
      *> volante*
      *>                                                                  
       LEGGI-PARAMDT-FITTIZI.                                           
           MOVE "DPARAM;" TO W-NOME-DATA-SET.                           
           MOVE "C-AZIENDA;" TO W-NOME-CAMPO.                           
           MOVE 0 TO W-VALORE-CAMPO-HW.                                 
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           IF NOT W-OK-IMAGE                                            
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON.                           
           MOVE 5 TO W-MODO.                                            
           PERFORM TTDBGET THRU EX-TTDBGET.                             
           MOVE AREA-REC-SET TO REC-PARAM-FITTIZ-R.                     
           PERFORM DBGET-PARAMDT-FTZ THRU EX-DBGET-PARAMDT-FTZ          
            UNTIL                                                       
                 W-FINE-CATENA  OR                                      
                 P-RIPRADI OF REC-PARAM-FITTIZI.                        
           IF W-FINE-CATENA                                             
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON                            
             ELSE                                                       
                MOVE W-WORD-ATT TO INDIRIZZO-DPARAM                     
                MOVE PAR-FITTIZIO-1 TO NUMERO-DDT.                     
       EX-LEGGI-PARAMDT-FITTIZI.                                        
           EXIT.                                                        
      *> 
      *>                                                                  
       DBGET-PARAMDT-FTZ.                                               
           PERFORM TTDBGET THRU EX-TTDBGET.                             
           MOVE AREA-REC-SET TO REC-PARAM-FITTIZ-R.                     
       EX-DBGET-PARAMDT-FTZ.                                            
           EXIT.                                                        
      *> 
      *> 
      *> 
      *> PAGE                                                             
      *>                                                                  
      *>                                                                  
       VERIF-NEG.                                                       
           MOVE SPACES TO D-CONTO-MEM                                   
                          INDIRIZZO-COM INDIRIZZO-C-COM                 
                          LOCALITA-COM LOCALITA-C-COM                   
                          CONTO-IN                                      
                          PROV-COM PROV-C-COM.                          
           MOVE 0 TO CAP-COM CAP-C-COM.                                 
      *>     DISPLAY " ".                                                 
      *>                   NO ADVANCING.                                  
      *>     DISPLAY "m".                                                
      *>     DISPLAY "hJ".                                              
      *>        PERFORM VARYING IR FROM 1 BY 1                            
      *>             UNTIL IR > SALTO                                     
              DISPLAY SPACE                                             
      *>        END-PERFORM                                               
           DISPLAY "CONTO cliente (8 cifre)".                           
           DISPLAY "  (END/end=fine)"                                   
           ACCEPT CONTO-IN.                                             
           IF CONTO-FINE = "END" or = "end"
              MOVE 1 TO OK-NEG                                          
                        USCITA-PROGRAMMA                                
             ELSE                                                       
                IF CONTO-IN NOT NUMERIC                                 
                   DISPLAY "CODICE non numerico"                        
                   PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                  ELSE                                                  
                     MOVE "ANACON;" TO W-NOME-DATA-SET                  
                     MOVE "CONTO;" TO W-NOME-CAMPO                      
                     MOVE CONTO-IN-R TO W-VALORE-CAMPO-W                
                     MOVE 7 TO W-MODO                                   
                     PERFORM TTDBGET THRU EX-TTDBGET                    
                     IF NOT W-OK-IMAGE                                  
                        DISPLAY "Manca CLIENTE " CONTO-IN-R             
                        PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                       ELSE                                             
                          MOVE D-CONTO OF REC-ANACON TO D-CONTO-MEM     
      *> BUDA*                                                            
                          MOVE FLAG-ANA-8 TO FLAG-ANACON                
                          IF FILIALE-DT-ESTERO                          
                            MOVE 1 TO FLAG-DT-ESTERO                    
                          ELSE                                          
                            MOVE 0 TO FLAG-DT-ESTERO                    
                          END-IF                                        
                          PERFORM LEGGI-IND THRU EX-LEGGI-IND           
                          PERFORM MUOVI-IND THRU EX-MUOVI-IND           
                          PERFORM MUOVI-CAP THRU EX-MUOVI-CAP           
      *> FIFRA*                                                           
                          PERFORM SCEGLI-CONTO-FATTURA                  
                               THRU EX-SCEGLI-CONTO-FATTURA             
      *> BUDA*                                                            
                          PERFORM CERCA-LISTINO                         
                              THRU EX-CERCA-LISTINO                     
                          MOVE 1 TO OK-NEG.                             
       EX-VERIF-NEG.                                                    
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> PAGE                                                             
      *>                                                                  
      *>                                                                  
       TRATTA-OLD-NEW.                                                  
      *>     DISPLAY "m".                                                
      *>     DISPLAY "hJ".                                              
      *>     PERFORM VARYING IR FROM 1 BY 1                               
      *>             UNTIL IR > SALTO                                     
              DISPLAY SPACE                                             
      *>     END-PERFORM.                                                 
      *>     DISPLAY "hJ".                                              
      *>     DISPLAY "&dB       Destinatario      &d@"                  
      *>                "&dB Vendita STOCK >>  &d@ "  D-CONTO-MEM.      
           DISPLAY D-CONTO-MEM.                                   
      *> MAG6/7*                                                          
      *>     DISPLAY " ".                                                 
           DISPLAY "dal mag " MAG-INPUT.                           
           MOVE 0 TO IND-CL TOT-BOLLA-C IND-CAPI-LETTI                  
                             IND-CAPI-NO-GIAC.                          
      *>                                                                  
           MOVE LOW-VALUE TO TABELLA-ARTICOLI-LETTI.                    
           INITIALIZE TABELLA-NO-GIAC.                                  
           MOVE SPACES TO COD-IN MEM-COD-IN.                            
      *>      DISPLAY " . fine lettura".                                  
      *>      DISPLAY " % annulla ultimo letto".                          
      *>      DISPLAY " S stampa rapportino".                             
      *> *    DISPLAY "l".                                               
      *>      PERFORM TRATTA-LEGGI THRU EX-TRATTA-LEGGI                   
      *>                UNTIL LETT-FINE OR                                
      *>                QT-NUM-ELEM-EFF OF PARTAB-ART = NUM-ELEM-MAX-ART
           PERFORM TRATTA-SITPF-3 THRU EX-TRATTA-SITPF-3.
      *>      
      *> *    DISPLAY "m".      
           DISPLAY " S stampa rapportino". 
           MOVE SPACES TO COD-IN.                                       
           ACCEPT COD-IN. 
           IF LETT-STAMPA                                               
             PERFORM STAMPA-RAPPORTINO THRU EX-STAMPA-RAPPORTINO        
             DISPLAY "   rapportino stampato".
       EX-TRATTA-OLD-NEW.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> PAGE                                                             
      *>                                                                  
      *>                                                                  
       LEGGI-IND.                                                       
           MOVE "CONTO;"  TO W-NOME-CAMPO.                              
           MOVE "INDIRIZ;" TO W-NOME-DATA-SET.                          
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           MOVE 5 TO W-MODO.                                            
           PERFORM TTDBGET THRU EX-TTDBGET.                             
           MOVE AREA-REC-SET TO REC-INDIRIZZI.                          
           IF NOT W-OK-IMAGE                                            
              DISPLAY "ERR INDIRIZZI" CONTO-IN-R                        
              PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
              PERFORM AZZERA-CAMPI-INDIRIZ THRU EX-AZZERA-CAMPI-INDIRIZ.
       EX-LEGGI-IND.                                                    
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       AZZERA-CAMPI-INDIRIZ.                                            
           MOVE SPACE TO D-AGG STATO OF REC-INDIRIZZI                   
                         SIGLA-PROV OF REC-INDIRIZZI (1)                
                         SIGLA-PROV OF REC-INDIRIZZI (2)                
                         INDIRIZZO OF REC-INDIRIZZI (1)                 
                         INDIRIZZO OF REC-INDIRIZZI (2)                 
                         STATO OF REC-INDIRIZZI.                        
           MOVE 0 TO CAP OF REC-INDIRIZZI (1)                           
                     CAP OF REC-INDIRIZZI (2)                           
      *> BUDA*                                                            
                     PRIORITA OF REC-INDIRIZZI                          
                     TELEFONO OF REC-INDIRIZZI.                         
      *> FIFRA*                                                           
           MOVE 0 TO TELEX OF REC-INDIRIZZI.                            
      *>                                                                  
       EX-AZZERA-CAMPI-INDIRIZ.                                         
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       MUOVI-IND.                                                       
           MOVE INDIRIZZO OF REC-INDIRIZZI (1) TO INDIRIZZO-STD.        
           MOVE 66 TO LL-STRINGA-IND.                                   
           MOVE 60 TO LL-SUBSTRINGA-IND.                                
           MOVE 1 TO FUNZIONE-IND.                                      
           CANCEL "QSTRINGV"
           CALL "QSTRINGV" USING PAR-INDIRIZZO                          
                                 INDIRIZZO-STD                          
                                 INDIRIZZO-COM.                         
           MOVE 2 TO FUNZIONE-IND.                                      
           CANCEL "QSTRINGV"
           CALL "QSTRINGV" USING PAR-INDIRIZZO                          
                                 INDIRIZZO-STD                          
                                 LOCALITA-COM.                          
           IF INDIRIZZO OF REC-INDIRIZZI (2) NOT = SPACE                
              MOVE INDIRIZZO OF REC-INDIRIZZI (2) TO INDIRIZZO-STD      
              MOVE 1 TO FUNZIONE-IND                                    
           CANCEL "QSTRINGV"
              CALL "QSTRINGV" USING PAR-INDIRIZZO                       
                                    INDIRIZZO-STD                       
                                    INDIRIZZO-C-COM                     
              MOVE 2 TO FUNZIONE-IND                                    
           CANCEL "QSTRINGV"
              CALL "QSTRINGV" USING PAR-INDIRIZZO                       
                                    INDIRIZZO-STD                       
                                    LOCALITA-C-COM.                     
       EX-MUOVI-IND.                                                    
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       MUOVI-CAP.                                                       
           MOVE D-AGG OF REC-INDIRIZZI TO D-CONTO-AGG-MEM.              
           MOVE STATO OF REC-INDIRIZZI TO STATO-COM.                    
           MOVE CAP OF REC-INDIRIZZI (1) TO CAP-COM.                    
           MOVE SIGLA-PROV OF REC-INDIRIZZI (1) TO PROV-COM.            
           IF INDIRIZZO OF REC-INDIRIZZI (2) NOT = SPACE                
              MOVE SIGLA-PROV OF REC-INDIRIZZI (2) TO PROV-C-COM        
              MOVE CAP OF REC-INDIRIZZI (2) TO CAP-C-COM.               
       EX-MUOVI-CAP.                                                    
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> BUDA*                                                            
      *>                                                                  
       CERCA-LISTINO.                                                   
           MOVE "CONTO;"  TO W-NOME-CAMPO.                              
           MOVE "CONFATT;" TO W-NOME-DATA-SET.                          
           MOVE CONTO-IN-R TO W-VALORE-CAMPO-W.                         
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           MOVE 5 TO W-MODO.                                            
           PERFORM TTDBGET THRU EX-TTDBGET.                             
           MOVE AREA-REC-SET TO REC-CONFATT.                            
           MOVE LISTINO OF REC-CONFATT TO LISTINO-MEM.                  
           MOVE DIVISA OF REC-CONFATT TO DIVISA-MEM.                    
       EX-CERCA-LISTINO.                                                
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> FIFRA*                                                           
       SCEGLI-CONTO-FATTURA.                                            
           IF TELEFONO OF REC-INDIRIZZI = 0                             
             MOVE 0 TO CONTO-FATTURA-MEM                                
           ELSE                                                         
             MOVE TELEX OF REC-INDIRIZZI TO CONTO-FATTURA-MEM.          
       EX-SCEGLI-CONTO-FATTURA.                                         
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *> PAGE  
      *> 
      *> 
       TRATTA-SITPF-3.
           MOVE "SITPF" TO W-NOME-DATA-SET.
           MOVE "MAG" TO W-NOME-CAMPO
           MOVE MAG-INPUT-R TO W-VALORE-CAMPO-HW
           PERFORM TTDBFIND THRU EX-TTDBFIND.
           IF W-OK-IMAGE
             MOVE 5 TO W-MODO
             PERFORM TTDBGET-S THRU EX-TTDBGET-S.
           PERFORM SELEZIONA-SITPF-3 
               THRU EX-SELEZIONA-SITPF-3
                  UNTIL NOT W-OK-IMAGE OR  
      *> MAXCA*
       
       
      *> UNICODDT*                                                        
      *>               (MAX-CAPI-INPUT-R <> 0 AND
      *>                    IND-CAPI-LETTI >= MAX-CAPI-INPUT-R) OR
       
      *>             FLAG QUANDO TUTTI I TAB-MAX-CAPI SONO STATI RAGGIUNTI
                   SW-MAX-CAPI-RAGGIUNTO = 1 OR 
      *> UNICODDT*                                                        
      *> 
                    QT-NUM-ELEM-EFF OF PARTAB-ART = NUM-ELEM-MAX-ART
                    OR  QT-NUM-ELEM-EFF OF PARTAB-SING = 
                         QT-NUM-ELEM-MAX OF PARTAB-SING.      
           IF QT-NUM-ELEM-EFF OF PARTAB-ART = NUM-ELEM-MAX-ART
             DISPLAY SPACE
             DISPLAY "TABELLA-ARTICOLI-LETTI "
             DISPLAY " da allargare"
           END-IF.
           IF QT-NUM-ELEM-EFF OF PARTAB-SING = 
                         QT-NUM-ELEM-MAX OF PARTAB-SING
             DISPLAY SPACE
             DISPLAY "TABELLA-SINGOLI "
             DISPLAY " da allargare"       
           END-IF                         
           MOVE  "." TO COD-IN-RID.
       EX-TRATTA-SITPF-3.
           EXIT.
      *> 
       CALCOLA-AS-CL.
             MOVE 0 TO SW-ERR-AS-CL.
             MOVE C-MAT-TRANS-RID TO W-VALORE-CAMPO                     
             MOVE "ANAMAT;" TO W-NOME-DATA-SET                          
             MOVE "C-MAT;" TO W-NOME-CAMPO                              
             MOVE 7 TO W-MODO                                           
             PERFORM TTDBGET THRU EX-TTDBGET                            
             IF NOT W-OK-IMAGE                                          
                DISPLAY "Inesist. " C-MAT-A-BARRE-RID                   
                PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                MOVE 1 TO SW-ERR-AS-CL
            ELSE
                MOVE ANNO OF REC-ANAMAT TO APP-A
                MOVE STAGIONE OF REC-ANAMAT TO APP-S
                MOVE APP-AS TO TAB-AS
                MOVE CL-GR OF REC-ANAMAT TO TAB-CL
                PERFORM LEGGI-TAB-UNICO-DDT THRU 
                     EX-LEGGI-TAB-UNICO-DDT
                IF QT-STATO OF PAR-TAB-UNICO-DDT NOT = 0
                    MOVE 1 TO SW-ERR-AS-CL.
                     
           MOVE "SITPF" TO W-NOME-DATA-SET
           MOVE 5 TO W-MODO.
       EX-CALCOLA-AS-CL. EXIT.
       
       
       
       
       SELEZIONA-SITPF-3.
         
      *>       DISPLAY "sono seleziona-sitpf-3"
      *>       display "return per proseguire".                           
      *>       accept pro.
       
           IF MAGAZZINO OF REC-SITPF NOT = MAG-INPUT-R
             PERFORM TTDBGET-S THRU EX-TTDBGET-S
             GO TO EX-SELEZIONA-SITPF-3.
      *> 
           MOVE C-MAT OF REC-SITPF
               TO C-MAT-TRANS-RID .
               
      *> UNICODDT*                                                        
           PERFORM CALCOLA-AS-CL THRU EX-CALCOLA-AS-CL
           IF ERR-AS-CL
                PERFORM TTDBGET-S THRU EX-TTDBGET-S
                GO TO EX-SELEZIONA-SITPF-3.
           
           IF XD = "S"
                DISPLAY "sono dopo calcola-as-cl " C-MAT-TRANS-RID
                display dep-tab-unico-ddt
      *>           display "return per proseguire"                        
      *>           accept pro
                .
             
           IF QT-STATO OF PAR-TAB-UNICO-DDT = 0
           AND TAB-MAX-CAPI <> 0  
           AND TAB-CAPI-LETTI >= TAB-MAX-CAPI
      *>          VALERIA - HO SUPERATO IL LIMITE DI AS CL
      *>          VERIFICO SE TUTTI I LIMITI SONO STATI SUPERATI     
                MOVE 1 TO SW-MAX-CAPI-RAGGIUNTO
                PERFORM VARYING I-APP FROM 1 BY 1 
                    UNTIL I-APP > QT-NUM-ELEM-EFF OF PAR-TAB-UNICO-DDT
                       OR SW-MAX-CAPI-RAGGIUNTO = 0
                          MOVE ELE-TAB-UNICO-DDT (I-APP)
                            TO DEP-TAB-UNICO-DDT
      *>                     display dep-tab-unico-ddt
                          IF TAB-MAX-CAPI > TAB-CAPI-LETTI
                          OR TAB-MAX-CAPI = 0
                              MOVE 0 TO SW-MAX-CAPI-RAGGIUNTO
                          END-IF
                END-PERFORM  
                
                IF XD = "S"    
                    DISPLAY "sono dopo calcolo max capi raggiunto = "
                     SW-MAX-CAPI-RAGGIUNTO
      *>               display "return per proseguire"                    
      *>               accept pro
                END-IF
           
                PERFORM TTDBGET-S THRU EX-TTDBGET-S
                GO TO EX-SELEZIONA-SITPF-3.
       
           MOVE APP-AS TO TAB-AS.
           MOVE CL-GR OF REC-ANAMAT TO TAB-CL.
           PERFORM LEGGI-TAB-UNICO-DDT THRU 
                EX-LEGGI-TAB-UNICO-DDT.         
      *> UNICODDT*                                                        
               
      *> UNICODDT*                                                        
      *>      IF CLASSE OF C-MAT-TRANSITO NOT = CLASSE-INPUT-R
      *>        PERFORM TTDBGET-S THRU EX-TTDBGET-S
      *>        GO TO EX-SELEZIONA-SITPF-3.
      *> UNICODDT*                                                        
      *> 
           IF SOCIETA-INPUT-R NOT = 0 AND
              SOCIETA-MOD OF C-MAT-TRANSITO 
                     NOT = SOCIETA-INPUT-R
             PERFORM TTDBGET-S THRU EX-TTDBGET-S
             GO TO EX-SELEZIONA-SITPF-3.
      *>                                                                  
           PERFORM VARYING IT FROM 1 BY 1
                   UNTIL IT > NTG-NTG
                   OR  QT-NUM-ELEM-EFF OF PARTAB-SING = 
                         QT-NUM-ELEM-MAX OF PARTAB-SING
                         
      *> MAXCA*
       
      *> UNICODDT*                                                        
      *>             OR (MAX-CAPI-INPUT-R <> 0 AND
      *>                   IND-CAPI-LETTI >= MAX-CAPI-INPUT-R) 
                   OR (TAB-MAX-CAPI <> 0 AND
                       TAB-CAPI-LETTI >= TAB-MAX-CAPI)
      *> UNICODDT*                                                        
      *>                          
              IF DISIMPEGNA = "SI"
                 MOVE QTA-GIAC-PF OF REC-SITPF(IT)
                   TO DA-TRASFERIRE
              ELSE
                 COMPUTE DA-TRASFERIRE =
                         QTA-GIAC-PF OF REC-SITPF(IT)
                         + QTA-IMP OF REC-SITPF(IT)
              END-IF
              PERFORM VARYING IC FROM 1 BY 1 
                       UNTIL IC > DA-TRASFERIRE
                       OR  QT-NUM-ELEM-EFF OF PARTAB-SING = 
                         QT-NUM-ELEM-MAX OF PARTAB-SING   
      *> MAXCA*
      *> UNICODDT*                                                        
      *>              OR (MAX-CAPI-INPUT-R <> 0 AND
      *>                    IND-CAPI-LETTI >= MAX-CAPI-INPUT-R) 
                   OR (TAB-MAX-CAPI <> 0 AND
                       TAB-CAPI-LETTI >= TAB-MAX-CAPI)
      *> UNICODDT*                                                        
      *>                          
                MOVE C-MAT OF REC-SITPF
                   TO C-MAT-TRANS-RID 
                MOVE MODELLO OF C-MAT-TRANSITO                          
                    TO MODELLO OF C-MAT-A-BARRE                         
                MOVE VEST-A      OF C-MAT-TRANSITO                      
                   TO VESTIBILITA OF C-MAT-A-BARRE                      
                MOVE PEZZO-A OF C-MAT-TRANSITO                          
                   TO PEZZO OF C-MAT-A-BARRE                            
                MOVE PROGR-ART OF C-MAT-TRANSITO                        
                   TO SOCIETA OF C-MAT-A-BARRE                          
                MOVE COLORE  OF C-MAT-TRANSITO                          
                   TO VARIANTE-COL OF C-MAT-A-BARRE
                MOVE FUNCTION tgxid(IT) 
                         TO TAGLIA OF C-MAT-A-BARRE
                MOVE IT TO NTG-MEM
      *>           MOVE IT TO TAGLIA OF C-MAT-A-BARRE
                PERFORM TRATTA-LEGGI THRU EX-TRATTA-LEGGI
              END-PERFORM
           END-PERFORM.
      *> 
           MOVE "SITPF" TO W-NOME-DATA-SET
           MOVE 5 TO W-MODO
           PERFORM TTDBGET-S THRU EX-TTDBGET-S.
       EX-SELEZIONA-SITPF-3.
           EXIT.
      *>                                                                  
      *>                                                                  
       TRATTA-LEGGI. 
            IF XD = "S"    
                DISPLAY "sono in tratta-leggi "
                display dep-tab-unico-ddt
      *>           display "return per proseguire"                        
      *>           accept pro
                .
           
                                                       
      *>      MOVE SPACES TO COD-IN.                                      
      *>      ACCEPT COD-IN.                                              
      *>      IF LETT-FINE                                                
      *>         GO TO EX-TRATTA-LEGGI.                                   
      *>      IF LETT-ANN-ULT                                             
      *>        PERFORM ANNULLA-PRECEDENTE THRU EX-ANNULLA-PRECEDENTE     
      *>        MOVE SPACES TO MEM-COD-IN                                 
      *>        GO TO EX-TRATTA-LEGGI.                                    
      *>      IF LETT-STAMPA                                              
      *>        PERFORM STAMPA-RAPPORTINO THRU EX-STAMPA-RAPPORTINO       
      *>        DISPLAY "   rapportino stampato"                          
      *>        GO TO EX-TRATTA-LEGGI.                                    
      *> *                                                                
      *>      IF C-MAT-A-BARRE-RID NOT NUMERIC                            
      *>         DISPLAY "COD non num >> RILEGGERE"                       
      *>         PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
      *>         GO TO EX-TRATTA-LEGGI.                                   
      *>      IF VARIANTE-COL OF C-MAT-A-BARRE = 0                        
      *>         DISPLAY "VARIANTE 0 >> RILEGGERE"                        
      *>         PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
      *>         GO TO EX-TRATTA-LEGGI.
       
           MOVE SPACES TO MEM-COD-IN.                                   
           MOVE SOCIETA OF C-MAT-A-BARRE TO SOC-COM.                    
           MOVE 0 TO PRE-SOC.                                           
           MOVE SOC-COM TO SOCIETA OF C-MAT-A-BARRE.                    
           COMPUTE ELEM-ART = C-MAT-A-BARRE-RID / 10
           MOVE "K2" TO QT-FUNZIONE OF PARTAB-ART.                      
           CANCEL "QTABEL"
           CALL "QTABEL" USING PARTAB-ART TABELLA-ARTICOLI-LETTI        
                               ELEM-ART.                                
      *>      IF TAGLIA OF C-MAT-A-BARRE = 0                              
      *>            OR = 9                                                
      *>       DISPLAY "TAGLIE da  1  a  8"                               
      *>         PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
      *>         GO TO EX-TRATTA-LEGGI.                                   
      *>     IF QT-STATO OF PARTAB-ART NOT = 0                            
             MOVE 0 TO C-MAT-TRANS-RID                                  
             MOVE MODELLO OF C-MAT-A-BARRE TO MODELLO OF                
                               C-MAT-TRANSITO                           
             MOVE VESTIBILITA OF C-MAT-A-BARRE TO                       
                    VEST-A OF C-MAT-TRANSITO                            
             MOVE SOCIETA OF C-MAT-A-BARRE TO                           
                            PROGR-ART OF C-MAT-TRANSITO                 
             MOVE PEZZO OF C-MAT-A-BARRE TO PEZZO-A OF                  
                               C-MAT-TRANSITO                           
             MOVE VARIANTE-COL OF C-MAT-A-BARRE TO COLORE OF            
                               C-MAT-TRANSITO.                          
           IF QT-STATO OF PARTAB-ART NOT = 0                            
             MOVE C-MAT-TRANS-RID TO W-VALORE-CAMPO                     
             MOVE "ANAMAT;" TO W-NOME-DATA-SET                          
             MOVE "C-MAT;" TO W-NOME-CAMPO                              
             MOVE 7 TO W-MODO                                           
             PERFORM TTDBGET THRU EX-TTDBGET                            
             IF NOT W-OK-IMAGE                                          
                DISPLAY "Inesist. " C-MAT-A-BARRE-RID                   
                PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                GO TO EX-TRATTA-LEGGI.
      *> ASZERO*
      *>      IF (A-INPUT-R NOT = 0 AND 
      *>          A-INPUT-R NOT = ANNO OF REC-ANAMAT) OR
      *>         (S-INPUT-R NOT = 0 AND
      *>          S-INPUT-R NOT = STAGIONE OF REC-ANAMAT)
       
      *> UNICODDT*                                                        
      *>   QUESTO TEST NON SERVE PIU' PERCHE' GIA' FILTRATO 
      *>      IF NOT TUTTI-AS AND (
      *>         (A-INPUT-R NOT = ANNO OF REC-ANAMAT) OR
      *>         (S-INPUT-R NOT = STAGIONE OF REC-ANAMAT) )
      *>        GO TO EX-TRATTA-LEGGI.
      *> UNICODDT*                                                        
       
      *> BARBARELLA 260516    
      *> NO FORN = 4 PER AI 05*
      *>      IF QT-STATO OF PARTAB-ART NOT = 0
      *>         IF SOCIETA OF C-MAT-A-BARRE = 4
      *>         AND ANNO OF REC-ANAMAT = 5 AND
      *>         STAGIONE OF REC-ANAMAT = 4
      *>            DISPLAY "FORNITORE 4 NON AMMESSO PER AI 05"
      *>            PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
      *>            GO TO EX-TRATTA-LEGGI.
       
           IF QT-STATO OF PARTAB-ART NOT = 0                            
             MOVE D-MAT OF REC-ANAMAT TO D-MAT-MEM                      
      *> BUDA*                                                            
             MOVE PRIMA-TG OF REC-ANAMAT TO PTG-MEM                     
             MOVE VALID-REC OF REC-ANAMAT TO VAL-REC-MEM   
      *> VACO*                                                            
             MOVE COSTO OF REC-ANAMAT  TO COSTO-MEM
      *> VACO*                                                            
      *> ASOLOB2C*                                                        
             MOVE C-MAT OF REC-ANAMAT TO ANACST-C-MAT-COM
             MOVE MAG-INPUT-R TO ANACST-MAG-COM
      *>  NO-DATGE                                                        
      *>        PERFORM S-SET-1 THRU S-SET-1-EX 
      *>  NO-DATGE                                                        
             PERFORM RIVALUTA-COSTO-ANAMAT
                 THRU EX-RIVALUTA-COSTO-ANAMAT
             IF ANACST-CST-COM NOT = 0
               MOVE ANACST-CST-COM TO COSTO-MEM
             END-IF 
      *>  NO-DATGE                                                        
      *>        PERFORM S-SET-2 THRU S-SET-2-EX 
      *>  NO-DATGE                                                        
       
      *> ASOLOB2C*                                                        
      *>        MOVE "SITPF;" TO W-NOME-DATA-SET                          
      *>        MOVE "C-MAT;" TO W-NOME-CAMPO                             
      *>        MOVE C-MAT-TRANS-RID TO W-VALORE-CAMPO                    
      *>        PERFORM TTDBFIND THRU EX-TTDBFIND                         
      *>        IF W-OK-IMAGE                                             
      *>           MOVE 5 TO W-MODO                                       
      *>           PERFORM TTDBGET-S THRU EX-TTDBGET-S                    
      *>           PERFORM TTDBGET-S THRU EX-TTDBGET-S                    
      *>                    UNTIL NOT W-OK-IMAGE OR                       
      *> *MAG6/7*                                                         
      *> *                     MAGAZZINO OF REC-SITPF = 7                 
      *>                       MAGAZZINO OF REC-SITPF = MAG-INPUT-R       
      *>        END-IF                                                    
      *>        IF NOT W-OK-IMAGE                                         
      *>           DISPLAY "Manca Sit  "                                  
      *>                        C-MAT-A-BARRE-RID                         
      *>           PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
      *>           GO TO EX-TRATTA-LEGGI.                                 
      *> NOPRZ*                                                           
           MOVE SPACE TO RISP-NO-GIAC RISP-NO-PREZZO.                   
      *>                                                                  
      *> BUDA*                                                            
           MOVE 0 TO PREZZO-MEM.                                        
           IF QT-STATO OF PARTAB-ART NOT = 0                            
      *> ACQUO*
      *>            AND (SI-DT-ESTERO OR                                  
      *>           (FLAG-ANACON NOT = '0' AND NOT = ' ') OR               
      *>           PRIORITA OF REC-INDIRIZZI = 4 )                        
                 AND PRIORITA OF REC-INDIRIZZI = 4
      *> 
             PERFORM CERCA-PREZZO-V THRU EX-CERCA-PREZZO-V              
             IF NOT W-OK-IMAGE OR PREZZO-MEM = 0                        
                DISPLAY "Manca prezzo al pubblico "                     
                DISPLAY "    " C-MAT-A-BARRE-RID                        
                PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                GO TO EX-TRATTA-LEGGI.                                  
      *>                                                                  
           IF QT-STATO OF PARTAB-ART NOT = 0                            
      *> NOPRZ*                                                           
             MOVE 0 TO PREZZO-MEM PREZZO-ANAMAT                         
      *> PRODI*                                                           
             MOVE 0 TO CAMBIO-MEM                                       
      *>                                                                  
             PERFORM CERCA-PREZZO THRU EX-CERCA-PREZZO                  
      *> NOPRZ*                                                           
      *> PRZANABU*                                                        
      *>       IF PREZZO-MEM = 0 OR PREZZO-MEM = PREZZO-ANAMAT            
             IF PREZZO-MEM = 0                                          
               OR ( PREZZO-MEM = PREZZO-ANAMAT AND                      
                         NOT SI-DT-ESTERO )                             
      *> 
      *>           DISPLAY "Prz vend a CLI 0 o senza sconto"              
      *>           DISPLAY "   " C-MAT-A-BARRE-RID                        
      *> NOPRZ*                                                           
                MOVE 0 TO OK-PREZZO                                     
                PERFORM TRATTA-NO-PREZZO THRU EX-TRATTA-NO-PREZZO       
                     UNTIL PREZZO-OK                                    
                IF RISP-NO-PREZZO NOT = "S"                             
                  GO TO EX-TRATTA-LEGGI                                 
                END-IF
      *> sempre0*
                if prezzo-mem not = 0
                  move 0 to prezzo-mem
                end-if
      *> 
             END-IF                                                     
           ELSE                                                         
      *> PRODI*                                                           
             MOVE CAMBIO-TAB(QT-INDEX-ELEM OF PARTAB-ART)               
                 TO CAMBIO-MEM                                          
      *>                                                                  
             MOVE D-MAT-TAB(QT-INDEX-ELEM OF PARTAB-ART)                
                 TO D-MAT-MEM                                           
             MOVE PREZZO-TAB(QT-INDEX-ELEM OF PARTAB-ART)               
                 TO PREZZO-MEM.                                         
      *>     IF PREZZO-MEM = 0                                            
      *>          DISPLAY "Manca prz vend a CLI "                         
      *>          DISPLAY "   " C-MAT-A-BARRE-RID                         
      *> NOPRZ*                                                           
      *>          MOVE 0 TO OK-PREZZO                                     
      *>          PERFORM TRATTA-NO-PREZZO THRU EX-TRATTA-NO-PREZZO       
      *>               UNTIL PREZZO-OK                                    
      *>          IF RISP-NO-PREZZO NOT = "S"                             
      *>                                                                  
      *>            GO TO EX-TRATTA-LEGGI.                                
      *>                                                                  
           IF QT-STATO OF PARTAB-ART NOT = 0                            
             COMPUTE ELEM-ART = C-MAT-A-BARRE-RID / 10                  
             MOVE D-MAT-MEM TO D-MAT-ELEM                               
      *> BUDA*                                                            
             MOVE PTG-MEM TO PRIMA-TG-ELEM                              
             MOVE PREZZO-MEM TO PREZZO-ELEM    
      *> VACO*                                                            
             MOVE COSTO-MEM TO COSTO-ELEM
      *> VACO*                                                            
      *> PRODI*                                                           
      *>       MOVE STK-CAMBIO TO CAMBIO-ELEM                             
             MOVE CAMBIO-MEM TO CAMBIO-ELEM                             
             MOVE VAL-REC-MEM TO TIPO-ANA-ELEM                          
             MOVE LOW-VALUE TO QTA-TAGLIE-ELEM                          
             MOVE QTA-GIAC OF REC-SITPF TO QTA-GIAC-ELEM                
           ELSE                                                         
             MOVE ART-TAB-LETTI(QT-INDEX-ELEM OF PARTAB-ART)            
                         TO ART-ELEM-LETTI                              
             MOVE D-MAT-ELEM TO D-MAT-MEM                               
             MOVE PRIMA-TG-ELEM TO PTG-MEM.                             
           COMPUTE PREZZO-D = PREZZO-MEM / 100.                         
           ADD 1 TO QTA-TAGLIA-ELEM(NTG-MEM).                   
           IF QTA-GIAC-PF-ELEM(NTG-MEM) <                       
                   QTA-TAGLIA-ELEM(NTG-MEM)                     
                 DISPLAY "Manca giac "                                  
                   C-MAT-A-BARRE-RID                                    
              MOVE 0 TO OK-GIAC                                         
              PERFORM TRATTA-NO-GIAC THRU EX-TRATTA-NO-GIAC             
                     UNTIL GIAC-OK                                      
      *> NOPRZ*                                                           
              IF RISP-NO-GIAC NOT = "S"                                 
      *>                                                                  
                 GO TO EX-TRATTA-LEGGI.                                 
      *> NOPRZ1*                                                          
      *>     IF RISP-NO-GIAC = "S" OR RISP-NO-PREZZO = "S"                
           IF RISP-NO-GIAC = "S"                                        
      *> PRZBU*                                                           
            OR ( RISP-NO-PREZZO = "S" AND SI-DT-ESTERO )                
      *>                                                                  
             PERFORM INSERISCI-NO-GIAC-PREZZO                           
                 THRU EX-INSERISCI-NO-GIAC-PREZZO                       
             GO TO EX-TRATTA-LEGGI.                                     
      *>                                                                  
      *>                                                                  
           ADD 1 TO IND-CAPI-LETTI.                                     
           ADD PREZZO-MEM TO PREZZO-TOT.                                
           MOVE IND-CAPI-LETTI TO CONT-D.                               
           DISPLAY CONT-D.
       
      *> UNICODDT*                                                        
           ADD 1 TO TAB-CAPI-LETTI.
           IF XD = "S"
                DISPLAY "sono in add 1 to ind-capi-letti "
                display dep-tab-unico-ddt
      *>           display "return per proseguire"                        
      *>           accept pro
                .
      *> UNICODDT*                                                        
       
      *> EURO*                                                            
      *> EURO1*                                                           
           IF W-FORMATO-INTERNO NOT > 011231                            
             MOVE PREZZO-MEM TO IE-IMPORTO-IN                           
             PERFORM PRZ-INLIT THRU EX-PRZ-INLIT                        
             COMPUTE PREZZO-D = IE-IMPORTO-OU / 100                     
           ELSE                                                         
             COMPUTE PREZZO-D = PREZZO-MEM / 100.                       
      *>                                                                  
      *>                                                                  
      *>      CALL "FAIBEEP".
             DISPLAY CONT-D " "
                        D-MAT-ELEM SPACE PREZZO-D. 
       
       
      *> UNICODDT*                                                        
           PERFORM RIMETTI-DEP-TAB-UNICO-DDT THRU
                EX-RIMETTI-DEP-TAB-UNICO-DDT.
       
           IF XD = "S"
               DISPLAY "sono in tratta-leggi DOPO RIMETTI-DEP-TAB"
               DISPLAY "AS=" TAB-AS " CL=" TAB-CL  
                   " MAX-CAPI=" TAB-MAX-CAPI 
                   " CAPI-LETTI=" TAB-CAPI-LETTI
      *>           DISPLAY ELE-TAB-UNICO-DDT(1)
      *>           DISPLAY ELE-TAB-UNICO-DDT(2)
      *>           DISPLAY ELE-TAB-UNICO-DDT(3)
      *>           DISPLAY ELE-TAB-UNICO-DDT(4)
      *>           DISPLAY ELE-TAB-UNICO-DDT(5)
      *>           display "return per proseguire"                        
      *>           accept pro
                .
      *> UNICODDT*                                                        
       
       
                           
      *> EURO*                                                            
      *> EURO1*                                                           
           IF W-FORMATO-INTERNO NOT > 011231                            
             MOVE PREZZO-TOT TO IE-IMPORTO-IN                           
             PERFORM PRZ-INLIT THRU EX-PRZ-INLIT                        
             COMPUTE PREZZO-TOT-D = IE-IMPORTO-OU / 100                 
      *>        DISPLAY "  Tot. L." PREZZO-TOT-D                          
           ELSE                                                         
             COMPUTE PREZZO-TOT-D = PREZZO-TOT / 100                    
      *>        DISPLAY " Tot. Eur." PREZZO-TOT-D
           END-IF
      *>                                                                  
           PERFORM INSERT-ELEM-SING THRU EX-INSERT-ELEM-SING.           
           IF QT-STATO OF PARTAB-ART = 0                                
             MOVE ART-ELEM-LETTI                                        
                TO ART-TAB-LETTI(QT-INDEX-ELEM OF PARTAB-ART)           
           ELSE                                                         
             MOVE "K1" TO QT-FUNZIONE OF PARTAB-ART                     
           CANCEL "QTABEL"
             CALL "QTABEL" USING PARTAB-ART TABELLA-ARTICOLI-LETTI      
                                 ART-ELEM-LETTI                         
             IF QT-STATO OF PARTAB-ART NOT = 0                          
               MOVE QT-STATO OF PARTAB-ART TO ERR-DISP                  
               DISPLAY "ERR INSERIM QTABEL " ERR-DISP                   
                     " - TRATTA-LEGGI"                                  
           CANCEL "QDBERROR"
               CALL "QDBERROR" USING W-COMMON.                          
           MOVE COD-IN TO MEM-COD-IN.                                   
       EX-TRATTA-LEGGI.                                                 
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> NOPRZ*                                                           
       INSERISCI-NO-GIAC-PREZZO.                                        
           ADD 1 TO IND-CAPI-NO-GIAC.                                   
           IF RISP-NO-GIAC = "S"                                        
             DISPLAY "INSERITO Manca GIAC."                             
      *> PRZBU*                                                           
             MOVE "MancaGIAC" TO CAUSALE-NO-GIAC (IND-CAPI-NO-GIAC).    
      *>                                                                  
      *> NOPRZ1*                                                          
      *> PRZBU*                                                           
           IF ( RISP-NO-PREZZO = "S" AND SI-DT-ESTERO )                 
             DISPLAY "INS. Manca PREZZO x ESTERO"                       
             MOVE "MancaPRZ" TO CAUSALE-NO-PRZ (IND-CAPI-NO-GIAC).      
      *>                                                                  
           MOVE C-MAT-A-BARRE-RID TO                                    
                    C-MAT-NO-GIAC (IND-CAPI-NO-GIAC).                   
           MOVE D-MAT-MEM TO D-MAT-NO-GIAC (IND-CAPI-NO-GIAC).          
           MOVE PREZZO-MEM TO PREZZO-NO-GIAC (IND-CAPI-NO-GIAC).        
       EX-INSERISCI-NO-GIAC-PREZZO.                                     
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       TTDBGET-S.                                                       
                     
      *>                                                                  
      *>                                                                  
       TTDBGET.                                                         
      *>      ===PREPROCESSOR==>COPY PDBGET START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           CALL "DBGET" USING W-NOME-DATA-BASE-1                        
                              W-NOME-DATA-SET                           
                              W-MODO                                    
                              W-CA-IMAGE                                
                              W-TUTTO-RECORD                            
                              AREA-REC-SET                              
                              W-VALORE-CAMPO.                           
           IF W-ERRORI-TRAGICI                                          
              MOVE 4 TO W-INDICE-8                                      
              CALL "QDBERROR" USING W-COMMON.                           
       EX-TTDBGET.                                                      
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDBGET END

                                                 
      *>                                                                  
      *>                                                                  
       TRATTA-NO-GIAC.                                                  
           PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM.
           MOVE SPACE TO RISP-NO-GIAC.                                  
           DISPLAY "     " D-MAT-ELEM SPACE PREZZO-D.                   
           DISPLAY "CONFERMI MANCA GIAC ? (S/N)".                       
      *>      ACCEPT RISP-NO-GIAC.
           MOVE "N" TO RISP-NO-GIAC
           DISPLAY RISP-NO-GIAC
      *> 
           IF RISP-NO-GIAC NOT = "S" AND NOT = "N"                      
              GO TO EX-TRATTA-NO-GIAC.                                  
           MOVE 1 TO OK-GIAC.                                           
      *> NOPRZ*                                                           
      *>     IF RISP-NO-GIAC NOT = "S"                                    
      *>        NEXT SENTENCE                                             
      *>       ELSE                                                       
      *>          DISPLAY "INSERITO Manca GIAC."
      *>          ADD 1 TO IND-CAPI-NO-GIAC                               
      *>          MOVE C-MAT-A-BARRE-RID TO                               
      *>                   C-MAT-NO-GIAC (IND-CAPI-NO-GIAC)               
      *>          MOVE D-MAT-MEM TO D-MAT-NO-GIAC (IND-CAPI-NO-GIAC)      
      *>          MOVE PREZZO-MEM TO PREZZO-NO-GIAC (IND-CAPI-NO-GIAC).   
       EX-TRATTA-NO-GIAC.                                               
           EXIT.                                                        
      *>                                                                  
      *> NOPRZ*                                                           
       TRATTA-NO-PREZZO.                                                
      *>      PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM.
           MOVE SPACE TO RISP-NO-PREZZO.                                
      *> NODMAT*                                                          
      *> *    DISPLAY "     " D-MAT-ELEM.                                 
      *>      DISPLAY "     " D-MAT-MEM.                                  
      *>      DISPLAY "CONFERMI MANCA PREZZO ? (S/N)".                    
      *>      ACCEPT RISP-NO-PREZZO.
           MOVE "S" TO RISP-NO-PREZZO.
      *>      DISPLAY RISP-NO-PREZZO
      *> 
           IF RISP-NO-PREZZO NOT = "S" AND NOT = "N"                    
              GO TO EX-TRATTA-NO-PREZZO.                                
           MOVE 1 TO OK-PREZZO.                                         
       EX-TRATTA-NO-PREZZO.                                             
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       TTDBFIND.                                                        
      *>      ===PREPROCESSOR==>COPY PDBFIND START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           MOVE 1 TO W-MODO.                                            
           CALL "DBFIND" USING W-NOME-DATA-BASE-1                       
                               W-NOME-DATA-SET                          
                               W-MODO                                   
                               W-CA-IMAGE                               
                               W-NOME-CAMPO                             
                               W-VALORE-CAMPO.                          
           IF W-ERRORI-TRAGICI                                          
              MOVE 3 TO W-INDICE-8                                      
              CALL "QDBERROR" USING W-COMMON.                           
       EX-TTDBFIND.                                                     
           EXIT.                                                        
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDBFIND END

                                                
      *>                                                                  
       INSERT-ELEM-SING.                                                
           MOVE "K1" TO QT-FUNZIONE OF PARTAB-SING.                     
      *> UNICODDT*                                                        
           MOVE IND-CAPI-LETTI TO CONT-SING.    
      *>      MOVE TAB-CAPI-LETTI TO CONT-SING.                           
      *> UNICODDT*                                                        
           MOVE C-MAT-A-BARRE-RID TO C-MAT-SING.                        
           MOVE D-MAT-MEM TO D-MAT-SING.                                
           MOVE PTG-MEM TO PRIMA-TG-SING.                               
           MOVE PREZZO-MEM TO PREZZO-SING.  
      *> MOVSKU
           MOVE SPACES TO SKU-SING.                                     
           CANCEL "QTABEL"
           CALL "QTABEL" USING PARTAB-SING                              
                                 TABELLA-SINGOLI                        
                                    ELEMENTO-SINGOLI.                   
      *>      IF QT-STATO OF PARTAB-SING NOT = 0                          
      *>         MOVE QT-STATO OF PARTAB-SING TO ERR-DISP                 
      *>         DISPLAY "ERR QTABEL SING  " ERR-DISP                     
      *>         DISPLAY "INSERIMENTO "                                   
      *>         DISPLAY "PER ELEMENTO     " C-MAT-A-BARRE-RID            
      *>      CANCEL "QDBERROR"
      *>         CALL "QDBERROR" USING W-COMMON.                          
       EX-INSERT-ELEM-SING.                                             
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>  ANNULLA-PRECEDENTE.                                             
      *>      IF MEM-COD-IN = SPACES                                      
      *>        DISPLAY "nulla da annullare"                              
      *>        GO TO EX-ANNULLA-PRECEDENTE.                              
      *>      MOVE MEM-COD-IN TO COD-IN.                                  
      *>      COMPUTE ELEM-ART = C-MAT-A-BARRE-RID / 10                   
      *>      MOVE "K2" TO QT-FUNZIONE OF PARTAB-ART.                     
      *>      CANCEL "QTABEL"
      *>      CALL "QTABEL" USING PARTAB-ART TABELLA-ARTICOLI-LETTI       
      *>                          ELEM-ART.                               
      *>      IF QT-STATO OF PARTAB-ART NOT = 0                           
      *>        MOVE QT-STATO OF PARTAB-ART TO ERR-DISP                   
      *>          DISPLAY "ERR RILETTURA QTABEL " ERR-DISP                
      *>                " - ANNULLA-PRECEDENTE"                           
      *>      CANCEL "QDBERROR"
      *>          CALL "QDBERROR" USING W-COMMON.                         
      *>      SUBTRACT PREZZO-TAB(QT-INDEX-ELEM OF PARTAB-ART)            
      *>               FROM PREZZO-TOT.                                   
      *>      PERFORM DELETE-ELEM-SING THRU EX-DELETE-ELEM-SING.          
      *>      SUBTRACT 1 FROM QTA-TAGLIA-TAB(QT-INDEX-ELEM OF PARTAB-ART, 
      *>                  TAGLIA OF C-MAT-A-BARRE) IND-CAPI-LETTI.        
      *>      MOVE QTA-TAGLIA-TAB(QT-INDEX-ELEM OF PARTAB-ART,            
      *>                  TAGLIA OF C-MAT-A-BARRE) TO DISP-4.             
      *>      DISPLAY "annullata 1 lettura "                              
      *>      DISPLAY "ancora " DISP-4                                    
      *>                   C-MAT-A-BARRE-RID.                             
      *> *EURO1*                                                          
      *>      IF W-FORMATO-INTERNO NOT > 011231                           
      *>        MOVE PREZZO-TOT TO IE-IMPORTO-IN                          
      *>        PERFORM PRZ-INLIT THRU EX-PRZ-INLIT                       
      *>        COMPUTE PREZZO-TOT-D = IE-IMPORTO-OU / 100                
      *>        DISPLAY "  Tot. L." PREZZO-TOT-D                          
      *>      ELSE                                                        
      *>        COMPUTE PREZZO-TOT-D = PREZZO-TOT / 100                   
      *>        DISPLAY " Tot. Eur." PREZZO-TOT-D.                        
      *> *                                                                
      *>  EX-ANNULLA-PRECEDENTE.                                          
      *>      EXIT.                                                       
      *>                                                                  
      *> EURO1*                                                           
       PRZ-INLIT.                                                       
      *>      ===PREPROCESSOR==>COPY PDAEU START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
             CALL "QDAEURO" USING        PAR-INEU                       
             IF IE-ERRORE                                               
               DISPLAY IE-MSG UPON CONSOLE                              
             END-IF.                                                    
      *>                                            ********************* 
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDAEU END

                                                  
       EX-PRZ-INLIT.                                                    
           EXIT.                                                        
      *>                                                                  
       DELETE-ELEM-SING.                                                
           MOVE "K3" TO QT-FUNZIONE OF PARTAB-SING.                     
           MOVE IND-CAPI-LETTI TO CONT-SING.                            
           MOVE C-MAT-A-BARRE-RID TO C-MAT-SING.                        
           CANCEL "QTABEL"
           CALL "QTABEL" USING PARTAB-SING                              
                                 TABELLA-SINGOLI                        
                                    ELEMENTO-SINGOLI.                   
           IF QT-STATO OF PARTAB-SING NOT = 0                           
              MOVE QT-STATO OF PARTAB-SING TO ERR-DISP                  
              DISPLAY "ERR QTABEL SING  " ERR-DISP                      
              DISPLAY "ANNULLO PREC"                                    
              DISPLAY "PER ELEMENTO     " C-MAT-A-BARRE-RID             
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON.                           
       EX-DELETE-ELEM-SING.                                             
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> PAGE                                                             
      *>                                                                  
       TRATTA-LETTI.                                                    
      *>     DISPLAY "hJ".                                              
      *>        PERFORM VARYING IR FROM 1 BY 1                            
      *>             UNTIL IR > SALTO                                     
              DISPLAY SPACE                                             
      *>        END-PERFORM     
       
      *>                                                                  
                                                  
           MOVE IND-CAPI-LETTI TO TOT-CAPI-LETTI-1.                     
           DISPLAY "- Tot CAPI - " TOT-CAPI-LETTI-1.                    
           MOVE IND-CAPI-NO-GIAC TO TOT-CAPI-NO-GIAC.                   
      *> NOPRZ*                                                           
           DISPLAY "- No GIAC./PREZZO - " TOT-CAPI-NO-GIAC.             
      *>                                                                  
           DISPLAY " ".                                                 
           DISPLAY "Vuoi STORNARE "                                     
               "(SI-NO)".                                               
           MOVE SPACES TO CONFERMA-STORNO.                              
           ACCEPT CONFERMA-STORNO.                                      
           IF (CONFERMA-STORNO = "SI" OR = "si") AND                    
                     TOT-CAPI-LETTI-1 NOT = 0                           
      *>        DISPLAY "hJ"                                            
      *>        PERFORM VARYING IR FROM 1 BY 1                            
      *>             UNTIL IR > SALTO                                     
              DISPLAY SPACE                                             
      *>        END-PERFORM                                               
              DISPLAY    "Dammi il CODICE"                              
              MOVE SPACES TO COD-IN MEM-COD-IN                          
              DISPLAY " . fine lettura"                                 
              DISPLAY " @ storno totale"                                
      *>        DISPLAY "l"                                              
      *>         MOVE 3 TO QT-ADDR-KEY OF PARTAB-SING
              MOVE 1 TO QT-ADDR-KEY OF PARTAB-SING
      *> 
              MOVE 8 TO QT-LL-KEY OF PARTAB-SING                        
           CANCEL "QSORTAB"
              CALL "QSORTAB" USING PARTAB-SING TABELLA-SINGOLI          
              PERFORM TRATTA-STORNO THRU EX-TRATTA-STORNO               
                     UNTIL LETT-FINE.                                   
      *>        DISPLAY "m".                                             
           IF IND-CAPI-LETTI NOT < 1                                    
              MOVE 5 TO W-MODO                                          
              PERFORM TTLOCK-T THRU EX-TTLOCK-T 
       
      *> volante*
      *>        if CONTO-IN-R = 10010261
      *>          perform leggi-paramdt-fittizi
      *>                  thru ex-leggi-paramdt-fittizi
      *>          perform agg-dparam-fittizi
      *>                  thru ex-agg-dparam-fittizi
      *>          move 61222 to AA-MM-GG-DDT 
      *>        else
                PERFORM LEGGI-PARAMDT THRU EX-LEGGI-PARAMDT             
                PERFORM AGG-DPARAM THRU EX-AGG-DPARAM
                MOVE W-FORMATO-INTERNO TO AA-MM-GG-DDT
      *>        end-if
      *> 
      *>        DISPLAY "hJ"                                            
      *>        DISPLAY "BBBBBBB"                                  
              DISPLAY "Aggiorno  "                                      
              DISPLAY "BOLLA n.  " NUMERO-DDT   
      *> 
              IF QT-NUM-ELEM-EFF OF PARTAB-SING > 0 
      *>  NO-DATGE                                                        
      *>           PERFORM S-SET-1 THRU S-SET-1-EX
      *>  NO-DATGE                                                        
                PERFORM INSERISCI-MOVSKU THRU INSERISCI-MOVSKU-EX 
                         VARYING IND-BARUNI FROM 1 BY 1 
                               UNTIL IND-BARUNI > 
                                       QT-NUM-ELEM-EFF OF PARTAB-SING   
                PERFORM S-S-COMMIT THRU S-S-COMMIT-EX
      *>  NO-DATGE                                                        
      *>           PERFORM S-SET-2 THRU S-SET-2-EX                        
      *>  NO-DATGE                                                        
       
              END-IF                              
      *> BUDA*                                                            
              IF PRIORITA OF REC-INDIRIZZI = 4                          
      *> conv*
                MOVE SPACE               TO DIR-VAR-VALUE
                MOVE "RETIS_DIRECTORY"   TO DIR-VAR-NAME
                DISPLAY DIR-VAR-NAME UPON ENVIRONMENT-NAME
                ACCEPT DIR-VAR-VALUE FROM ENVIRONMENT-VALUE
      *> 
                MOVE SPACE               TO USER-VAR-VALUE
                MOVE "RETIS_UTENTE"      TO USER-VAR-NAME
                DISPLAY USER-VAR-NAME UPON ENVIRONMENT-NAME
                ACCEPT USER-VAR-VALUE FROM ENVIRONMENT-VALUE
      *> 
                MOVE "dd_BARCNEG"        TO FILE-VAR-NAME
                MOVE SPACES              TO FILE-VAR-VALUE
      *> movsku
      *>           STRING DIR-VAR-VALUE DELIMITED BY SPACE
                STRING 
                     USER-VAR-VALUE DELIMITED BY SPACE
      *>               "_BARCNEG" DELIMITED BY SIZE
                     "_BC" DELIMITED BY SIZE
                     "_" AA-MM-GG-DDT NUMERO-DDT
                     "_" MAG-INPUT-R "_" NEG-IN 
                     "_B"
                                DELIMITED BY SIZE
      *> movsku*                                                          
                        INTO FILE-VAR-VALUE
                DISPLAY FILE-VAR-NAME  UPON ENVIRONMENT-NAME
                DISPLAY FILE-VAR-VALUE UPON ENVIRONMENT-VALUE
      *> conv-end*
                OPEN OUTPUT FILE-BC                                     
              END-IF                                                    
              PERFORM SCRIVI-RECORD THRU EX-SCRIVI-RECORD               
                  VARYING W-INDICE-3 FROM 1 BY 1                        
                     UNTIL W-INDICE-3 > QT-NUM-ELEM-EFF OF PARTAB-ART   
      *> BUDA*                                                            
              MOVE 1 TO QT-ADDR-KEY OF PARTAB-SING                      
              MOVE 10 TO QT-LL-KEY OF PARTAB-SING                       
           CANCEL "QSORTAB"
              CALL "QSORTAB" USING PARTAB-SING                          
                                      TABELLA-SINGOLI                   
              IF PRIORITA OF REC-INDIRIZZI = 4   
      *> MOVSKU
                 PERFORM INTESTA-FILE-BC THRU EX-INTESTA-FILE-BC      
      *> MOVSKU                               
                 PERFORM SCORRI-TAB-SING THRU EX-SCORRI-TAB-SING        
                     VARYING W-INDICE-3 FROM 1 BY 1                     
                       UNTIL W-INDICE-3 > QT-NUM-ELEM-EFF               
                            OF PARTAB-SING                              
                 CLOSE FILE-BC                                          
                ELSE                                                    
                   PERFORM CALL-COMMAND THRU EX-CALL-COMMAND            
                   PERFORM SCORRI-TB THRU EX-SCORRI-TB
                   PERFORM CALL-COMMAND-2 THRU EX-CALL-COMMAND-2        
              END-IF                                                    
              PERFORM SCRIVI-BOLLE THRU EX-SCRIVI-BOLLE                 
              PERFORM CHIAMA-PRINTDDT THRU EX-CHIAMA-PRINTDDT           
      *> BUDA*                                                            
      *>        IF FLAG-ANACON NOT = '0' AND NOT = ' '                    
      *>          PERFORM CHIAMA-WRITERES THRU EX-CHIAMA-WRITERES         
      *>        END-IF                                                    
              IF PRIORITA OF REC-INDIRIZZI = 4                          
      *> EURO1*                                                           
                 MOVE DIVISA OF REC-CONFATT TO                          
                                DIVISA-PRIMO-LETTO                      
      *>           CANCEL "PRTBCEU6"
      *>           CALL "PRTBCEU6" USING W-COMMON
      *> MOVSKU
      *>            CANCEL "PRTBCEU7"
      *>            CALL "PRTBCEU7" USING W-COMMON
                 CANCEL "PRTBCEU8"
                 CALL "PRTBCEU8" USING W-COMMON 
                                       SQLCA
                                       REC-CONFATT
                                       AA-MM-GG-DDT
                                       NUMERO-DDT
                                       DIVISA-PRIMO-LETTO
                                       DESTINO-USCITA       
              END-IF                                                    
              IF IND-CAPI-NO-GIAC > 0
                 PERFORM STAMPA-NO-GIAC THRU EX-STAMPA-NO-GIAC
              END-IF
              PERFORM TTUNLOCK THRU EX-TTUNLOCK                         
              IF FLAG-ANACON NOT = '0' AND NOT = ' '
                 PERFORM ALLINEA-BOLLA-ESTERO
                    THRU EX-ALLINEA-BOLLA-ESTERO
              END-IF
              PERFORM AVANZA-DDT THRU EX-AVANZA-DDT
      *> TASTO-PER-CONTINUARE*                                            
              DISPLAY "premi un tasto per continuare..."                
              ACCEPT TASTO-INP                                          
      *>                                                                  
           END-IF.                                                      
       EX-TRATTA-LETTI.                                                 
           EXIT.                                                        
      *>                                                                  
      *> 
       ALLINEA-BOLLA-ESTERO.
           MOVE RIF-BOLLA-DDT TO INPUT-RIF-TRASF.
           IF CONTO-FATTURA-MEM NOT = 0
             MOVE CONTO-FATTURA-MEM TO INPUT-CONTO-TRASF
           ELSE
             MOVE CONTO-IN-R TO INPUT-CONTO-TRASF
           END-IF.
           CALL  "PYTHON"
           USING "allinea_bolle_in_estero"
                 "allinea_estero"
                 PY-INPUT-TRASF
                 PY-OUTPUT-TRASF.
           IF OUTPUT-ERR-TRASF NOT = SPACES
              DISPLAY 'ERRORE!'
              DISPLAY OUTPUT-ERR-TRASF
           END-IF.
       EX-ALLINEA-BOLLA-ESTERO.
           EXIT.
           
       AVANZA-DDT.
      *>     
      *> questo rif_intr ha anno a due cifre
         MOVE RIF-BOLLA-DDT TO INPUT-RIF-INTR.
         IF CONTO-FATTURA-MEM NOT = 0
           MOVE CONTO-FATTURA-MEM TO INPUT-CONTO
         ELSE
           MOVE CONTO-IN-R TO INPUT-CONTO
         END-IF.       
         MOVE MAG-INPUT-R TO INPUT-MAG.
      *> il flag E indica ddt stock o estero alla libreria dell'avanzament
         MOVE 'E' TO INPUT-FLAG.                  
         CALL "PYTHON" USING "avanzamento" 
                             "genera_avanzamento" 
                               PY-INPUT-REC-B
                               PY-OUTPUT-REC-B.
         IF OUTPUT-VAL = 'KO'
             DISPLAY 'AVANZAMENTO NON RIUSCITO'.
       EX-AVANZA-DDT.
           EXIT. 
      *> 
      *>                                                                  
       CALL-COMMAND.                                                    
           MOVE NUMERO-DDT TO BUILD-N-DDT                               
                              PURGE-N-DDT                               
                              FILE-N-DDT                                
                              FILE-N-DDT-2                              
                              PRINT-N-DDT                               
                              PRINT-N-DDT-2.                            
           CANCEL "COMMAND2"
           CALL "COMMAND2" USING COMANDO-BUILD                         
                                           ERR, ERR-PARM.               
           IF ERR NOT = 0                                               
              MOVE ERR TO ERR-DISP                                      
      *> ERR-279*                                                         
              DISPLAY "Errore COMMAND BUILD - P" BUILD-N-DDT            
                      SPACE "-  " ERR-DISP.                             
      *>        STOP RUN.                                                 
      *>                                                                  
           CANCEL "COMMAND2"
           CALL "COMMAND2" USING COMANDO-FILE                          
                                           ERR, ERR-PARM.               
           IF ERR NOT = 0                                               
              MOVE ERR TO ERR-DISP                                      
              DISPLAY "Errore COMMAND FILE ECQ - P" BUILD-N-DDT         
                      SPACE "-  " ERR-DISP
              MOVE 1 TO JRUNC
      *>         STOP RUN JRUNC.    
                                            
           OPEN OUTPUT FILE-PEND.                                       
       EX-CALL-COMMAND.                                                 
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       STAMPA-NO-GIAC.                                                  
           MOVE 100 TO CONTA-RIGHE.                                     
           MOVE 1 TO CONTA-PAGINE.                                      
           PERFORM APRI-STAMPA THRU EX-APRI-STAMPA.                     
           PERFORM STAMPA-DETT-N-G THRU EX-STAMPA-DETT-N-G              
                      VARYING W-INDICE-3 FROM 1 BY 1                    
                          UNTIL W-INDICE-3 >                            
                              IND-CAPI-NO-GIAC.                         
           PERFORM CHIUDI-STAMPA THRU EX-CHIUDI-STAMPA.                 
       EX-STAMPA-NO-GIAC.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       APRI-STAMPA.                                                     
           MOVE  136  TO LL-RIGA.                                       
           MOVE 9999 TO N-MAX-RIGHE.                                    
           MOVE "N" TO PRE-NOME-FILE.                                   
           MOVE NUMERO-DDT TO TERM-N-FILE.                              
           CALL "QOLPPR" USING PAR-PRINT                                
                                RIGA BUFFER.                            
           MOVE 0   TO N-STAMPANTE.                                     
           MOVE "M" TO COMANDO.                                         
           MOVE 66  TO N-RIGA-STAMPA.                                   
      *> NOPRZ*                                                           
      *>     MOVE " MANCA GIACENZA SU VENDITA " TO DATI-RIGA.             
           MOVE " MANCA GIAC./PREZZO SU VENDITA " TO DATI-RIGA.         
           CALL "QWLPPR" USING PAR-PRINT                                
                                RIGA BUFFER.                            
           MOVE SPACES TO DATI-RIGA.                                    
       EX-APRI-STAMPA.                                                  
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       SCRIVI.                                                          
           CALL "QWLPPR" USING PAR-PRINT                                
                               RIGA BUFFER.                             
           IF STATO OF PAR-PRINT NOT = 0                                
              MOVE STATO OF PAR-PRINT TO STATO-DISPLAY                  
              DISPLAY "ERRORE QPRINT CON STATO : " STATO-DISPLAY        
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON.                           
           MOVE SPACES TO DATI-RIGA.                                    
           MOVE "S" TO COMANDO.                                         
           MOVE 0 TO N-RIGA-STAMPA.                                     
       EX-SCRIVI.                                                       
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       INTESTA-PAGINA.                                                  
           MOVE SPACE TO DATI-RIGA.                                     
           MOVE W-FORMATO-GG-MMM-AAAA TO DATA-T.                        
           MOVE W-NUM-TERM TO NUM-PAG-T.                                
           MOVE "term " TO D-PAG-T.                                     
           MOVE "P" TO COMANDO.                                         
           MOVE 2 TO N-RIGA-STAMPA.                                     
           MOVE 0 TO N-STAMPANTE.                                       
           PERFORM SCRIVI THRU                                          
                    EX-SCRIVI.                                          
      *>                                                                  
           MOVE CONTO-IN-R TO CONTO-T.                                  
           MOVE D-CONTO-MEM TO D-CONTO-T.                               
           MOVE "pag. " TO D-PAG-T.                                     
           MOVE CONTA-PAGINE TO NUM-PAG-T.                              
           MOVE "P" TO COMANDO.                                         
           MOVE 3 TO N-RIGA-STAMPA.                                     
           MOVE 0 TO N-STAMPANTE.                                       
           PERFORM SCRIVI THRU                                          
                    EX-SCRIVI.                                          
      *>                                                                  
      *> NOPRZ*                                                           
           MOVE "     ELENCO MODELLI SENZA GIAC./PREZZO "               
                          TO DATI-RIGA.                                 
           MOVE 2 TO N-RIGA-STAMPA.                                     
           PERFORM SCRIVI THRU                                          
                    EX-SCRIVI.                                          
      *>                                                                  
           MOVE 1 TO N-RIGA-STAMPA.                                     
           MOVE 5 TO CONTA-RIGHE.                                       
       EX-INTESTA-PAGINA.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       STAMPA-DETT-N-G.                                                 
           IF CONTA-RIGHE  > 50                                         
              PERFORM INTESTA-PAGINA THRU EX-INTESTA-PAGINA             
              ADD 1 TO CONTA-PAGINE.                                    
           MOVE C-MAT-NO-GIAC (W-INDICE-3) TO C-MAT-A-BARRE-RID.        
           MOVE 0 TO C-MAT-TRANS-RID.                                   
           MOVE MODELLO OF C-MAT-A-BARRE TO MODELLO OF                  
                               C-MAT-TRANSITO.                          
           MOVE VESTIBILITA OF C-MAT-A-BARRE TO                         
                    VEST-A OF C-MAT-TRANSITO.                           
           MOVE SOCIETA OF C-MAT-A-BARRE TO                             
                     PROGR-ART OF C-MAT-TRANSITO.                       
           MOVE PEZZO OF C-MAT-A-BARRE TO PEZZO-A OF                    
                               C-MAT-TRANSITO.                          
           MOVE VARIANTE-COL OF C-MAT-A-BARRE TO COLORE OF              
                               C-MAT-TRANSITO.                          
           MOVE C-MAT-TRANS-RID TO C-MAT-ST.                            
           MOVE D-MAT-NO-GIAC (W-INDICE-3) TO NOME-MOD-ST.
           MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN                       
           MOVE FUNCTION idxtg(NTG-IN) TO TAGLIA-ST.                    
           COMPUTE PREZZO-ST-EU = PREZZO-NO-GIAC (W-INDICE-3) / 100.    
      *> PRZBU*                                                           
           MOVE CAUSALE-NO-GIAC (W-INDICE-3) TO                         
                               NOGIAC-ST.                               
           MOVE CAUSALE-NO-PRZ (W-INDICE-3) TO                          
                               NOPRZ-ST.                                
      *>                                                                  
           PERFORM SCRIVI THRU EX-SCRIVI.                               
       EX-STAMPA-DETT-N-G.                                              
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
       CHIUDI-STAMPA.                                                   
           CALL "QCLPPR" USING PAR-PRINT                                
                                RIGA BUFFER.                            
       EX-CHIUDI-STAMPA.                                                
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       CALL-COMMAND-2.                                                  
           CLOSE FILE-PEND.                                             
      *> conv
           MOVE "dd_PEND" TO WK-VAR-NAME.
           MOVE SPACES    TO WK-VAR-VALUE.
           DISPLAY WK-VAR-NAME UPON ENVIRONMENT-NAME.
           ACCEPT WK-VAR-VALUE FROM ENVIRONMENT-VALUE.
           MOVE WK-VAR-VALUE TO LPR-NOME-FILE.
      *> 
           MOVE DESTINO-USCITA TO LPR-NUM-STAMPANTE.
      *> non stampa i pendenti, verranno stampati manualmente
      *> se necessario
      *>     CALL "SYSTEM" USING COMANDO-LPR-LINUX
      *>             GIVING INTO ERR.
      *>     IF ERR NOT = 0
      *>        MOVE ERR TO ERR-DISP
      *>        DISPLAY "**READVE3 - Errore COMANDO: "
      *>                COMANDO-LPR-LINUX
      *>                " - errno: " ERR-DISP
      *>     END-IF.
      *> 
      *>     CALL INTRINSIC "COMMAND" USING COMANDO-FILE-2                
      *>                                     ERR, ERR-PARM.               
      *>     IF C-C NOT = 0                                               
      *>        MOVE ERR TO ERR-DISP                                      
      *>        DISPLAY "Errore COMMAND FILE ECQ-2 - P" BUILD-N-DDT       
      *>                SPACE "-  " ERR-DISP                              
      *>        STOP RUN.                                                 
      *>     CALL INTRINSIC "COMMAND" USING COMANDO-PRINT                 
      *>                                     ERR, ERR-PARM.               
      *>     IF C-C NOT = 0                                               
      *>        MOVE ERR TO ERR-DISP                                      
      *>        DISPLAY "Errore COMMAND PRINT ECQ - P" BUILD-N-DDT        
      *>                SPACE "-  " ERR-DISP                              
      *>        STOP RUN.                                                 
      *> conv-end
      *>     CALL INTRINSIC "COMMAND" USING COMANDO-PURGE                 
      *>                                     ERR, ERR-PARM.               
      *>     IF C-C NOT = 0                                               
      *>        MOVE ERR TO ERR-DISP                                      
      *>        DISPLAY "Errore COMMAND PURGE - P" BUILD-N-DDT            
      *>                SPACE "-  " ERR-DISP                              
      *>        STOP RUN.                                                 
       EX-CALL-COMMAND-2.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> BUDA*                                                            
       CHIAMA-WRITERES.                                                 
           MOVE 0 TO CAPO-CONTO.                                        
           MOVE NEG-IN TO SOTTO-CONTO.                                  
      *>                                                                  
           MOVE RIF-BOLLA-DDT TO RIF-INTR-WR.                           
      *> MAG6/7*                                                          
      *>     MOVE 7 TO MAGAZZINO-WR.                                      
           MOVE MAG-INPUT-R TO MAGAZZINO-WR.                            
           MOVE FLAG-ANACON TO DEST-WR.                                 
      *> FIFRA*                                                           
      *>     MOVE CONTO-IN-R TO CONTO-CLI-WR.                             
           IF CONTO-FATTURA-MEM NOT = 0                                 
             MOVE CONTO-FATTURA-MEM TO CONTO-CLI-WR                     
           ELSE                                                         
             MOVE CONTO-IN-R TO CONTO-CLI-WR.                           
      *>                                                                  
           MOVE CODICE-CONTO TO CONTO-DEST-WR.                          
           MOVE DIVISA-MEM TO DIVISA-WR.                                
           MOVE LISTINO-MEM TO LISTINO-WR.                              
           MOVE "VESD" TO CAUSALE-WR.                                   
           MOVE 0 TO DATA-CARICO-WR.                                    
           CANCEL "WRITERES"
           CALL "WRITERES" USING W-COMMON                               
                                 SQLCA                                  
                                 CAMPI-X-WRITE DATA-CARICO-WR.          
       EX-CHIAMA-WRITERES.                                              
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       SCRIVI-BOLLE.                                                    
           MOVE "BOLLE;" TO W-NOME-DATA-SET.                            
      *> FIFRA*                                                           
      *>     MOVE CONTO-IN-R TO CONTO OF REC-BOLLE.                       
           IF CONTO-FATTURA-MEM NOT = 0                                 
             MOVE CONTO-FATTURA-MEM TO CONTO OF REC-BOLLE               
           ELSE                                                         
             MOVE CONTO-IN-R TO CONTO OF REC-BOLLE.                     
      *>                                                                  
           MOVE RIF-BOLLA-DDT TO RIF-INTERNO OF REC-BOLLE.              
      *> BOLL*                                                            
      *> MAG6/7*                                                          
      *>     MOVE 7 TO MAGAZZINO OF REC-BOLLE                             
           MOVE MAG-INPUT-R TO MAGAZZINO OF REC-BOLLE                   
           MOVE 0 TO DATA-NASCITA OF REC-BOLLE                          
                     NUM-PRE-FATT OF REC-BOLLE.                         
           MOVE 1 TO NUMERO       OF REC-BOLLE.                         
           MOVE SPACES TO VAL-REC OF REC-BOLLE.                         
           PERFORM TTDBPUT THRU EX-TTDBPUT.                             
           IF NOT W-OK-IMAGE                                            
              MOVE W-STATUS-WORD-IMAGE TO ERR-DISP                      
              DISPLAY "Err. PUT BOLLE  " ERR-DISP                       
              DISPLAY "Per CONTO  " CONTO-IN-R                          
                 "   RIF-INTERNO  " RIF-BOLLA-DDT                       
           CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON.                           
       EX-SCRIVI-BOLLE.                                                 
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       TRATTA-STORNO.                                                   
           MOVE SPACES TO COD-IN.                                       
           ACCEPT COD-IN.                                               
           IF LETT-FINE                                                 
              GO TO EX-TRATTA-STORNO.                                   
           IF LETT-ANN-TUTTO                                            
              MOVE 0 TO IND-CAPI-LETTI                                  
              MOVE "." TO COD-IN-RID                                    
              GO TO EX-TRATTA-STORNO.                                   
           IF C-MAT-A-BARRE-RID NOT NUMERIC                             
              DISPLAY "COD non num >> RILEGGERE"                        
              PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
              GO TO EX-TRATTA-STORNO.              
           MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN 
           MOVE FUNCTION idxtg(NTG-IN) 
                    TO NTG-OUT                            
           MOVE SOCIETA OF C-MAT-A-BARRE TO SOC-COM.                    
           MOVE 0 TO PRE-SOC.                                           
           MOVE SOC-COM TO SOCIETA OF C-MAT-A-BARRE.                    
           COMPUTE ELEM-ART = C-MAT-A-BARRE-RID / 10                    
           MOVE "K2" TO QT-FUNZIONE OF PARTAB-ART.                      
           CANCEL "QTABEL"
           CALL "QTABEL" USING PARTAB-ART TABELLA-ARTICOLI-LETTI        
                               ELEM-ART.                                
           IF QT-STATO OF PARTAB-ART NOT = 0                            
             PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
             DISPLAY "Manca lettura "                                   
             GO TO EX-TRATTA-STORNO.                                    
           MOVE ART-TAB-LETTI(QT-INDEX-ELEM OF PARTAB-ART)              
                 TO ART-ELEM-LETTI.                                     
           SUBTRACT 1 FROM QTA-TAGLIA-ELEM(NTG-OUT).                    
           IF QTA-TAGLIA-ELEM(NTG-OUT) < 0                      
                 PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
                 DISPLAY "Taglia non stornabile"                        
                 GO TO EX-TRATTA-STORNO.                                
           PERFORM DELETE-ELEM-SING THRU EX-DELETE-ELEM-SING.           
           SUBTRACT 1 FROM IND-CAPI-LETTI.                              
           SUBTRACT PREZZO-ELEM FROM PREZZO-TOT.                        
           MOVE  QTA-TAGLIA-ELEM(NTG-OUT)                       
             TO DISP-4.                                                 
           DISPLAY "ancora " DISP-4                                     
                        C-MAT-A-BARRE-RID.                              
      *> EURO1*                                                           
           IF W-FORMATO-INTERNO NOT > 011231                            
             MOVE PREZZO-TOT TO IE-IMPORTO-IN                           
             PERFORM PRZ-INLIT THRU EX-PRZ-INLIT                        
             COMPUTE PREZZO-TOT-D = IE-IMPORTO-OU / 100                 
      *>        DISPLAY "  Tot. L." PREZZO-TOT-D                          
           ELSE                                                         
             COMPUTE PREZZO-TOT-D = PREZZO-TOT / 100                    
      *>        DISPLAY " Tot. Eur." PREZZO-TOT-D
           END-IF
      *>                                                                  
           MOVE ART-ELEM-LETTI                                          
              TO ART-TAB-LETTI(QT-INDEX-ELEM OF PARTAB-ART).            
       EX-TRATTA-STORNO.                                                
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       SCORRI-TB.
           PERFORM COMANDI-IGP-TESTA THRU EX-COMANDI-IGP-TESTA.
      *> 
           MOVE 0 TO VERT-EXP-IGP
                     ORIZ-EXP-IGP.
      *> 
           MOVE 80 TO ROW-IGP.
           MOVE 100 TO COL-IGP.
           PERFORM COMANDI-IGP-TESTA-1 THRU EX-COMANDI-IGP-TESTA-1.
           MOVE SPACES TO RIGA-PEND-COM.
           MOVE QT-NUM-ELEM-EFF OF PARTAB-SING
             TO DISP-4.
           STRING "INIZIO "   DELIMITED BY SIZE
                  NUMERO-DDT  DELIMITED BY SIZE
                  " - TOT "   DELIMITED BY SIZE
                  DISP-4      DELIMITED BY SIZE
             INTO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
           PERFORM COMANDI-IGP-FINE-1 THRU EX-COMANDI-IGP-FINE-1.
      *> ****
           MOVE 0 TO IND-PEND.
           PERFORM VARYING W-INDICE-3 FROM 1 BY 1
           UNTIL W-INDICE-3 > QT-NUM-ELEM-EFF OF PARTAB-SING
              PERFORM SCORRI-TB-SING
                 THRU EX-SCORRI-TB-SING
           END-PERFORM.
      *> 
      *> etich-vuota*
           PERFORM SCRIVI-ETICH-VUOTA
              THRU EX-SCRIVI-ETICH-VUOTA.
       EX-SCORRI-TB.
           EXIT.                                                        
      *>                                                                  
      *> 
       SCORRI-TB-SING.
           IF IND-PEND = 0
              PERFORM COMANDI-IGP-TESTA-1
                 THRU EX-COMANDI-IGP-TESTA-1
           END-IF.
      *> 
           MOVE SPACES TO RIGA-PENDENTI.
           PERFORM METTI-VALORI-PEND THRU EX-METTI-VALORI-PEND.
      *> 
           MOVE 80 TO ROW-IGP.
           COMPUTE COL-IGP = 80 + (IND-PEND * 1000).
           MOVE ANTE-PRIMA-RIGA TO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
      *> 
           ADD 56 TO ROW-IGP.
           MOVE PRIMA-RIGA TO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
      *> 
           ADD 56 TO ROW-IGP.
           MOVE SECONDA-RIGA TO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
      *> 
           ADD 56 TO ROW-IGP.
           MOVE TERZA-RIGA TO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
      *> 
           ADD 56 TO ROW-IGP.
           MOVE QUARTA-RIGA TO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
      *> 
           IF IND-PEND = 1 OR
           W-INDICE-3 = QT-NUM-ELEM-EFF OF PARTAB-SING
              PERFORM COMANDI-IGP-FINE-1
                 THRU EX-COMANDI-IGP-FINE-1
           END-IF.
      *> 
           IF IND-PEND = 0
              MOVE 1 TO IND-PEND
           ELSE
              MOVE 0 TO IND-PEND
           END-IF.
       EX-SCORRI-TB-SING.
           EXIT.
      *> 
      *> etich-vuota*
       SCRIVI-ETICH-VUOTA.
           MOVE 80 TO ROW-IGP.
           MOVE 100 TO COL-IGP.
           PERFORM COMANDI-IGP-TESTA-1 THRU EX-COMANDI-IGP-TESTA-1.
           MOVE SPACES TO RIGA-PEND-COM.
           PERFORM SCRIVI-RECORD-IGP THRU EX-SCRIVI-RECORD-IGP.
           PERFORM COMANDI-IGP-FINE-1 THRU EX-COMANDI-IGP-FINE-1.
       EX-SCRIVI-ETICH-VUOTA.
           EXIT.
      *> 
      *> 
      *>                                                                  
       METTI-VALORI-PEND.
           MOVE NUMERO-DDT TO NUMERO-P.
           MOVE ELEM-TAB-SING (W-INDICE-3) TO ELEMENTO-SINGOLI.         
           MOVE C-MAT-SING TO CODICE-P.
           MOVE D-MAT-SING TO NOME-P.
      *> EURO*                                                            
      *>      ===PREPROCESSOR==>COPY PINEU START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
             CALL "QINEURO" USING        PAR-INEU                       
             IF IE-ERRORE                                               
               DISPLAY IE-MSG UPON CONSOLE                              
             END-IF.                                                    
      *>                                            ********************* 
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PINEU END

                                                  
           MOVE IE-DIVISA-OU TO DIV-EUR.
      *>                                                                  
      *> PRZ-PUBBL*                                                       
      *>     COMPUTE PREZZO-P-E = PREZZO-SING / 100.
           MOVE 0 TO PREZZO-P-E.
      *> annullato*   16/09/2011 - richiesta di Benassi
      *>     IF CONTO-DEMA                                                
      *>       PERFORM CERCA-PREZZO-PUBBL THRU EX-CERCA-PREZZO-PUBBL      
      *>       COMPUTE PREZZO-P-E = PREZZO-PUBBL / 100
      *>     END-IF.                                                      
      *> 
      *>                                                                  
           MOVE PREZZO-SING TO IE-IMPORTO-IN.                           
      *>      ===PREPROCESSOR==>COPY PDAEU START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
             CALL "QDAEURO" USING        PAR-INEU                       
             IF IE-ERRORE                                               
               DISPLAY IE-MSG UPON CONSOLE                              
             END-IF.                                                    
      *>                                            ********************* 
      *> CONTROL LIST                                                     
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDAEU END

                                                  
           MOVE IE-DIVISA-OU TO DIV-LIT.
      *>     COMPUTE PREZZO-P = IE-IMPORTO-OU / 100.
           MOVE 0 TO PREZZO-P.
       EX-METTI-VALORI-PEND.
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> PRZ-PUBBL*                                                       
       CERCA-PREZZO-PUBBL.                                              
           MOVE 0 TO PREZZO-PUBBL.                                      
      *>                                                                  
           MOVE C-MAT-SING TO C-MAT-A-BARRE-RID.                        
           MOVE 0 TO C-MAT-TRANS-RID OF C-MAT-COM.                      
           MOVE MODELLO OF C-MAT-A-BARRE                                
             TO MODELLO OF C-MAT-TRANSITO.                              
           MOVE VESTIBILITA OF C-MAT-A-BARRE                            
             TO VEST-A OF C-MAT-TRANSITO.                               
           MOVE SOCIETA OF C-MAT-A-BARRE                                
             TO PROGR-ART OF C-MAT-TRANSITO.                            
           MOVE PEZZO OF C-MAT-A-BARRE                                  
             TO PEZZO-A OF C-MAT-TRANSITO.                              
           MOVE 0                                                       
             TO COLORE OF C-MAT-TRANSITO.                               
      *>                                                                  
      *>  NO-DATGE                                                        
      *>      MOVE SOCIETA-MOD OF C-MAT-TRANSITO TO SOCIETA-CODICE-SOC.   
      *>      PERFORM SELEZIONA-PF-SOCIETA THRU EX-SELEZIONA-PF-SOCIETA.  
      *>      IF SQLCODE-MEM = OK                                         
      *> *trovata societa                                                 
      *>        MOVE C-MAT-TRANS-RID OF C-MAT-COM                         
      *>          TO MODELLI-MODELLO-MAXIMA                               
      *>  *      MOVE SOCIETA-SOCIETA TO MODELLI-SOCIETA                  
      *>        PERFORM SELEZIONA-MODELLO-NEW                             
      *>           THRU EX-SELEZIONA-MODELLO-NEW                          
      *>        IF SQLCODE-MEM = OK                                       
      *> *trovato modello new                                             
      *>          MOVE MODELLI-MODELLO-NEW TO PREZZI-MODELLO-NEW          
      *>          MOVE MODELLI-ANNO        TO PREZZI-ANNO                 
      *>          MOVE MODELLI-STAGIONE    TO PREZZI-STAGIONE             
      *>          MOVE MODELLI-SOCIETA     TO PREZZI-SOCIETA              
      *>          PERFORM SELEZIONA-PREZZO THRU EX-SELEZIONA-PREZZO       
      *>          IF SQLCODE-MEM =OK                                      
      *> *trovato prezzo                                                  
      *>            MOVE PREZZI-PREZZO TO PREZZO-PUBBL                    
      *>          END-IF                                                  
      *>        END-IF                                                    
      *>      END-IF.                                                     
      *> *                                                                
      *>  NO-DATGE                                                        
       
      *>  NO-DATGE                                                        
            PERFORM TRATTA-MODELLI-DBG THRU 
                 EX-TRATTA-MODELLI-DBG.
      *>  NO-DATGE                                                        
                                                          
           IF PREZZO-PUBBL = 0 AND                                      
           SOCIETA-MOD OF C-MAT-TRANSITO = 5                            
             PERFORM CERCA-PREZZO-PUBBL-2                               
                THRU EX-CERCA-PREZZO-PUBBL-2                            
           END-IF.                                                      
       EX-CERCA-PREZZO-PUBBL.                                           
           EXIT.                                                        
      *>                                                                  
         
      *>  NO-DATGE                                                        
       TRATTA-MODELLI-DBG.
            MOVE SOCIETA-SIGLA(SOCIETA-MOD OF C-MAT-TRANSITO)
              TO CC-SOCIETA.
              
            MOVE C-MAT-TRANS-RID OF C-MAT-COM TO CC-C-MAT.
            MOVE 1 TO CC-LISTINo.
            MOVE "V" TO CC-TIPO-PREZZO.
       
            PERFORM SELEZIONA-PREZZO-DBG THRU
                 EX-SELEZIONA-PREZZO-DBG.
       
            DISPLAY "SQLCODE " SQLCODE.
            PERFORM TEST-ERR THRU TEST-ERR-EX. 
      *>       IF SQLCODE = OK        DISPLAY "SQLCODE = OK" END-IF
      *>       IF SQLCODE = NO-MEMORY DISPLAY "SQLCODE = NO_MEMORY" END-IF
      *>       IF SQLCODE = DEADLOCK  DISPLAY "SQLCODE = DEADLOCK" END-IF
      *>       IF SQLCODE = NOT-FOUND DISPLAY "SQLCODE = NOT-FOUND" END-IF
       
            IF SQLCODE = OK
               MOVE CC-PREZZO-DBG TO PREZZO-PUBBL.
      *>          DISPLAY "CC-PREZZO-DBG=" CC-PREZZO-DBG 
      *>                  "  PREZZO-PUBBL=" PREZZO-PUBBL.  
       EX-TRATTA-MODELLI-DBG. EXIT.
      *> 
      *> 
       SELEZIONA-PREZZO-DBG.
           PERFORM WITH TEST AFTER                                      
           UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK                   
             PERFORM BEGIN-RC THRU BEGIN-RC-EX                          
             IF SQLCODE = OK                                            
          EXECSQL SQL1 
             END-IF                                                     
             MOVE SQLCODE TO SQLCODE-MEM                                
             PERFORM S-S-COMMIT THRU S-S-COMMIT-EX                      
           END-PERFORM.                                                 
       EX-SELEZIONA-PREZZO-DBG. EXIT.
      *>  NO-DATGE                                                        
       
      *>                                                                  
      *> PRZ-PUBBL*                                                       
      *>  NO-DATGE                                                        
      *> SELEZIONA-PF-SOCIETA.                                            
      *>     MOVE SPACES TO SOCIETA-SOCIETA.                              
      *>                                                                  
      *>     PERFORM WITH TEST AFTER                                      
      *>     UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK                   
      *>       PERFORM BEGIN-RC THRU BEGIN-RC-EX                          
      *>       IF SQLCODE = OK                                            
      *>         EXEC SQL                                                 
      *>           SELECT SOCIETA                                         
      *>             INTO :SOCIETA-SOCIETA                                
      *>             FROM PF.SOCIETA                                      
      *>            WHERE COD_X_BARCODE = :SOCIETA-CODICE-SOC             
      *>         END-EXEC                                                 
      *>       END-IF                                                     
      *>       MOVE SQLCODE TO SQLCODE-MEM                                
      *>       PERFORM S-S-COMMIT THRU S-S-COMMIT-EX                      
      *>     END-PERFORM.                                                 
      *> EX-SELEZIONA-PF-SOCIETA.                                         
      *>     EXIT.                                                        
      *>  NO-DATGE                                                        
      *>                                                                  
      *>                                                                  
      *> PRZ-PUBBL*                                                       
      *>  NO-DATGE                                                        
      *>  SELEZIONA-MODELLO-NEW.                                          
      *>      MOVE 0 TO FLAG-CURSORE.                                     
      *> *                                                                
      *>      MOVE SPACES TO MODELLI-MODELLO-NEW.                         
      *>      MOVE '000'  TO MODELLI-ESTENSIONE.                          
      *> *                                                                
      *>      PERFORM WITH TEST AFTER                                     
      *>      UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK                  
      *>        PERFORM BEGIN-RC THRU BEGIN-RC-EX                         
      *>        PERFORM DECLARE-CURS-MOD THRU DECLARE-CURS-MOD-EX         
      *>        PERFORM OPEN-CURS-MOD THRU OPEN-CURS-MOD-EX               
      *>        PERFORM FETCH-SINGOLA-CURS-MOD                            
      *>           THRU FETCH-SINGOLA-CURS-MOD-EX                         
      *>        MOVE SQLCODE TO SQLCODE-MEM                               
      *> *      IF NOT STOP-CURSORE                                       
      *> *trovato modello new                                             
      *> *        CONTINUE                                                
      *> *      END-IF                                                    
      *>        PERFORM CLOSE-CURS-MOD THRU CLOSE-CURS-MOD-EX             
      *>        PERFORM S-S-COMMIT THRU S-S-COMMIT-EX                     
      *>      END-PERFORM.                                                
      *>  EX-SELEZIONA-MODELLO-NEW.                                       
      *>      EXIT.                                                       
      *> *                                                                
      *> *                                                                
      *> *PRZ-PUBBL*                                                      
      *>  SELEZIONA-PREZZO.                                               
      *>      MOVE 0    TO PREZZI-PREZZO.                                 
      *>      MOVE '01' TO PREZZI-LISTINO.                                
      *>      MOVE 'V'  TO PREZZI-TIPO-PREZZO.                            
      *> *                                                                
      *>      PERFORM WITH TEST AFTER                                     
      *>      UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK                  
      *>        PERFORM BEGIN-RC THRU BEGIN-RC-EX                         
      *>        IF SQLCODE = OK                                           
      *>          EXEC SQL                                                
      *>            SELECT PREZZO                                         
      *>              INTO :PREZZI-PREZZO                                 
      *>              FROM ANAMAT.PREZZI                                  
      *>             WHERE LISTINO     = :PREZZI-LISTINO AND              
      *>                   TIPO_PREZZO = :PREZZI-TIPO-PREZZO AND          
      *>                   MODELLO_NEW = :PREZZI-MODELLO-NEW AND          
      *>                   ANNO        = :PREZZI-ANNO AND                 
      *>                   STAG        = :PREZZI-STAGIONE AND             
      *>                   SOCIETA     = :PREZZI-SOCIETA                  
      *>          END-EXEC                                                
      *>        END-IF                                                    
      *>        MOVE SQLCODE TO SQLCODE-MEM                               
      *>        PERFORM S-S-COMMIT THRU S-S-COMMIT-EX                     
      *>      END-PERFORM.                                                
      *>  EX-SELEZIONA-PREZZO.                                            
      *>      EXIT.                                                       
      *>  NO-DATGE                                                        
      *>                                                                  
      *>                                                                  
      *> PRZ-PUBBL*                                                       
       CERCA-PREZZO-PUBBL-2.                                            
           MOVE 0 TO PREZZO-PUBBL.                                      
      *>                                                                  
           MOVE "PREZZI;" TO W-NOME-DATA-SET.                           
           MOVE "C-MAT;"  TO W-NOME-CAMPO.                              
           COMPUTE W-VALORE-CAMPO = C-MAT-TRANS-RID / 1000 * 1000.      
      *>                                                                  
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           IF W-OK-IMAGE                                                
              MOVE 5 TO W-MODO                                          
              PERFORM TTDBGET-P-PUB THRU EX-TTDBGET-P-PUB               
              PERFORM TTDBGET-P-PUB THRU EX-TTDBGET-P-PUB               
                UNTIL NOT W-OK-IMAGE OR                                 
                      (MERCATO OF REC-PREZZI-PUB = 2)                   
           END-IF.                                                      
      *>                                                                  
           IF W-OK-IMAGE                                                
              MOVE PREZZO-VENDITA OF REC-PREZZI-PUB(1)                  
                TO PREZZO-PUBBL                                         
           END-IF.                                                      
       EX-CERCA-PREZZO-PUBBL-2.                                         
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
       SCORRI-TAB-SING.                                                 
           MOVE ELEM-TAB-SING (W-INDICE-3) TO ELEMENTO-SINGOLI.         
      *>     DISPLAY CONT-SING SPACE C-MAT-SING SPACE D-MAT-SING.         
       
      *> UNICODDT*                                                        
           IF XD = "S"
               DISPLAY "SCORRI-TAB-SING"
               DISPLAY C-MAT-SING SPACE CONT-SING SPACE D-MAT-SING.
      *> UNICODDT*                                                        
           
           MOVE C-MAT-SING TO C-MAT-A-BARRE-RID.                        
           MOVE 0 TO C-MAT-TRANS-RID.                                   
           MOVE MODELLO OF C-MAT-A-BARRE TO MODELLO OF                  
                             C-MAT-TRANSITO                             
           MOVE VESTIBILITA OF C-MAT-A-BARRE TO                         
                  VEST-A OF C-MAT-TRANSITO                              
           MOVE SOCIETA OF C-MAT-A-BARRE TO                             
                          PROGR-ART OF C-MAT-TRANSITO                   
           MOVE PEZZO OF C-MAT-A-BARRE TO PEZZO-A OF                    
                             C-MAT-TRANSITO                             
           COMPUTE C-MAT-S = C-MAT-SING / 10.                           
           MOVE NEG-IN TO MAG-S                                         
           MOVE D-MAT-SING TO NOME-S                                    
           MOVE SPACES TO NOME-F-S                                      
                          COL-F-S                                       
                          SETTORE-S                                     
           MOVE 0 TO PREZZO-S.  
      *> MOVSKU*
           MOVE SKU-SING TO BARUNI-S.
           MOVE T-TAB TO T-1 T-2 T-3 T-4 T-5 T-6 T-7 T-8 T-9
      *> MOVSKU*                                                   
           PERFORM CERCA-PREZZO-V THRU EX-CERCA-PREZZO-V.               
           COMPUTE PREZZO-S = PREZZO-MEM / 100.                         
           MOVE TAGLIA OF C-MAT-A-BARRE TO TAGLIA-S   
           MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN
           MOVE FUNCTION idxtg(NTG-IN)
                              TO W-INDICE-4               
           PERFORM ESPLODI-TG THRU EX-ESPLODI-TG.                       
       EX-SCORRI-TAB-SING.                                              
           EXIT.                                                        
      *>     
      *> MOVSKU 
       INTESTA-FILE-BC.
           MOVE SPACE TO REC-BC
           STRING "C-MAT" T-TAB "TAGLIA" T-TAB "MAG" T-TAB 
               "SETTORE" T-TAB "NOME" T-TAB "PREZZO" T-TAB 
               "NOME-F" T-TAB "COL-F" T-TAB "TG-OUT" T-TAB
               "BARUNI"
              DELIMITED BY SIZE 
              INTO REC-BC.
           WRITE REC-BC.   
       EX-INTESTA-FILE-BC.
           EXIT.                                                        
      *> MOVSKU                                                           
      *>                                                                  
       CERCA-PREZZO-V.                                                  
           MOVE "PREZZI;" TO W-NOME-DATA-SET.                           
           MOVE "C-MAT;" TO W-NOME-CAMPO.                               
           COMPUTE W-VALORE-CAMPO = C-MAT-TRANS-RID / 1000 * 1000.      
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           IF W-OK-IMAGE                                                
              MOVE 5 TO W-MODO                                          
              PERFORM TTDBGET-P THRU EX-TTDBGET-P                       
              PERFORM TTDBGET-P THRU EX-TTDBGET-P                       
                    UNTIL NOT W-OK-IMAGE OR                             
                      (MERCATO OF REC-PREZZI =                          
                           LISTINO-MEM).                                
           IF W-OK-IMAGE                                                
      *> BUDA*                                                            
              MOVE PREZZO-VENDITA OF REC-PREZZI(1)                      
                  TO PREZZO-MEM.                                        
       EX-CERCA-PREZZO-V.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       SCRIVI-RECORD.                                                   
           IF TAB-ART (W-INDICE-3) = 0                                  
                  OR QTA-TAGLIE-TAB (W-INDICE-3) = LOW-VALUE            
              GO TO EX-SCRIVI-RECORD.     
      *> 
           COMPUTE C-MAT-A-BARRE-RID = TAB-ART (W-INDICE-3) * 10.       
           MOVE ART-TAB-LETTI(W-INDICE-3)                               
               TO ART-ELEM-LETTI.                                       
           MOVE 0 TO C-MAT-TRANS-RID.                                   
           MOVE MODELLO OF C-MAT-A-BARRE TO MODELLO OF                  
                               C-MAT-TRANSITO.                          
           MOVE VESTIBILITA OF C-MAT-A-BARRE TO                         
                        VEST-A OF C-MAT-TRANSITO.                       
           MOVE SOCIETA OF C-MAT-A-BARRE TO                             
                            PROGR-ART OF C-MAT-TRANSITO.                
           MOVE PEZZO OF C-MAT-A-BARRE TO PEZZO-A OF                    
                               C-MAT-TRANSITO.                          
           MOVE VARIANTE-COL OF C-MAT-A-BARRE TO COLORE OF              
                               C-MAT-TRANSITO.                          
      *> BUDA*                                                            
      *>           IF PRIORITA OF REC-INDIRIZZI = 4                       
      *>              COMPUTE C-MAT-S = C-MAT-A-BARRE-RID / 10            
      *>              MOVE NEG-IN TO MAG-S                                
      *>              MOVE D-MAT-ELEM TO NOME-S                           
      *>              MOVE SPACES TO NOME-F-S                             
      *>                             COL-F-S                              
      *>                             SETTORE-S                            
      *> BUDA*                                                            
      *>              MOVE 0 TO PREZZO-S                                  
      *>              PERFORM CERCA-PREZZO THRU EX-CERCA-PREZZO           
      *>              COMPUTE PREZZO-S = PREZZO-ELEM / 100                
      *>              PERFORM ESPLODI-8-TG THRU EX-ESPLODI-8-TG           
      *>                      VARYING W-INDICE-4 FROM 1 BY 1              
      *>                         UNTIL W-INDICE-4 > NTG-NTG               
      *>           END-IF                                                 
            PERFORM INVERTI-QTA THRU EX-INVERTI-QTA                     
                  VARYING W-INDICE-5 FROM 1 BY 1                        
                  UNTIL W-INDICE-5 > NTG-NTG.                           
           PERFORM PREPARA-MOVMAG THRU EX-PREPARA-MOVMAG.               
           PERFORM CREA-MOVMAG-P-3                                      
                 THRU EX-CREA-MOVMAG-P-3.                               
           PERFORM AGGIORNA-SITPF-P-3                                   
                 THRU EX-AGGIORNA-SITPF-P-3.                            
       EX-SCRIVI-RECORD.                                                
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       INVERTI-QTA.                                                     
           COMPUTE QTA-TAGLIA-NEG(W-INDICE-5) =                         
               QTA-TAGLIA-ELEM(W-INDICE-5) * -1.                        
       EX-INVERTI-QTA.                                                  
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       CERCA-PREZZO.                                                    
           MOVE "ANAMAT;" TO W-NOME-DATA-SET.                           
           COMPUTE W-VALORE-CAMPO = C-MAT-TRANS-RID / 1000 * 1000.      
           MOVE 7 TO W-MODO                                             
           PERFORM TTDBGET THRU EX-TTDBGET                              
           IF NOT W-OK-IMAGE                                            
                DISPLAY "Inesist. col 0  " C-MAT-A-BARRE-RID            
             GO TO EX-CERCA-PREZZO.                                     
      *>                                                                  
      *> PRODI*                                                           
           MOVE COSTO OF REC-ANAMAT TO PREZZO-ANAMAT.                   
      *>                                                                  
           IF MAG-STOCK
             PERFORM CHIAMA-DTVALSTK THRU EX-CHIAMA-DTVALSTK            
           ELSE                                                         
             PERFORM CERCA-PREZZIA THRU EX-CERCA-PREZZIA.               
      *>                                                                  
       EX-CERCA-PREZZO.                                                 
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> PRODI*                                                           
       CHIAMA-DTVALSTK.                                                 
           MOVE C-MAT-TRANS-RID TO STK-C-MAT.                           
           MOVE COLLEZIONE OF REC-ANAMAT TO STK-COLL.                   
           MOVE STAGIONE OF REC-ANAMAT TO STK-STAGIONE.                 
           MOVE COSTO OF REC-ANAMAT TO STK-PRZ-LORDO.                   
      *> MAG6/7*                                                          
      *>     IF SI-DT-ESTERO                                              
      *>        MOVE NOME-IN-B TO STK-NOME                                
      *>       ELSE                                                       
      *>          MOVE NOME-IN TO STK-NOME.                               
           IF MAG-FALLATO
             MOVE "STF" TO NOME-IN-3                                    
           ELSE
      *> Mag3_V/F*
             IF F-V-INPUT = "F"
                MOVE "STF" TO NOME-IN-3
             ELSE
      *> 
             MOVE "STV" TO NOME-IN-3.                                   
           MOVE CONTO-IN-R TO NOME-IN-5.                                
           MOVE NOME-IN-35 TO STK-NOME.                                 
      *>                                                                  
           CALL "DTVALSTK" USING STK-NOME                               
                                STK-C-MAT                               
                                STK-STAGIONE                            
                                STK-COLL                                
                                STK-SCO                                 
                                STK-PRZ-SCO                             
                                STK-PRZ-LORDO STK-MSG                   
                                STK-PRIMA-VOLTA                         
                                STK-CAMBIO                              
      *> EURO1*                                                           
                                W-COMMON.                               
      *>                                                                  
      *> IF X5=ON                                                         
      *>     DISPLAY "STK-NOME        " STK-NOME  .                       
      *>     DISPLAY "STK-C-MAT       " STK-C-MAT .                       
      *>     DISPLAY "STK-STAGIONE    " STK-STAGIONE .                    
      *>     DISPLAY "STK-COLL        " STK-COLL .                        
      *>     DISPLAY "STK-SCO         " STK-SCO                           
      *>     DISPLAY "STK-PRZ-SCO     " STK-PRZ-SCO                       
      *>     DISPLAY "STK-PRZ-LORDO   " STK-PRZ-LORDO .                   
      *>     DISPLAY "STK-PRIMA-VOLTA " STK-PRIMA-VOLTA .                 
      *>     DISPLAY "STK-CAMBIO      " STK-CAMBIO.                       
      *>      IF STK-MSG NOT = SPACE                                      
      *>        DISPLAY STK-MSG.                                          
      *> IF                                                               
      *>      toglie i decimali (Farini 12/05/99)                         
      *> NOPRZ*                                                           
      *> EURO*                                                            
      *>     COMPUTE PREZZO-ANAMAT = (COSTO OF REC-ANAMAT / 100) * 100    
      *>     COMPUTE STK-PRZ-SCO = (STK-PRZ-SCO / 100) * 100.             
      *> PRODI*                                                           
      *>     MOVE COSTO OF REC-ANAMAT TO PREZZO-ANAMAT.                   
           MOVE STK-PRZ-SCO TO PREZZO-MEM.                              
           MOVE STK-CAMBIO TO CAMBIO-MEM.                               
       EX-CHIAMA-DTVALSTK.                                              
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       CERCA-PREZZIA.                                                   
           MOVE "PREZZIA;" TO W-NOME-DATA-SET.                          
           MOVE "C-MAT;" TO W-NOME-CAMPO.                               
           COMPUTE W-VALORE-CAMPO = C-MAT-TRANS-RID / 1000 * 1000.      
           PERFORM TTDBFIND THRU EX-TTDBFIND.                           
           IF W-OK-IMAGE                                                
              MOVE 5 TO W-MODO                                          
              PERFORM TTDBGET-P THRU EX-TTDBGET-P                       
              PERFORM TTDBGET-P THRU EX-TTDBGET-P                       
                    UNTIL NOT W-OK-IMAGE OR                             
                      (MERCATO OF REC-PREZZI =                          
                           LISTINO-MEM).                                
           IF W-OK-IMAGE                                                
      *> BUDA*                                                            
              MOVE PREZZO-VENDITA OF REC-PREZZI(1)                      
                  TO PREZZO-MEM.                                        
           MOVE 0 TO CAMBIO-MEM.                                        
       EX-CERCA-PREZZIA.                                                
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       ESPLODI-8-TG.                                                    
           IF QTA-TAGLIA-ELEM (W-INDICE-4) NOT = 0                      
              PERFORM ESPLODI-TG THRU EX-ESPLODI-TG                     
                    VARYING W-INDICE-5 FROM 1 BY 1                      
                        UNTIL W-INDICE-5 >                              
                            QTA-TAGLIA-ELEM (W-INDICE-4).               
       EX-ESPLODI-8-TG.                                                 
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       ESPLODI-TG.                                                      
           MOVE W-INDICE-4 TO TAGLIA-S.                                 
           COMPUTE TG-CAL = PRIMA-TG-SING + (W-INDICE-4 * 2 - 2).       
           PERFORM T-TG THRU EX-T-TG.                                   
           WRITE REC-BC.                                                
           IF CLASSE OF C-MAT-TRANSITO = 52                             
              WRITE REC-BC.                                             
       EX-ESPLODI-TG.                                                   
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       T-TG.                                                            
           IF TG-CAL < 79                                               
              MOVE TG-CAL TO TG-OUT-S.                                  
           IF TG-CAL = 80                                               
              MOVE "XS" TO TG-OUT-S.                                    
           IF TG-CAL = 82                                               
              MOVE " S" TO TG-OUT-S.                                    
           IF TG-CAL = 84                                               
              MOVE " M" TO TG-OUT-S.                                    
           IF TG-CAL = 86                                               
              MOVE " L" TO TG-OUT-S.                                    
           IF TG-CAL = 88                                               
              MOVE "XL" TO TG-OUT-S.                                    
       EX-T-TG.                                                         
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *> PAGE                                                             
      *>                                                                  
       TTUNLOCK.                                                        
      *>      ===PREPROCESSOR==>COPY PDBUNLOC START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           MOVE 1 TO W-MODO.                                            
           CALL "DBUNLOCK" USING W-NOME-DATA-BASE-1                     
                                 W-NOME-DATA-SET                        
                                 W-MODO                                 
                                 W-CA-IMAGE.                            
           IF W-ERRORI-TRAGICI                                          
              MOVE 8 TO W-INDICE-8                                      
              CALL "QDBERROR" USING W-COMMON.                           
       EX-TTUNLOCK.                                                     
           EXIT.                                                        
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDBUNLOC END

                                               
      *>                                                                  
      *>                                                                  
       TTLOCK-T.                         
      *>                                                                  
       TTLOCK.                                                          
      *>      ===PREPROCESSOR==>COPY PDBLOCK START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           CALL "DBLOCK" USING W-NOME-DATA-BASE-1                       
                               W-NOME-DATA-SET                          
                               W-MODO                                   
                               W-CA-IMAGE.                              
           IF W-ERRORI-TRAGICI                                          
              MOVE 5 TO W-INDICE-8                                      
              CALL "QDBERROR" USING W-COMMON.                           
       EX-TTLOCK.                                                       
           EXIT.                                                        
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDBLOCK END

                                                
      *>                                                                  
      *>                                                                  
       TTDBPUT.                                                         
      *>      ===PREPROCESSOR==>COPY PDBPUT START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           MOVE 1 TO W-MODO.                                            
           CALL "DBPUT" USING W-NOME-DATA-BASE-1                        
                              W-NOME-DATA-SET                           
                              W-MODO                                    
                              W-CA-IMAGE                                
                              W-TUTTO-RECORD                            
                              AREA-REC-SET.                             
           IF W-ERRORI-TRAGICI OR W-DATA-SET-PIENO OR                   
              W-CATENA-PIENA OR W-MASTER-PIENO                          
              MOVE 7 TO W-INDICE-8                                      
              CALL "QDBERROR" USING W-COMMON.                           
       EX-TTDBPUT.                                                      
           EXIT.                                                        
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDBPUT END

                                                 
      *>                                                                  
      *>                                                                  
       TTUPDATE.                                                        
      *>      ===PREPROCESSOR==>COPY PDBUPDAT START
      *>                                            ********************* 
      *> IF X8=OFF                                                        
      *> CONTROL NOLIST                                                   
      *> IF                                                               
           MOVE 1 TO W-MODO.                                            
           CALL "DBUPDATE" USING W-NOME-DATA-BASE-1                     
                                 W-NOME-DATA-SET                        
                                 W-MODO                                 
                                 W-CA-IMAGE                             
                                 W-TUTTO-RECORD                         
                                 AREA-REC-SET.                          
           IF W-ERRORI-TRAGICI                                          
              MOVE 9 TO W-INDICE-8                                      
              CALL "QDBERROR" USING W-COMMON.                           
       EX-TTUPDATE.                                                     
           EXIT.                                                        
      *>                                                                  
      *> CONTROL LIST                                                     
      *>                                                                  
      *>                                                                  
      *>      ===PREPROCESSOR==>COPY PDBUPDAT END

                                               
      *>                                                                  
      *>                                                                  
       TTDBGET-P.                            
      *>                                                                  
      *>                                                                  
      *> PRZ-PUBBL*                                                       
       TTDBGET-P-PUB.                                                   
                      
      *>                                                                  
      *>                                                                  
      *> PAGE                                                             
      *>                                                                  
      *>                                                                  
       DISP-C-MAT.                                                      
           MOVE SPACES TO RIGA-DISP.                                    
           MOVE 1 TO IND-4.                                             
           PERFORM METTI-4 THRU EX-METTI-4                              
                  UNTIL IND-4 > 3 OR                                    
                    W-INDICE-3 > QT-NUM-ELEM-EFF OF PARTAB-ART.         
           DISPLAY RIGA-DISP.                                           
       EX-DISP-C-MAT.                                                   
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       METTI-4.                                                         
           IF TAB-ART (W-INDICE-3) = 0                                  
                  OR QTA-TAGLIE-TAB (W-INDICE-3) = LOW-VALUE            
              ADD 1 TO W-INDICE-3                                       
              GO TO EX-METTI-4.                                         
           MOVE TAB-ART (W-INDICE-3) TO DISP-ART (IND-4).               
           MOVE "(" TO PARE1(IND-4).                                    
           MOVE ")" TO PARE2(IND-4).                                    
           MOVE ART-TAB-LETTI(W-INDICE-3) TO ART-ELEM-LETTI.            
           MOVE 0 TO COM-QTA-DISP.                                      
           PERFORM ACCUMULA-QTA THRU EX-ACCUMULA-QTA                    
               VARYING W-INDICE-7 FROM 1 BY 1                           
               UNTIL W-INDICE-7 > NTG-NTG.                              
           MOVE COM-QTA-DISP TO QTA-DISP(IND-4).                        
           ADD COM-QTA-DISP TO TOT-CAPI-LETTI-1.                        
           ADD 1 TO W-INDICE-3 IND-4.                                   
       EX-METTI-4.                                                      
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       ACCUMULA-QTA.                                                    
           ADD QTA-TAGLIA-ELEM(W-INDICE-7) TO COM-QTA-DISP.             
       EX-ACCUMULA-QTA.                                                 
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
       AGG-DPARAM.                                                      
           MOVE "DPARAM;" TO W-NOME-DATA-SET.                           
            ADD 1 TO NUM-BOLLA-TAGLIO-FODERE.                           
            MOVE REC-PARAM-RID TO AREA-REC-SET.                         
            PERFORM TTUPDATE THRU EX-TTUPDATE.                          
       EX-AGG-DPARAM.                                                   
            EXIT.                                                       
      *> 
      *>                                                                  
       AGG-DPARAM-FITTIZI.                                              
           MOVE "DPARAM;" TO W-NOME-DATA-SET.                           
            ADD 1 TO PAR-FITTIZIO-1.                                   
            MOVE REC-PARAM-FITTIZ-R TO AREA-REC-SET.                    
            PERFORM TTUPDATE THRU EX-TTUPDATE.                          
       EX-AGG-DPARAM-FITTIZI.                                           
            EXIT.                                                       
      *>                                         
      *>                                                                  
      *> 
       GET-LOCALITA.
           MOVE SPACES TO LOCALITA-PART-STR.
      *> 
           PERFORM VARYING IND-LOC FROM 1 BY 1
           UNTIL (IND-LOC > MAX-LOC) OR (LOCALITA-PART-STR NOT = SPACES)
              IF COD-LOC(IND-LOC) = MAG-INPUT-R
                 MOVE DESC-LOC(IND-LOC) TO LOCALITA-PART-STR
              END-IF
           END-PERFORM.
      *>     DISPLAY '>'LOCALITA-PART-STR'<'.
       EX-GET-LOCALITA.
           EXIT.
      *> 
      *>                                                                  
       CHIAMA-PRINTDDT.                                                 
      *> MAG6/7*                                                          
      *>     MOVE 7 TO MAGAZZINO-DDT.                                     
           MOVE MAG-INPUT-R TO MAGAZZINO-DDT.                           
           MOVE 1 TO TIPO-DOC-DDT.                                      
           MOVE 11 TO TIPO-MOVIMENTO-DDT.                               
           MOVE "VESD" TO CAUSALE-DDT.                                  
           MOVE 1 TO TIPO-STAMPA-DDT.                                   
      *> FIFRA*                                                           
      *>     MOVE CONTO-IN-R TO CLIENTE-DDT.                              
           IF CONTO-FATTURA-MEM NOT = 0                                 
             MOVE CONTO-FATTURA-MEM TO CLIENTE-DDT                      
           ELSE                                                         
             MOVE CONTO-IN-R TO CLIENTE-DDT.                            
      *>                                                                  
           PERFORM GET-LOCALITA THRU EX-GET-LOCALITA.
           MOVE LOCALITA-PART-STR TO LOC-PART-DDT.                      
           MOVE SPACES TO TIPO-DATA-SET-DDT                             
                          D-CONTO-VET                                   
                          NOTE-DDT (1)                                  
                          NOTE-DDT (2).    
      *> *FSTOCK*
      *>        IF W-SIGLA-UTENTE = "RESIDUO" OR = "PROROSA"
      *>          MOVE "Merce distrib/prod da Diffusione Tessile srl"  
      *>              TO NOTE-DDT(1)
      *>          MOVE 
      *>               " unipersonale; via Santi,8 42025Cavriago(RE)"     
      *>              TO NOTE-DDT(2)
      *>         END-IF.
      *> **
           MOVE 0 TO IMPORTO-X-PL.                                      
      *> BUDA*                                                            
           MOVE "N"  TO FILE-FAT-DDT.                                   
      *> TRAVMAG*                                                         
           IF W-SIGLA-UTENTE = "MAXMAX"                                 
             MOVE                                                       
       "MITTENTE DEPOSITARIO:MAXIMA SPA C/O DEPOSITO DIFFUSIONE TESSILE"
                    TO RIGA-1-DDT                                       
             MOVE                                                       
       "SRL - VIA SANTI,8 42025 CAVRIAGO (RE) (SCARICO CONTO DEPOSITO)" 
                    TO RIGA-2-DDT                                       
           ELSE
      *> *FSTOCK*      alternativa
      *>        IF W-SIGLA-UTENTE = "RESIDUO" OR = "PROROSA"
      *>          MOVE "Merce distrib e/o prodotta da Diffusione Tessile s
      *> -          "l unipersonale"
      *>              TO RIGA-1-DDT
      *>          MOVE "via Santi, 8 42025 Cavriago (RE)"                 
      *>              TO RIGA-2-DDT
      *>         
      *>         ELSE
      *> **
             MOVE SPACE TO RIGA-1-DDT RIGA-2-DDT.                       
      *>                                                                  
      *> PRINTDD6*                                                        
      *>     CALL "PRINTDD3" USING W-COMMON                               
           CANCEL "PRINTDDF"
           CALL "PRINTDDF" USING W-COMMON                               
                                 SQLCA                                  
                                 CAMPI-ANAGRAFICI                       
                                 CAMPI-COMODO                           
                                 TIPO-DATA-SET-DDT                      
                                 IMPORTO-X-PL                           
      *> BUDA*                                                            
                                 FILE-FAT-DDT                           
      *> TRAVMAG*                                                         
                                 RIGA-1-DDT                             
                                 RIGA-2-DDT.                            
      *>                                                                  
       EX-CHIAMA-PRINTDDT.                                              
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       PREPARA-MOVMAG.                                                  
           MOVE LOW-VALUE TO MOVMAG.                                    
           MOVE SPACES TO VAL-REC OF MOVMAG.                            
           MOVE 1 TO NUMERO-RIGA OF MOVMAG.                             
           MOVE W-FORMATO-INTERNO TO Q-DATA-I.                          
           MOVE 2 TO Q-FUNZIONE OF PARGEN.                              
           CANCEL "QDATAS"
            CALL "QDATAS" USING PARGEN                                  
                               Q-DATA-E Q-DATA-I                        
                               Q-SETTIMANA.                             
           MOVE Q-SETTIMANA                                             
             TO SETTIMANA OF MOVMAG.                                    
           MOVE RIF-BOLLA-DDT TO RIF-INTERNO OF MOVMAG.                 
           MOVE 0 TO RIF-BOLLA-FORN OF MOVMAG                           
                     RIF-ORDINE OF MOVMAG                               
                     MOD-IMPUTAZ OF MOVMAG                              
                     QUANTITA OF MOVMAG.                                
      *> VACO*                                                            
      *>      MOVE 0 TO PREZZO OF MOVMAG.       
      *> VACO*                                                            
           MOVE SPACES TO DIVISA OF MOVMAG                              
                          VAL-REC OF MOVMAG.                            
           MOVE "NR" TO UN-MIS-FATT OF MOVMAG.                          
      *> EURO*                                                            
           MOVE "EUR " TO DIVISA OF MOVMAG.                             
      *>     MOVE "LIT " TO DIVISA OF MOVMAG.                             
           MOVE C-MAT-TRANS-RID TO C-MAT OF MOVMAG.                     
       EX-PREPARA-MOVMAG.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
       CREA-MOVMAG-P-3. 
      *> VACO*                                                            
            MOVE COSTO-ELEM TO PREZZO OF MOVMAG.
      *> VACO*                                                            
           MOVE PREZZO-ELEM TO COSTO-STD OF MOVMAG.                     
      *> BUDA*                                                            
           MOVE CAMBIO-ELEM TO MOD-IMPUTAZ OF MOVMAG.                   
      *> BUDA*                                                            
           MOVE "VESD" TO C-OPE OF MOVMAG.                              
           MOVE QTA-TAGLIE-NEG TO QTA-TAGLIE OF MOVMAG.                 
      *> MAG6/7*                                                          
      *>     MOVE 7 TO MAGAZZINO OF MOVMAG.                               
           MOVE MAG-INPUT-R TO MAGAZZINO OF MOVMAG.                     
      *> FIFRA*                                                           
      *>     MOVE CONTO-IN-R TO CONTO OF MOVMAG.                          
           IF CONTO-FATTURA-MEM NOT = 0                                 
             MOVE CONTO-FATTURA-MEM TO CONTO OF MOVMAG                  
             MOVE CONTO-IN-R TO MOD-IMPUTAZ OF MOVMAG                   
           ELSE                                                         
             MOVE CONTO-IN-R TO CONTO OF MOVMAG.                        
           MOVE MOVMAG TO AREA-REC-SET.                                 
      *>                                                                  
           MOVE "MOVMAG" TO W-NOME-DATA-SET.                            
           PERFORM TTDBPUT THRU EX-TTDBPUT.                             
           IF NOT W-OK-IMAGE                                            
             MOVE W-STATUS-WORD-IMAGE TO STATO-DISPLAY                  
             DISPLAY "ERR PUT MOVMAG-P3- " STATO-DISPLAY                
             DISPLAY "PER C-MAT " C-MAT-TRANSITO                        
           CANCEL "QDBERROR"
             CALL "QDBERROR" USING W-COMMON.                            
       EX-CREA-MOVMAG-P-3.                                              
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
       AGGIORNA-SITPF-P-3.                                              
           MOVE LOW-VALUE TO PARAGGPF.                                  
           MOVE C-MAT-TRANS-RID TO C-MAT OF PARAGGPF.                   
      *> MAG6/7*                                                          
      *>     MOVE 7 TO MAGAZZINO OF PARAGGPF.                             
           MOVE MAG-INPUT-R TO MAGAZZINO OF PARAGGPF.                   
           MOVE -1 TO VALORE OF PARAGGPF.                               
           MOVE QTA-TAGLIE-NEG                                          
             TO QTA-8 OF PARAGGPF.                                      
           MOVE 1 TO F-GIAC OF PARAGGPF.                                
           CANCEL "AGSITPFW"
           CALL "AGSITPFW" USING W-COMMON PARAGGPF.                     
       EX-AGGIORNA-SITPF-P-3.                                           
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
      *>                                                                  
       CARICA-TABELLA.                                                  
           MOVE 0 TO STK-C-MAT.                                         
           MOVE 0 TO STK-STAGIONE.                                      
           MOVE 0 TO STK-COLL.                                          
           MOVE 0 TO STK-PRZ-LORDO STK-PRIMA-VOLTA.                     
      *> MAG6/7*                                                          
      *>     IF SI-DT-ESTERO                                              
      *>        MOVE NOME-IN-B TO STK-NOME                                
      *>       ELSE                                                       
      *>          MOVE NOME-IN TO STK-NOME.  
           IF MAG-FALLATO
             MOVE "STF" TO NOME-IN-3                                    
           ELSE
      *> Mag3_V/F*
             IF F-V-INPUT = "F"
                MOVE "STF" TO NOME-IN-3
             ELSE
      *> 
             MOVE "STV" TO NOME-IN-3.                                   
           MOVE CONTO-IN-R TO NOME-IN-5.                                
           MOVE NOME-IN-35 TO STK-NOME.   
      *>                                                                  
           CALL "DTVALSTK" USING STK-NOME                               
                                STK-C-MAT                               
                                STK-STAGIONE                            
                                STK-COLL                                
                                STK-SCO                                 
                                STK-PRZ-SCO                             
                                STK-PRZ-LORDO STK-MSG                   
                                STK-PRIMA-VOLTA                         
                                STK-CAMBIO                              
      *> EURO1*                                                           
                                W-COMMON.                               
      *>                                                                  
      *>       IF STK-MSG NOT = SPACE                                     
      *>         DISPLAY STK-MSG
      *>         MOVE 1 TO JRUNC
      *>         STOP RUN JRUNC.                                          
       EX-CARICA-TABELLA.                                               
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>                                                                  
       STAMPA-RAPPORTINO. 
           PERFORM VARYING W-INDICE-3 FROM 1 BY 1 UNTIL 
            W-INDICE-3 > QT-NUM-ELEM-EFF OF PARTAB-ART
              DISPLAY 'M' TAB-ART OF ART-TAB-LETTI(W-INDICE-3)
           END-PERFORM                                                  
           CALL "RAPPRAI3" USING W-COMMON SQLCA                         
                                 TABELLA-ARTICOLI-LETTI PARTAB-ART      
                                 CONTO-IN-R D-CONTO-MEM                 
                                 TABELLA-NO-GIAC IND-CAPI-NO-GIAC       
      *> MAG6/7*                                                          
                                 MAG-INPUT-R.                           
       EX-STAMPA-RAPPORTINO.                                            
           EXIT.                                                        
      *>                                                                  
      *>       
      *> MAG6/7*                                                          
       VERIF-MAG.    
      *> VIBLO*
           DISPLAY "MAG provenienza (3 cifre)".                         
           ACCEPT MAG-INPUT.                                            
           IF MAG-INPUT NOT NUMERIC                                     
             PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
             DISPLAY "MAG non numerico"                                 
           ELSE                                                         
              IF NOT MAG-OK
               PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
               DISPLAY SUGG-MAG-DISP
      *>                                                                  
               MOVE SPACE TO MAG-INPUT.   
      *>      MOVE "003" TO MAG-INPUT.
      *> 
       EX-VERIF-MAG.                                                    
           EXIT.                                                        
      *> 
       
      *> Mag3_V/F*
      *>  Copiaincollato senza pieta` dalla procedurina precedente
       VERIF-F-V.   
      *> VIBLO*
      *>      DISPLAY "Stock Fallato o Valido? (F/V)".                    
      *>      ACCEPT F-V-INPUT.                                           
      *>      IF NOT (F-V-INPUT = "F" OR = "V" OR = "f" OR = "v")         
      *>        PERFORM 2 TIMES CALL "FAIBEEP" END-PERFORM
      *>        DISPLAY "Digitare o 'F' o 'V'"                            
      *>        MOVE SPACE TO F-V-INPUT
      *>      ELSE
      *>        IF F-V-INPUT = "v" OR = "V"
      *>          MOVE "V" TO F-V-INPUT
      *>        ELSE
      *>          MOVE "F" TO F-V-INPUT.
           MOVE "V" TO F-V-INPUT.
      *> 
       EX-VERIF-F-V.                                                    
           EXIT.
       
      *> PRZ-PUBBL*                                                       
      *> **************** ROUTINES SQL *******************                
      *>                                                                  
       TEST-ERR.                                                        
           MOVE SQLCODE TO SQL-STATUS.                                  
           IF SQLCODE = OK OR NO-MEMORY OR DEADLOCK OR NOT-FOUND        
              CONTINUE                                                  
           ELSE                                                         
           CANCEL "CALLSQLE"
              CALL "CALLSQLE" USING SQLCA PAR-ERR AREA-HL AREA-SI.      
       TEST-ERR-EX.                                                     
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       BEGIN-RC.                                                        
          EXECSQL SQL2                                                     
           MOVE "BEGIN WORK RC" TO ER-DESCRIZIONE                       
           PERFORM TEST-ERR THRU TEST-ERR-EX.                           
       BEGIN-RC-EX.                                                     
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       S-S-COMMIT.                                                      
          EXECSQL SQL3                                                    
           MOVE "COMMIT WORK" TO ER-DESCRIZIONE                         
           PERFORM TEST-ERR THRU TEST-ERR-EX.                           
       S-S-COMMIT-EX.                                                   
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
      *>  NO-DATGE                                                        
      *>  DECLARE-CURS-MOD.                                               
      *>      EXEC SQL                                                    
      *>        DECLARE CURSMOD CURSOR FOR                                
      *>            SELECT MODELLO_NEW,                                   
      *>                   ANNO,                                          
      *>                   STAG                                           
      *>              FROM ANAMAT.MODELLI                                 
      *>             WHERE                                                
      *>            SOCIETA         = :MODELLI-SOCIETA AND                
      *>            COD_ESTENSIONE  = :MODELLI-ESTENSIONE AND             
      *>            MODELLO_MAXIMA  = :MODELLI-MODELLO-MAXIMA             
      *>      END-EXEC.                                                   
      *>  DECLARE-CURS-MOD-EX.                                            
      *>      EXIT.                                                       
      *> *                                                                
      *> *                                                                
      *>  OPEN-CURS-MOD.                                                  
      *>      EXEC SQL                                                    
      *>           OPEN CURSMOD KEEP CURSOR                               
      *>      END-EXEC.                                                   
      *>      MOVE 'OPEN-CURS-MOD' TO ER-DESCRIZIONE.                     
      *>      PERFORM TEST-ERR THRU TEST-ERR-EX.                          
      *>  OPEN-CURS-MOD-EX.                                               
      *>      EXIT.                                                       
      *> *                                                                
      *> *                                                                
      *>  FETCH-SINGOLA-CURS-MOD.                                         
      *>      EXEC SQL                                                    
      *>        FETCH CURSMOD                                             
      *>        INTO :MODELLI-MODELLO-NEW,                                
      *>             :MODELLI-ANNO,                                       
      *>             :MODELLI-STAGIONE                                    
      *>      END-EXEC.                                                   
      *> *                                                                
      *>      IF SQLCODE NOT = OK                                         
      *>        MOVE 1 TO FLAG-CURSORE                                    
      *>      END-IF.                                                     
      *>  FETCH-SINGOLA-CURS-MOD-EX.                                      
      *>      EXIT.                                                       
      *> *                                                                
      *> *                                                                
      *>  CLOSE-CURS-MOD.                                                 
      *>      EXEC SQL                                                    
      *>           CLOSE CURSMOD                                          
      *>      END-EXEC.                                                   
      *>      MOVE 'CLOSE-CURS-MOD' TO ER-DESCRIZIONE.                    
      *>      PERFORM TEST-ERR THRU TEST-ERR-EX.                          
      *>  CLOSE-CURS-MOD-EX.                                              
      *>      EXIT.                                                       
      *>  NO-DATGE                                                        
      *>                                                                  
      *>                                                                  
      *> 
      *> 
       COMANDI-IGP-TESTA.
           MOVE COMIGP-PTXSETUP TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-PTXCFG2 TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-PTXEND TO REC-PEND.
           WRITE REC-PEND.
       EX-COMANDI-IGP-TESTA.
           EXIT.
      *> 
      *> 
       COMANDI-IGP-TESTA-1.
           MOVE COMIGP-LISTEN TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-CREATE TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-SCALEDOT TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-ALPHA TO REC-PEND.
           WRITE REC-PEND.
       EX-COMANDI-IGP-TESTA-1.
           EXIT.
      *> 
      *> 
       COMANDI-IGP-FINE-1.
           MOVE COMIGP-STOP TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-END TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-EXECUTE TO REC-PEND.
           WRITE REC-PEND.
           MOVE COMIGP-QUIET TO REC-PEND.
           WRITE REC-PEND.
       EX-COMANDI-IGP-FINE-1.
           EXIT.
      *> 
      *> 
       SCRIVI-RECORD-IGP.
           MOVE SPACES TO REC-PEND.
      *> 
           MOVE ROW-IGP TO TEMP-X-IN.
           PERFORM TOGLI-ZERI THRU EX-TOGLI-ZERI.
           MOVE TEMP-X-OUT TO ROW-X-IGP.
      *> 
           MOVE COL-IGP TO TEMP-X-IN.
           PERFORM TOGLI-ZERI THRU EX-TOGLI-ZERI.
           MOVE TEMP-X-OUT TO COL-X-IGP.
      *> 
           STRING "C12;"        DELIMITED BY SIZE
                  ROW-X-IGP     DELIMITED BY SPACE
                  ";"           DELIMITED BY SIZE
                  COL-X-IGP     DELIMITED BY SPACE
                  ";"           DELIMITED BY SIZE
                  VERT-EXP-IGP  DELIMITED BY SIZE
                  ";"           DELIMITED BY SIZE
                  ORIZ-EXP-IGP  DELIMITED BY SIZE
                  ';"'          DELIMITED BY SIZE
                  RIGA-PEND-COM DELIMITED BY SIZE
                  '"'           DELIMITED BY SIZE
             INTO REC-PEND.
      *> 
           WRITE REC-PEND.
       EX-SCRIVI-RECORD-IGP.
           EXIT.
      *> 
      *> 
       TOGLI-ZERI.
           MOVE 0 TO PRIMO-NONZERO.
           PERFORM VARYING K FROM 1 BY 1
             UNTIL K > 4 OR PRIMO-NONZERO <> 0
               IF TEMP-EL-X OF TEMP-X-IN(K) <> "0"
                   MOVE K TO PRIMO-NONZERO
               END-IF
           END-PERFORM.
      *> 
           IF PRIMO-NONZERO <> 0
             UNSTRING TEMP-X-IN INTO TEMP-X-OUT
                      WITH POINTER PRIMO-NONZERO
           ELSE
             MOVE TEMP-X-IN TO TEMP-X-OUT
           END-IF.
       EX-TOGLI-ZERI.
           EXIT.
      *> 
      *> 
      *> MOVSKU 
       INSERISCI-MOVSKU.
      *> 
       MOVE ELEM-TAB-SING(IND-BARUNI) TO ELEMENTO-SINGOLI.
      *> 
       MOVE '1' TO OUTPUT-VAL-A    
       MOVE SPACES TO OUTPUT-VAL-B  
       PERFORM CHIAMA-GETBARUNI THRU CHIAMA-GETBARUNI-EX.
      *>     
       PERFORM CONVERTI-BARCODE THRU EX-CONVERTI-BARCODE.
      *>   
       MOVE C-MAT-TRANS-RID TO MOVSKU-CMAT.
       MOVE TAGLIA OF C-MAT-A-BARRE TO NTG-IN
       MOVE FUNCTION idxtg(NTG-IN)
                                TO MOVSKU-TG.
      *>   
       IF OUTPUT-VAL-A = '0'
          MOVE OUTPUT-VAL-B-OK TO MOVSKU-BARUNI
       ELSE
          STOP RUN
       END-IF. 
      *>   
       PERFORM INSERT-SKU-E-SING THRU EX-INSERT-SKU-E-SING.
      *>   
       MOVE MOVSKU-BARUNI(1:8)          TO MOVSKU-SKU
       MOVE RIF-BOLLA-DDT TO  MOVSKU-RIF-INTERNO.
       MOVE CONTO-IN-R TO MOVSKU-CONTO. 
       MOVE MAG-INPUT-R TO MOVSKU-MAG.     
       MOVE 0 TO MOVSKU-IS-BARUNI-READ.
       MOVE 0 TO MOVSKU-IS-BARUNI-CERTIFIED.
       MOVE MOVSKU-BARUNI(1:8) TO MOVSKU-SKU-FATTURAZIONE.
      *>   
      *>  NO-DATGE                                                        
      *> PERFORM S-SET-1 THRU S-SET-1-EX. 
      *>  NO-DATGE                                                        
       
          EXECSQL SQL4                                                     
           MOVE "Insert MOV-SKU " TO ER-DESCRIZIONE                     
           PERFORM TEST-ERR THRU TEST-ERR-EX.      
      *>   
       INSERISCI-MOVSKU-EX.
           EXIT.
      *>   
       CONVERTI-BARCODE.                                                
           MOVE ZEROS                                                   
             TO C-MAT-COM.                                  
      *>                                                                  
           MOVE C-MAT-SING                                              
             TO C-MAT-A-BARRE-RID.                                    
      *>       
           MOVE MODELLO OF  C-MAT-A-BARRE                               
             TO MODELLO      OF      C-MAT-COM.                         
           MOVE VESTIBILITA OF  C-MAT-A-BARRE                           
             TO VEST-A       OF      C-MAT-COM.                         
           MOVE PEZZO   OF  C-MAT-A-BARRE                               
             TO PEZZO-A      OF      C-MAT-COM.                         
           MOVE PREFBC-V-F OF  C-MAT-A-BARRE                            
             TO PREFISSO-V-F OF      C-MAT-COM.                         
           MOVE SOC-BC-MOD OF  C-MAT-A-BARRE                            
             TO SOCIETA-MOD  OF      C-MAT-COM.                         
           MOVE VARIANTE-COL OF  C-MAT-A-BARRE                          
             TO COLORE       OF      C-MAT-COM.                         
       EX-CONVERTI-BARCODE.                                             
           EXIT.          
      *> 
       CHIAMA-GETBARUNI.
      *>         
           MOVE C-MAT-SING TO INPUT-VAL
           MOVE RIF-BOLLA-DDT TO INPUT-VAL-B
           MOVE "READVE3" TO INPUT-VAL-C
      *>      
           CALL "PYTHON" USING "ret_sku" "mod_sku_from_cobol" 
                               PY-INPUT-REC
                               PY-OUTPUT-REC.
           IF OUTPUT-VAL-A = '1'                    
             DISPLAY OUTPUT-VAL-B.
      *> 
       CHIAMA-GETBARUNI-EX.
           EXIT.
      *> 
       INSERT-SKU-E-SING.  
      *>                 
           MOVE "K2" TO QT-FUNZIONE OF PARTAB-SING                      
               CANCEL "QTABEL"
           CALL "QTABEL" USING PARTAB-SING 
                                TABELLA-SINGOLI               
                                  ELEMENTO-SINGOLI                      
      *> 
           IF QT-STATO OF PARTAB-SING = 0
              MOVE OUTPUT-VAL-B-OK TO SKU-SING
              MOVE SKU-SING TO 
                      ELEM-TAB-SING(QT-INDEX-ELEM OF PARTAB-SING)(24:13)
           ELSE
              MOVE QT-STATO OF PARTAB-SING TO ERR-DISP
              DISPLAY "ERR UPDATE QTABEL " ERR-DISP                     
                        " - INSERISCI-SKU"                              
              CANCEL "QDBERROR"
              CALL "QDBERROR" USING W-COMMON                            
           END-IF.       
      *>        
       EX-INSERT-SKU-E-SING.
           EXIT.
      *>   
      *>  NO-DATGE                                                        
      *> **********connessione a DATGE*******************      
      *>  S-SET-2.                                                        
      *>         EXEC SQL                                                 
      *>            SET CONNECTION 'DB2'                                  
      *>         END-EXEC.                                                
      *>  S-SET-2-EX.                                                     
      *>      EXIT.
      *> * NO-DATGE                                                       
      *> 
      *> **********connessione a MAGAUTO*****************       
      *> S-SET-1.                                                         
      *>         EXEC SQL                                                 
      *>            SET CONNECTION 'DB1'                                  
      *>         END-EXEC.                                                
      *>  S-SET-1-EX.                                                     
      *>      EXIT.                             
      *>           
      *> MOVSKU         
       
      *> 
      *> ASOLOB2C*                                                        
       CARICA-B2C-NO-DT.         
      *> 
           PERFORM WITH TEST AFTER                                      
                   UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK           
                   PERFORM BEGIN-RC THRU                                
                           BEGIN-RC-EX                                  
                   IF SQLCODE = OK                                      
                           PERFORM SE-SELECT-NEGOZIO-CATEG              
                              THRU SE-SELECT-NEGOZIO-CATEG-EX           
                   END-IF                                               
           END-PERFORM.                                                 
           IF SQLCODE = NOT-FOUND                                       
              DISPLAY "NESSUNA NEGOZIO CATEGORIA TROVATA"
                                      UPON SYSERR
              MOVE 0 TO NUM-B2C-NO-DT
            ELSE                                                        
              MOVE SQLERRD (3) TO NUM-B2C-NO-DT
            END-IF.
      *> 
           PERFORM S-S-COMMIT THRU S-S-COMMIT-EX.   
         
      *>      DISPLAY SPACE.
      *>      DISPLAY "TAB-B2C-NO-DT:  " NUM-B2C-NO-DT
      *>      PERFORM VARYING IND-B2C-NO-DT FROM 1 BY 1 
      *>              UNTIL IND-B2C-NO-DT > NUM-B2C-NO-DT
      *>        DISPLAY MAG-B2C-NO-DT(IND-B2C-NO-DT)
      *>      END-PERFORM. 
       
       EX-CARICA-B2C-NO-DT.
           EXIT.                                                        
      *>                                                                  
      *>                                                                  
       SE-SELECT-NEGOZIO-CATEG.                                         
          EXECSQL SQL5                                                     
           MOVE "SELECT NEGOZIO-CATEG  " TO ER-DESCRIZIONE              
           IF SQLCODE NOT = MULTIPLE-ROWS                               
              PERFORM TEST-ERR THRU TEST-ERR-EX.                        
       SE-SELECT-NEGOZIO-CATEG-EX.                                      
           EXIT.   
       
      *> ASOLOB2C*                                                        
       
       
       
      *> ASOLOB2C*                                                        
       
       RIVALUTA-COSTO-ANAMAT.
            PERFORM CERCA-B2C-NO-DT THRU EX-CERCA-B2C-NO-DT.
      *> 
           PERFORM RICERCA-COSTO-ANAMAT THRU EX-RICERCA-COSTO-ANAMAT.   
       
       EX-RIVALUTA-COSTO-ANAMAT.
                                        
       CERCA-B2C-NO-DT.
           PERFORM VARYING IND-B2C-NO-DT FROM 1 BY 1
                UNTIL IND-B2C-NO-DT > NUM-B2C-NO-DT OR
                    ANACST-MAG-COM = MAG-B2C-NO-DT(IND-B2C-NO-DT)
              CONTINUE
           END-PERFORM.
           IF IND-B2C-NO-DT > NUM-B2C-NO-DT 
             MOVE 'N' TO FLAG-B2C-NO-DT
           ELSE
             MOVE 'S' TO FLAG-B2C-NO-DT
           END-IF.  
       EX-CERCA-B2C-NO-DT.
           EXIT.    
           
       RICERCA-COSTO-ANAMAT.      
      *> 
           MOVE ANACST-C-MAT-COM TO ANACST-C-MAT.
           MOVE 0 TO ANACST-CST-COM
           PERFORM WITH TEST AFTER                                      
                   UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK           
                   PERFORM BEGIN-RC THRU                                
                           BEGIN-RC-EX                                  
                   IF SQLCODE = OK                                      
                           PERFORM SE-SELECT-ANAMAT-CST                 
                              THRU SE-SELECT-ANAMAT-CST-EX              
                   END-IF                                               
           END-PERFORM.                                                 
           IF SQLCODE = OK   
       
             IF B2C-NO-DT
               MOVE ANACST-CST-STD-2 TO ANACST-CST-COM
             ELSE
               MOVE ANACST-CST-STD TO ANACST-CST-COM
             END-IF
             
           END-IF.
      *> 
           PERFORM S-S-COMMIT THRU S-S-COMMIT-EX. 
       EX-RICERCA-COSTO-ANAMAT.
           EXIT.
       
       SE-SELECT-ANAMAT-CST.
          EXECSQL SQL6                                           
      *> 
           MOVE "SELECT ANAMAT_CST   " TO ER-DESCRIZIONE                
           PERFORM TEST-ERR THRU TEST-ERR-EX.  
       SE-SELECT-ANAMAT-CST-EX.
           EXIT.
           
       
      *> ASOLOB2C*                                                        
      *> 
       
      *> UNICODDT*                                                        
      *> ================================================================*
       INIT-PAR-TAB-UNICO-DDT.
      *> ================================================================*
          MOVE   16 TO QT-LL-ELEM       OF PAR-TAB-UNICO-DDT.
          MOVE    4 TO QT-LL-KEY        OF PAR-TAB-UNICO-DDT.
          MOVE    1 TO QT-ADDR-KEY      OF PAR-TAB-UNICO-DDT.
          MOVE 1980 TO QT-NUM-ELEM-MAX  OF PAR-TAB-UNICO-DDT.
          MOVE    0 TO QT-NUM-ELEM-EFF  OF PAR-TAB-UNICO-DDT.
          INITIALIZE TAB-UNICO-DDT.
       EX-INIT-PAR-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
       LEGGI-TAB-UNICO-DDT.
          MOVE "K2" TO QT-FUNZIONE OF PAR-TAB-UNICO-DDT.
          CANCEL "QTABELXL"
          CALL "QTABELXL" USING PAR-TAB-UNICO-DDT 
                              TAB-UNICO-DDT 
                              DEP-TAB-UNICO-DDT.
          IF QT-STATO OF PAR-TAB-UNICO-DDT = 0
              PERFORM PRENDI-DEP-TAB-UNICO-DDT THRU 
                   EX-PRENDI-DEP-TAB-UNICO-DDT
          ELSE
              INITIALIZE DATI-TAB-UNICO-DDT.
       EX-LEGGI-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
       PRENDI-DEP-TAB-UNICO-DDT.
          MOVE ELE-TAB-UNICO-DDT(QT-INDEX-ELEM OF PAR-TAB-UNICO-DDT) 
            TO DEP-TAB-UNICO-DDT.
       EX-PRENDI-DEP-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
       AGG-TAB-UNICO-DDT.
          IF QT-STATO OF PAR-TAB-UNICO-DDT = 0
              PERFORM RIMETTI-DEP-TAB-UNICO-DDT 
                 THRU EX-RIMETTI-DEP-TAB-UNICO-DDT
          ELSE
              PERFORM INS-TAB-UNICO-DDT THRU EX-INS-TAB-UNICO-DDT.
       EX-AGG-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
       RIMETTI-DEP-TAB-UNICO-DDT.
          MOVE DEP-TAB-UNICO-DDT 
            TO ELE-TAB-UNICO-DDT(QT-INDEX-ELEM OF PAR-TAB-UNICO-DDT).
       EX-RIMETTI-DEP-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
       INS-TAB-UNICO-DDT.
          MOVE "K1"   TO QT-FUNZIONE OF PAR-TAB-UNICO-DDT.
          CANCEL "QTABELXL"
          CALL "QTABELXL" USING PAR-TAB-UNICO-DDT 
                              TAB-UNICO-DDT 
                              DEP-TAB-UNICO-DDT.
                              
      *>     DISPLAY QT-STATO OF PAR-TAB-UNICO-DDT.                       
          IF QT-STATO OF PAR-TAB-UNICO-DDT NOT = 0
             
              IF QT-STATO OF PAR-TAB-UNICO-DDT = -2
                  DISPLAY "AS=" TAB-AS " CL=" TAB-CL 
                  " GIA' INSERITI CON CAPI " TAB-MAX-CAPI
              ELSE
                  IF QT-STATO OF PAR-TAB-UNICO-DDT = -1
                      DISPLAY "TAB-UNICO-DDT PIENA >> ALLARGARE"
                  ELSE
                     MOVE QT-STATO OF PAR-TAB-UNICO-DDT 
                       TO ERR-DISP
                     DISPLAY "ERR k1 QTABELXL " ERR-DISP                
                               " TAB-TAB-UNICO-DDT"                     
                     CANCEL "QDBERROR"
                     CALL "QDBERROR" USING W-COMMON .                   
       EX-INS-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
      *> ----------------------------------------------------------------*
       MOSTRA-TAB-UNICO-DDT.
      *>     DISPLAY "TAB-UNICO-DDT".
          PERFORM M-DEP-TAB-UNICO-DDT THRU 
               EX-M-DEP-TAB-UNICO-DDT
               VARYING QT-INDEX-ELEM   OF PAR-TAB-UNICO-DDT
               FROM 1 BY 1
               UNTIL   QT-INDEX-ELEM   OF PAR-TAB-UNICO-DDT >
                       QT-NUM-ELEM-EFF OF PAR-TAB-UNICO-DDT.
          DISPLAY " ".
       EX-MOSTRA-TAB-UNICO-DDT. EXIT.
      *> ----------------------------------------------------------------*
       M-DEP-TAB-UNICO-DDT.
          PERFORM PRENDI-DEP-TAB-UNICO-DDT THRU 
               EX-PRENDI-DEP-TAB-UNICO-DDT.
          IF XD = "S" 
              DISPLAY DEP-TAB-UNICO-DDT
          ELSE     
              DISPLAY 
      *>            "KEY: "
                  "AS = "  TAB-AS           OF DEP-TAB-UNICO-DDT "  "
                  "CL = "  TAB-CL           OF DEP-TAB-UNICO-DDT "  "
      *>            "DATI: "
                  "MAX-CAPI = " TAB-MAX-CAPI OF DEP-TAB-UNICO-DDT "  "
      *>             "CAPI-LETTI = " 
      *>                    TAB-CAPI-LETTI OF DEP-TAB-UNICO-DDT " "
                  .
       EX-M-DEP-TAB-UNICO-DDT. EXIT.
       
       CICLO-DISIMPEGNO.
          PERFORM
               VARYING QT-INDEX-ELEM   OF PAR-TAB-UNICO-DDT
               FROM 1 BY 1
               UNTIL   QT-INDEX-ELEM   OF PAR-TAB-UNICO-DDT >
                       QT-NUM-ELEM-EFF OF PAR-TAB-UNICO-DDT
             PERFORM PRENDI-DEP-TAB-UNICO-DDT
                THRU EX-PRENDI-DEP-TAB-UNICO-DDT
             DISPLAY DEP-TAB-UNICO-DDT
             MOVE MAG-INPUT TO MAG-DISIMPEGNA
             MOVE SOCIETA-INPUT TO FORN-DISIMPEGNA
             MOVE TAB-AS TO AS-DISIMPEGNA(1)
             MOVE TAB-CL TO CLASSE-DISIMPEGNA(1)
             PERFORM CALL-DISIMPEGNA-MAG THRU EX-CALL-DISIMPEGNA-MAG
             IF NOT PY-OUTPUT-DISIMPEGNO-OK
                DISPLAY "ERRORE DISIMPEGNO!!!"
                STOP RUN
             END-IF
          END-PERFORM.
       EX-CICLO-DISIMPEGNO. EXIT.
      *> ----------------------------------------------------------------*
      *> UNICODDT*                                                        