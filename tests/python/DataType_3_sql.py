
# Cobol source line :  32
SQL0 = """  BEGIN DECLARE SECTION ."""
# Cobol source line :  34
SQL1 = """  END DECLARE SECTION ."""
# Cobol source line :  43
SQL2 = """   
                BULK SELECT NEGOZIO                                     
                INTO :TAB-B2C-NO-DT                                     
                FROM NEGOZIO_ANAG_CATEGORIA 
                   JOIN NEGOZIO_CATEGORIA USING (ID_CATEGORIA)
                   where DESC_CATEGORIA = 'NEGOZI_ITALIA_B2C_SOC' 
                   order by NEGOZIO                                     
           """
# Cobol source line :  63
SQL3 = """                                                  
       
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
                    AND M.societa = :CC-SOCIETA                         
                    AND P.f_listino_rif = :CC-LISTINO                   
                    AND P.tipo_prezzo = :CC-TIPO-PREZZO                 
       
               """