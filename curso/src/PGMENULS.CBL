      *****************************************************************
      * Program name:    PGMENULS                               
      * Original author: Anderson Nascimento                           
      * Purpose: Apresentar a LINKAGE SECTION
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGMENULS.
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
         01 WS-VAR.
            05 WS-N1                           PIC 99V99.
            05 WS-N2                           PIC 99V99.
            05 WS-RESULT                       PIC 99V99.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Execução de PGMENULS"
           DISPLAY "PROGRAMA DE MENU".

           INITIALIZE WS-VAR 

           DISPLAY "Informe o 1º valor: "
           ACCEPT WS-N1 
           DISPLAY "Informe o 2º valor: "
           ACCEPT WS-N2 

           CALL './bin/PGCALC01' USING WS-VAR.

           DISPLAY  WS-RESULT.
           
           STOP RUN.
       END PROGRAM PGMENULS.
