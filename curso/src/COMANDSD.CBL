      *****************************************************************
      * Program name:    COMANDSD                               
      * Original author: Anderson Nascimento                           
      *
      * Maintenence Log                                              
      * Date       Author              Maintenance Requirement         
      * ---------- ------------------- -------------------------------- 
      * 02/05/2022 Anderson Nascimento Estruturas de decisão combinadas         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  COMANDSD.
       AUTHOR. Anderson Nascimento. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 02/05/2022. 
       DATE-COMPILED. 02/05/2022. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       DATA DIVISION. 
      *****************************************************************
       FILE SECTION. 
       WORKING-STORAGE SECTION. 
       77  WS-MES                              PIC 99 VALUE ZEROS.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY 'INFORME UM NUMERO DE MÊS'
           ACCEPT WS-MES

           IF NOT (WS-MES IS NUMERIC) THEN
              CONTINUE
           ELSE
              EVALUATE WS-MES 
                 WHEN 01
                    DISPLAY 'JANEIRO'
                 WHEN 02
                    DISPLAY 'FEVEREIRO'
                 WHEN 03
                    DISPLAY 'MARÇO'
                 WHEN OTHER 
                    IF WS-MES > 12 OR WS-MES < 1 THEN
                       DISPLAY 'MÊS INVÁLIDO!'
                    ELSE
                       DISPLAY 'MÊS FORA DO RANGE!'
                    END-IF
              END-EVALUATE
           END-IF.

       P900-FIM.
           STOP RUN.
       END PROGRAM COMANDSD.
