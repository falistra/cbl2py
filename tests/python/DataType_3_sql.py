
SQL0 = """
                                                 
       
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


            