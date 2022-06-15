      *****************************************************************
      * Program name:    PGCALC01                               
      * Original author: Anderson Nascimento                           
      * Purpose: Apresentar a LINKAGE SECTION
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGCALC01.
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
         LINKAGE SECTION. 
         01 WS-VAR.
            05 WS-N1                           PIC 99V99.
            05 WS-N2                           PIC 99V99.
            05 WS-RESULT                       PIC 99V99.
      *****************************************************************
       PROCEDURE DIVISION USING WS-VAR.
       MAIN-PROCEDURE.
           DISPLAY "Programa de Cálculo - PGCALC01"
           COMPUTE WS-RESULT = WS-N1 + WS-N2  
           EXIT.
       END PROGRAM PGCALC01.
