000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. IDSAMPLE.
000300 ENVIRONMENT DIVISION.
000400 PROCEDURE DIVISION.
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