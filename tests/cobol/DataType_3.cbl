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
       
       PROCEDURE DIVISION.
          DISPLAY "WS-NUM1 : "WS-NUM1.
          DISPLAY "WS-NAME : "WS-NAME.
          DISPLAY "WS-ID   : "WS-ID.
       STOP RUN.