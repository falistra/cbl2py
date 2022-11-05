000100 IDENTIFICATION DIVISION.
000101*Un innocuo commento
000101*Un innocuo commento
000101*Un innocuo commento
000101*Un innocuo commento
000200 PROGRAM-ID. IDSAMPLE.
000300 ENVIRONMENT DIVISION.
000400 PROCEDURE DIVISION.
000101*Un innocuo commento
055800 DISPLAY "PROGR. SESS. ==> ".                                          
055801 DISPLAY "Vuoi scalare la Giacenza Virtuale ? (S o N )  ".
000101*Un innocuo commento
055802 ACCEPT FLAG-VIRTUALE.
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
055800 DISPLAY "PROGR. SESS. ==> ".                                          
055801 DISPLAY "Vuoi scalare la Giacenza Virtuale ? (S o N )  ".
057400 EX-ELABORA.                                                              
057500 EXIT.


000600 STOP RUN.