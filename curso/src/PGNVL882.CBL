      *****************************************************************
      * Program name:    PGNVL882                               
      * Original author: Anderson Nascimento                           
      * Purpose: Trabalhando com constantes e Booleanos
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGNVL882.
         AUTHOR. Anderson Abreu do Nascimento. 
         INSTALLATION. COBOL DEVELOPMENT CENTER. 
         DATE-WRITTEN. 31/05/2022. 
         DATE-COMPILED. 31/05/2022. 
         SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION. 
      *****************************************************************
       DATA DIVISION. 
         WORKING-STORAGE SECTION. 
         01 WS-REG.
            05 WS-NOME                         PIC X(30).
            05 WS-BRASILEIRA                   PIC X.
               88 WS-BRASIL                    VALUE 'S' FALSE 'N'.
            05 WS-CAMBIO                       PIC 9.
               88 WS-TP-CAMBIO                 VALUE 1 THRU 3.
      *****************************************************************
       PROCEDURE DIVISION.
         MAIN-PROCEDURE.
           DISPLAY 'Informe o nome do operador: '
           ACCEPT WS-NOME
           DISPLAY 'Cidadão brasileiro? <S/N>: '
           ACCEPT WS-BRASILEIRA 
           DISPLAY 'Informe a moeda de operação: '
           DISPLAY '1 - Real Brasileiro'
           DISPLAY '2 - Dólar Americano'
           DISPLAY '3 - EURO'
           ACCEPT WS-CAMBIO 

           DISPLAY 'Resultados'
           DISPLAY 'Operador: ' WS-NOME 

           IF WS-BRASIL THEN
              DISPLAY 'Cidadão Brasileiro'
           ELSE
              DISPLAY 'Cidadão Não Brasileiro'
           END-IF

           EVALUATE WS-CAMBIO 
               WHEN 1
                 DISPLAY 'MOEDA: Real Brasileiro'
               WHEN 2
                 DISPLAY 'MOEDA: Dólar Americano'
               WHEN 3
                 DISPLAY 'MOEDA: EURO'
               WHEN OTHER
                 DISPLAY 'MOEDA: Inválida'
           END-EVALUATE           

           STOP RUN.
       END PROGRAM PGNVL882.
