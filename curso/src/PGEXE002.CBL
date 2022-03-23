      *****************************************************************
      * Program name:    PGEXE002                               
      * Original author: ANDERSON ABREU DO NASCIMENTO
      *
      * Maintenence Log                                              
      * Date       Author               Maintenance Requirement
      * ---------- -------------------  -------------------------------
      * 23/03/2022 ANDERSON NASCIMENTO  Created for COBOL class
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
      *****************************************************************
       PROGRAM-ID.  PGEXE002.
       AUTHOR. ANDERSON ABREU DO NASCIMENTO. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 23/03/2022. 
       DATE-COMPILED. 23/03/2022. 
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
       01  WS-ALUNO.
           02  WS-NOME               PIC X(30) VALUE SPACES.
           02  WS-NOTAS.
               05  WS-NOTA-1         PIC 9(02)V99 VALUE ZEROS.
               05  WS-NOTA-2         PIC 9(02)V99 VALUE ZEROS.
               05  WS-NOTA-3         PIC 9(02)V99 VALUE ZEROS.
               05  WS-NOTA-4         PIC 9(02)V99 VALUE ZEROS.
               05  WS-MEDIA          PIC 9(02)V99 VALUE ZEROS.
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
           DISPLAY "ESTE PROGRAMA VERIFICA A APROVAÇÃO DE UM ALUNO"
           
           DISPLAY "INFORME O NOME DO ALUNO: "
           ACCEPT WS-NOME.

           DISPLAY "INFORME A NOTA 1: "
           ACCEPT WS-NOTA-1.
           DISPLAY "INFORME A NOTA 2: "
           ACCEPT WS-NOTA-2.
           DISPLAY "INFORME A NOTA 3: "
           ACCEPT WS-NOTA-3.
           DISPLAY "INFORME A NOTA 4: "
           ACCEPT WS-NOTA-4.

           COMPUTE WS-MEDIA = (WS-NOTA-1 + WS-NOTA-2 + 
                               WS-NOTA-3 + WS-NOTA-4) / 4.0.

           IF WS-MEDIA >= 7 THEN
              DISPLAY "O ALUNO " WS-NOME 
                      " FOI APROVADO COM MEDIA: " WS-MEDIA
           ELSE
              DISPLAY "O ALUNO " WS-NOME 
                      " FOI REPROVADO COM MEDIA: " WS-MEDIA
           END-IF

           STOP RUN.
       END PROGRAM PGEXE002.
