      *****************************************************************
      * Program name:    PGEXE003                               
      * Original author: Anderson Nascimento
      *
      * Maintenence Log                                              
      * Date       Author               Maintenance Requirement
      * ---------- -------------------  -------------------------------
      * 23/03/2022 Anderson Nascimento  Created for COBOL class        
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PGEXE003.
       AUTHOR. Anderson Nascimento. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 23/03/2022. 
       DATE-COMPILED. 23/03/2022. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  WS-DATA            PIC X(10) VALUE SPACES.
       01  WS-DATA-R REDEFINES WS-DATA.
           03 WS-DATA-DD      PIC 9(02).
           03 FILLER          PIC X.
           03 WS-DATA-MM      PIC 9(02).
           03 FILLER          PIC X.
           03 WS-DATA-AA      PIC 9(04).
       77  WS-NOME-MES-AUX    PIC X(15) VALUE SPACES.
       77  WS-TECLA-AUX       PIC X.
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
      *    Inicializa as variáveis e chama os demais parágrafos
      *****************************************************************
       P100-INICIAL.
           DISPLAY "INICIO DO PROCESSAMENTO"

           MOVE SPACES                         TO WS-DATA
                                                  WS-NOME-MES-AUX
                                                  WS-TECLA-AUX.
           DISPLAY "Informe uma data: "
           ACCEPT WS-DATA.

           PERFORM P200-VER-MES                THRU P200-VER-MES-FIM.
           PERFORM P300-MOSTRA                 THRU P300-MOSTRA-FIM.
           PERFORM P900-TERMINAL.
      *P100-INICIAL-FIM.

      *****************************************************************
      *    Verifica qual o mês da data informada pelo usuário
      *****************************************************************
       P200-VER-MES.
           DISPLAY ">> Verificando o mês da data informada..."

           EVALUATE WS-DATA-MM
               WHEN 01
                  MOVE "Janeiro"               TO WS-NOME-MES-AUX
               WHEN 02
                  MOVE "Fevereiro"             TO WS-NOME-MES-AUX
               WHEN 03
                  MOVE "Março"                 TO WS-NOME-MES-AUX
               WHEN 04
                  MOVE "Abril"                 TO WS-NOME-MES-AUX
               WHEN 05
                  MOVE "Maio"                  TO WS-NOME-MES-AUX
               WHEN 06
                  MOVE "Junho"                 TO WS-NOME-MES-AUX
               WHEN 07
                  MOVE "Julho"                 TO WS-NOME-MES-AUX
               WHEN 08
                  MOVE "Agosto"                TO WS-NOME-MES-AUX
               WHEN 09
                  MOVE "Setembro"              TO WS-NOME-MES-AUX
               WHEN 10
                  MOVE "Outubro"               TO WS-NOME-MES-AUX
               WHEN 11
                  MOVE "Novembro"              TO WS-NOME-MES-AUX
               WHEN 12
                  MOVE "Dezembro"              TO WS-NOME-MES-AUX
               WHEN OTHER
                  DISPLAY ">> Mês inválido! Informe uma data válida."
                  PERFORM P100-INICIAL
      *           CONTINUE
           END-EVALUATE.
       P200-VER-MES-FIM.

      *****************************************************************
      *    Mostra o resultado com opção de reprocessamento
      *****************************************************************
       P300-MOSTRA.
           DISPLAY "EXIBINDO O RESULTADO DO PROCESSAMENTO".
           DISPLAY "O mês da data informada é: " WS-NOME-MES-AUX.
           DISPLAY "Tecle <C|c> para continuar, <Enter> para terminar.".
           ACCEPT WS-TECLA-AUX.
           IF WS-TECLA-AUX = "C" or="c" THEN
              PERFORM P100-INICIAL
      *       PERFORM P100-INICIAL             THRU P100-INICIAL-FIM
           END-IF.
       P300-MOSTRA-FIM.

      *****************************************************************
      *    Finaliza o programa
      *****************************************************************
       P900-TERMINAL.
           STOP RUN.
      *P900-TERMINAL-FIM.

       END PROGRAM PGEXE003.
