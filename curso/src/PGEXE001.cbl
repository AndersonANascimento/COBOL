      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. PGEXE001.
       AUTHOR. ANDERSON ABREU.
       DATE-WRITTEN.  16/03/2022.
       DATE-COMPILED. 16/03/2022.

      **********************
       ENVIRONMENT DIVISION.
      **********************
      
      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-NUMERO-1                          PIC 9(003) VALUE ZEROS.
       01 WS-NUMERO-2                          PIC 9(003) VALUE ZEROS.
       01 WS-RESULTADO                         PIC Z(004) VALUE ZEROS.

      ********************
       PROCEDURE DIVISION.
      ********************
       MAIN-PROCEDURE.
           DISPLAY "Exibe o resultado da soma de 2 números aleatorios".
           
           DISPLAY "Digite o 1º número: ".
           ACCEPT WS-NUMERO-1.
           
           DISPLAY "Digite o 2º número: ".
           ACCEPT WS-NUMERO-2.

           COMPUTE WS-RESULTADO = WS-NUMERO-1 + WS-NUMERO-2.

           DISPLAY "O resultado é: " WS-RESULTADO.

           STOP RUN.
       END PROGRAM PGEXE001.
