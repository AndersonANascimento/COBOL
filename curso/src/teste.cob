      *PROGRAMA DE TESTE
      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. TESTE.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      
      ***************
       DATA DIVISION.
      ***************
       WORKING-STORAGE SECTION.
           01 WS-NOME        PIC X(10).

      ********************
       PROCEDURE DIVISION.
      ********************
       DISPLAY "Digite um nome: "
       ACCEPT WS-NOME.
       DISPLAY "O nome digitado foi: " WS-NOME
       STOP RUN.
