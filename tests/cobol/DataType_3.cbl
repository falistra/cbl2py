       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       
       DATA DIVISION.
          WORKING-STORAGE SECTION.
          01 WS-NUM1 PIC 99V9 VALUE IS 3.5.
          01 WS-NAME PIC A(6) VALUE 'ABCD'.
          01 WS-ID PIC 99 VALUE ZERO.

009900 01 REC-BC.                                                               
010000  05 C-MAT-S             PIC 9(13).   
        05 T-1                 PIC X.                   
010100  05 TAGLIA-S            PIC 9.                
        05 T-2                 PIC X.          
010200  05 MAG-S               PIC 999.  
        05 T-3                 PIC X.                    
010300  05 SETTORE-S           PIC X(4).  
        05 T-4                 PIC X.                     
010400  05 NOME-S              PIC X(7).  
        05 T-5                 PIC X.                     
010500  05 PREZZO-S            PIC 9(8).  
        05 T-6                 PIC X.                     
010600  05 NOME-F-S            PIC X(15).  
        05 T-7                 PIC X.                    
010700  05 COL-F-S             PIC X(5).   
        05 T-8                 PIC X.                    
010800  05 TG-OUT-S            PIC XX.   
        05 T-9                 PIC X.
        05 BARUNI-S            PIC X(13).    

          COPY NTG. 
       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE ANACST.IF END-EXEC.
       EXEC SQL END DECLARE SECTION END-EXEC. 
           
       
       PROCEDURE DIVISION.
          DISPLAY "WS-NUM1 : "WS-NUM1.
          DISPLAY "WS-NAME : "WS-NAME.
          DISPLAY "WS-ID   : "WS-ID.

075530 SE-SELECT-NEGOZIO-CATEG.                                                        
075540     EXEC SQL  
075550          BULK SELECT NEGOZIO                                               
075570          INTO :TAB-B2C-NO-DT                                             
075580          FROM NEGOZIO_ANAG_CATEGORIA 
                   JOIN NEGOZIO_CATEGORIA USING (ID_CATEGORIA)
                   where DESC_CATEGORIA = 'NEGOZI_ITALIA_B2C_SOC' 
                   order by NEGOZIO                                               
075610     END-EXEC                                                             
075620     MOVE "SELECT NEGOZIO-CATEG  " TO ER-DESCRIZIONE                          
075630     IF SQLCODE NOT = MULTIPLE-ROWS                                       
075640        PERFORM TEST-ERR THRU TEST-ERR-EX.                                
075650 SE-SELECT-NEGOZIO-CATEG-EX.                                                     
075660     EXIT.   


        SELEZIONA-PREZZO-DBG.
           PERFORM WITH TEST AFTER                                              
           UNTIL SQLCODE <> NO-MEMORY AND <> DEADLOCK                           
             PERFORM BEGIN-RC THRU BEGIN-RC-EX                                  
             IF SQLCODE = OK                                                    
               EXEC SQL                                                         

               SELECT 
                   P.prezzo
                INTO :CC-PREZZO-DBG
                FROM prezzi_modelli_dbg P
                JOIN anagrafica_modelli_dbg M
                    ON  (M.SOCIETA = P.SOCIETA)
                    AND (P.MODELLO = M.MODELLO)
                JOIN anagrafica_modelli_barcode_negozio_dbg B
                    ON  (B.SOCIETA = P.SOCIETA) 
                    AND (P.MODELLO = B.MODELLO)
            
                WHERE
                    P.modello = :CC-C-MAT 
                    AND M.societa = :CC-SOCIETA                             *'MM'
                    AND P.f_listino_rif = :CC-LISTINO                        *1
                    AND P.tipo_prezzo = :CC-TIPO-PREZZO                     *"V"

               END-EXEC 
             END-IF                                                        
             MOVE SQLCODE TO SQLCODE-MEM                                        
             PERFORM S-S-COMMIT THRU S-S-COMMIT-EX                                  
           END-PERFORM.                                                         
       EX-SELEZIONA-PREZZO-DBG. EXIT.



       STOP RUN.