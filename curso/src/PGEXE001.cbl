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
       01 WS-NUMERO-1                          PIC 9(03) VALUE ZEROS.   ANDERSON
       01 WS-NUMERO-2                          PIC 9(03) VALUE ZEROS.
       01 WS-RESULTADO-Z                       PIC Z(04) VALUE ZEROS.
       01 WS-LIMITE-Z                          PIC Z(04) VALUE 10.

      ********************
       PROCEDURE DIVISION.
      ********************
      *    Este é um paragrafo
       MAIN-PROCEDURE.
           DISPLAY 'Exibe o resultado da soma de 2 números aleatorios'.

           DISPLAY 'Digite o 1º número: '.
           ACCEPT WS-NUMERO-1.
           
           DISPLAY 'Digite o 2º número: '.
           ACCEPT WS-NUMERO-2.

           COMPUTE WS-RESULTADO-Z = WS-NUMERO-1 + WS-NUMERO-2.

           IF WS-RESULTADO-Z  > WS-LIMITE-Z THEN  
               DISPLAY 'O resultado é maior que ' WS-LIMITE-Z 
           ELSE
               DISPLAY 'O resultado é menor que ' WS-LIMITE-Z 
           END-IF.
           
           DISPLAY 'O resultado é: ' WS-RESULTADO-Z.

           STOP RUN.
       END PROGRAM PGEXE001.
