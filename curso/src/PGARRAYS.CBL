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
      *****************************************************************
       DATA DIVISION.
         WORKING-STORAGE SECTION. 
         01 WS-DIAS-DA-SEMANA.
            05 FILLER                         PIC X(8) VALUE '1DOMINGO'.
            05 FILLER                         PIC X(8) VALUE '2SEGUNDA'.
            05 FILLER                         PIC X(8) VALUE '3TERÇA'.
            05 FILLER                         PIC X(8) VALUE '4QUARTA'.
            05 FILLER                         PIC X(8) VALUE '5QUINTA'.
            05 FILLER                         PIC X(8) VALUE '6SEXTA'.
            05 FILLER                         PIC X(8) VALUE '7SÁBADO'.
         01 FILLER REDEFINES WS-DIAS-DA-SEMANA OCCURS 7 TIMES.
            05 WS-NUMERO-DIA                  PIC 9.
            05 WS-NOME-DIA                    PIC X(7).
      *
         77 WS-IND                            PIC 9.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY ' **** PROGRAMA DE ARRAY ****'
      *
           MOVE ZERO                           TO WS-IND
      *
           DISPLAY 'Nº   NOME'
           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND GREATER 7  
             DISPLAY WS-NUMERO-DIA(WS-IND) '    ' WS-NOME-DIA(WS-IND)
           END-PERFORM
      *    
           STOP RUN.
       END PROGRAM PGARRAYS.
