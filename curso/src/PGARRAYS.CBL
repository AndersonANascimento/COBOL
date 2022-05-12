      *****************************************************************
      * Program name:    PGARRAYS                               
      * Original author: Anderson Nascimento                                
      * Purpose: Apresentar arrays no COBOL
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGARRAYS.
         AUTHOR. Anderson Nascimento. 
         INSTALLATION. COBOL DEVELOPMENT CENTER. 
         DATE-WRITTEN. 10/05/2022. 
         DATE-COMPILED. 10/05/2022. 
         SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION.
         CONFIGURATION SECTION.
          SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA. 
      *****************************************************************
       DATA DIVISION.
         WORKING-STORAGE SECTION. 
         01 WS-DIAS-DA-SEMANA.
            05 FILLER                         PIC X(8) VALUE '1DOMINGO'.
            05 FILLER                         PIC X(64) VALUE SPACES.
            05 FILLER                         PIC X(8) VALUE '2SEGUNDA'.
            05 FILLER                         PIC X(64) VALUE SPACES.
            05 FILLER                         PIC X(8) VALUE '3TERÇA'.
            05 FILLER                         PIC X(64) VALUE SPACES.
            05 FILLER                         PIC X(8) VALUE '4QUARTA'.
            05 FILLER                         PIC X(64) VALUE SPACES.
            05 FILLER                         PIC X(8) VALUE '5QUINTA'.
            05 FILLER                         PIC X(64) VALUE SPACES.
            05 FILLER                         PIC X(8) VALUE '6SEXTA'.
            05 FILLER                         PIC X(64) VALUE SPACES.
            05 FILLER                         PIC X(8) VALUE '7SÁBADO'.
            05 FILLER                         PIC X(64) VALUE SPACES.
         01 FILLER REDEFINES WS-DIAS-DA-SEMANA OCCURS 7 TIMES.
            05 WS-NUMERO-DIA                  PIC 9.
            05 WS-NOME-DIA                    PIC X(7).
            05 WS-EVENTO OCCURS 4 TIMES.
               10 WS-NUM-EVENTO               PIC 9.
               10 WS-DESC-EVENTO              PIC X(15).
      *
         01 CT-CONTADORES.
            05 FILLER                         PIC 9(7) VALUE ZEROS.
         01 FILLER REDEFINES CT-CONTADORES OCCURS 7 TIMES.
            05 CT-EV-D                        PIC 9.
      *
         01 WS-CONTRATO.
            05 WS-REG-FIN.
               10 WS-NUM-CONTRATO             PIC 9(5).
               10 WS-NUM-PRESTACOES           PIC 9(3).
               10 WS-PRESTACOES OCCURS 1 TO 12 TIMES
                                DEPENDING ON WS-NUM-PRESTACOES
                                              PIC 9(5)V99.
         77 WS-IND                            PIC 9(3).
         77 WS-IND-EV                         PIC 9(3).
         77 WS-VLR-AUX                        PIC 9(5)V99.
         77 WS-SAIDA                          PIC X.
         77 TT-PARC                           PIC 999 VALUE 12.
         77 TT-DIAS                           PIC 9 VALUE 7.
         77 TT-EVEN                           PIC 9 VALUE 4.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM P-ARRAY-DINAMICO
           PERFORM P-ARRAY-BIDIMEN
           PERFORM P-ARRAY-ESTATICO
           PERFORM P-FIM.
      *    
       P-FIM.
           STOP RUN.
      *    
       P-ARRAY-DINAMICO.
           DISPLAY ' **** PROGRAMA DE ARRAY (DINÂMICO) ****'

           DISPLAY 'Informe o nº de prestações: '
           ACCEPT WS-NUM-PRESTACOES
      *    
           DISPLAY 'Informe o valor da prestação: '
           ACCEPT WS-VLR-AUX
      *
           MOVE ZERO                           TO WS-IND
           IF WS-NUM-PRESTACOES GREATER THAN TT-PARC THEN
              DISPLAY 'Nº inválido!'
              PERFORM P-FIM
           ELSE
              PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND GREATER
                                                       WS-NUM-PRESTACOES
                MOVE WS-VLR-AUX                TO WS-PRESTACOES(WS-IND)
              END-PERFORM
           END-IF
      *    *** LENDO O ARRAY
           MOVE ZERO                           TO WS-IND
           DISPLAY 'Nº PARC    VALOR'
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND GREATER
                                                    WS-NUM-PRESTACOES
              DISPLAY '    ' WS-IND '   ' WS-PRESTACOES(WS-IND)
           END-PERFORM.
      *
       P-ARRAY-BIDIMEN.
           DISPLAY ' **** PROGRAMA DE ARRAY (BIDIMENSIONAL) ****'
           MOVE ZERO                           TO WS-IND
                                                  WS-IND-EV
           PERFORM UNTIL WS-SAIDA = 'S' OR 's'
             ADD 1                             TO WS-IND-EV
             DISPLAY 'Informe o nº do dia:'
             ACCEPT WS-IND
             ADD 1                             TO CT-EV-D(WS-IND)
             DISPLAY 'Informe o nº do evento:'
             ACCEPT WS-NUM-EVENTO(WS-IND, CT-EV-D(WS-IND))
             DISPLAY 'Informe a descrição do evento:'
             ACCEPT WS-DESC-EVENTO(WS-IND, CT-EV-D(WS-IND))
             DISPLAY 'Sair? (S|s)'
             ACCEPT WS-SAIDA
           END-PERFORM.

       P-ARRAY-ESTATICO.
           DISPLAY ' **** PROGRAMA DE ARRAY (ESTÁTICO) ****'
      *
           DISPLAY 'Nº   NOME'
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND > TT-DIAS  
             DISPLAY WS-NUMERO-DIA(WS-IND) '    ' WS-NOME-DIA(WS-IND)
             PERFORM VARYING WS-IND-EV FROM 1 BY 1 
                                       UNTIL WS-IND-EV > TT-EVEN
               IF WS-NUM-EVENTO(WS-IND, WS-IND-EV) > 0 THEN
                  DISPLAY 'EVENTO: '
                          WS-NUM-EVENTO(WS-IND, WS-IND-EV) ' - '
                          WS-DESC-EVENTO(WS-IND, WS-IND-EV)
               END-IF
             END-PERFORM
           END-PERFORM.
      *    
       END PROGRAM PGARRAYS.
