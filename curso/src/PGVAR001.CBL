      *****************************************************************
      * Program name:    PGVAR001                               
      * Original author: Anderson Nascimento
      *
      * Maintenence Log                                              
      * Date      Author               Maintenance Requirement
      * --------- -------------------  --------------------------------
      * 28/03/22  Anderson Nascimento  Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
      *****************************************************************
       PROGRAM-ID.  PGVAR001.
       AUTHOR. Anderson Nascimento. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 28/03/2022. 
       DATE-COMPILED. 28/03/2022. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION. 
      *****************************************************************
       CONFIGURATION SECTION. 
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *****************************************************************
       DATA DIVISION.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  WS-DADOS-FUNC.
           03  WS-NOME-FUNC                    PIC A(20) VALUE SPACES.
           03  WS-TEL-FUNC                     PIC X(09) VALUE SPACES.
           03  WS-ENDER-FUNC                   PIC X(45) VALUE SPACES.
           03  FILLER REDEFINES WS-ENDER-FUNC.
               05 WS-RUA-FUNC                  PIC X(20).
               05 WS-NUM-FUNC                  PIC 9(05).
               05 WS-PTO-REF-FUNC              PIC X(20).
           03  WS-SAL-FUNC                     PIC 9(04)V99 VALUE ZEROS.
       77  WS-AUX-SALARIO                      PIC Z.ZZ9,99.
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
       MAIN-PROCEDURE.
           MOVE "Anderson Nascimento 9132-6221Tv. Araraquara      00164P
      -         "adaria LINDOPAN    999998"    TO WS-DADOS-FUNC.

           MOVE WS-SAL-FUNC                    TO WS-AUX-SALARIO.

           DISPLAY "NOME: " WS-NOME-FUNC.
           DISPLAY "FONE: " WS-TEL-FUNC.
           DISPLAY "RUA: " WS-RUA-FUNC.
           DISPLAY "NUM: " WS-NUM-FUNC.
           DISPLAY "PONTO DE REFERÊNCIA: " WS-PTO-REF-FUNC.
           DISPLAY "SALARIO: " WS-SAL-FUNC.
           DISPLAY "SALARIO: R$ " WS-AUX-SALARIO.

           STOP RUN.
       END PROGRAM PGVAR001.
