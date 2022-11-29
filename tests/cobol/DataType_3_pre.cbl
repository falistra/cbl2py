       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       
       DATA DIVISION.
          WORKING-STORAGE SECTION.
          01 WS-NUM1 PIC 99V9 VALUE IS 3.5.
          01 WS-NAME PIC A(6) VALUE 'ABCD'.
          01 WS-ID PIC 99 VALUE ZERO.
       
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
       
      *>      ===PREPROCESSOR==>COPY NTG START
       01 NTG-NTG PIC S9(4) COMP VALUE 10.
       01 NTG-IN PIC S9(4) COMP.
       01 NTG-OUT PIC S9(4) COMP.
      *>      ===PREPROCESSOR==>COPY NTG END

 
          EXECSQL SQL1
      *>      ===PREPROCESSOR==>COPY ANACST.IF START
      *>      
      *>                 tav. ANAMAT_CST  (ANACST.IF)                 
       01 ANACST-C-MAT                    PIC S9(15) COMP-3.            
       01 ANACST-CST-STD                  PIC S9(9) COMP.              
       01 ANACST-CST-STD-2                PIC S9(9) COMP.
       01 ANACST-TS-CST                   PIC S9(15) COMP-3.
      *>                     
       
      *>      ===PREPROCESSOR==>COPY ANACST.IF END


          EXECSQL SQL2 
           
       
       PROCEDURE DIVISION.
          DISPLAY "WS-NUM1 : "WS-NUM1.
          DISPLAY "WS-NAME : "WS-NAME.
          DISPLAY "WS-ID   : "WS-ID.
       
       SE-SELECT-NEGOZIO-CATEG.                                         
          EXECSQL SQL3                                                     
           MOVE "SELECT NEGOZIO-CATEG  " TO ER-DESCRIZIONE              
           IF SQLCODE NOT = MULTIPLE-ROWS                               
              PERFORM TEST-ERR THRU TEST-ERR-EX.                        
       SE-SELECT-NEGOZIO-CATEG-EX.                                      
           EXIT.   
       
       
        SELEZIONA-PREZZO-DBG.
           PERFORM WITH TEST AFTER                                      
           UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK                   
             PERFORM BEGIN-RC THRU BEGIN-RC-EX                          
             IF SQLCODE = OK                                            
          EXECSQL SQL4 
             END-IF                                                     
             MOVE SQLCODE TO SQLCODE-MEM                                
             PERFORM S-S-COMMIT THRU S-S-COMMIT-EX                      
           END-PERFORM.                                                 
       EX-SELEZIONA-PREZZO-DBG. EXIT.
       
       
       
       STOP RUN.