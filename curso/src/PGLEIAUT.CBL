      *****************************************************************
      * Program name:    PGLEIAUT                               
      * Original author: Anderson Nascimento                           
      * Purpose: Apresentar o comando COPY
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGLEIAUT.
         AUTHOR. Anderson Abreu do Nascimento. 
         INSTALLATION. COBOL DEVELOPMENT CENTER. 
         DATE-WRITTEN. 06/06/2022. 
         DATE-COMPILED. 06/06/2022. 
         SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION. 
      *****************************************************************
       DATA DIVISION. 
         WORKING-STORAGE SECTION.
         COPY BOOKLOUT.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INITIALIZE WS-VAR 
           DISPLAY "Execução de PGLEIAUT"
           DISPLAY "Informe o 1º valor: "
           ACCEPT WS-N1 
           DISPLAY "Informe o 2º valor: "
           ACCEPT WS-N2 

           CALL './bin/PGCALC01' USING WS-VAR.

           DISPLAY  WS-RESULT.
           
           STOP RUN.
       END PROGRAM PGLEIAUT.
