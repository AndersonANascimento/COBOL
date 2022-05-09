      *****************************************************************
      * Program name:    PGCORRES                               
      * Original author: Anderson Nascimento                                
      * Purpose: Apresentar a instrução CORRESPONDING
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGCORRES.
         AUTHOR. Anderson Nascimento. 
         INSTALLATION. COBOL DEVELOPMENT CENTER. 
         DATE-WRITTEN. 09/05/2022. 
         DATE-COMPILED. 09/05/2022. 
         SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION.
         CONFIGURATION SECTION. 
          SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *
      *****************************************************************
       DATA DIVISION.
         WORKING-STORAGE SECTION. 
      *
         01 WS-REG-1.
            03 WS-NOME                         PIC X(10).
            03 WS-TEL                          PIC X(09).
            03 WS-SALARIO                      PIC 9(04)V99.
            03 WS-UF                           PIC X(02).
      *
         01 WS-REG-2.
            03 WS-NOME                         PIC X(10).
            03 WS-UF                           PIC X(02).
            03 WS-TEL                          PIC X(09).
            03 WS-SALARIO                      PIC 9(04)V99.
      *
         77 WS-TIT                             PIC X(36).
      *
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *
           MOVE 'ANDERSON'                     TO WS-NOME OF WS-REG-1.
           MOVE '9999-9999'                    TO WS-TEL  OF WS-REG-1.
           MOVE 2300,50                        TO WS-SALARIO 
                                               OF WS-REG-1.
           MOVE 'CE'                           TO WS-UF   OF WS-REG-1.
      *
           PERFORM PRINT-REG-1               THRU PRINT-REG-1-F.
           PERFORM PRINT-I                   THRU PRINT-F. 
      *
           MOVE '*** MOVE SIMPLES ***'         TO WS-TIT
           MOVE WS-REG-1                       TO WS-REG-2
           PERFORM PRINT-REG-2               THRU PRINT-REG-2-F.
      *    PERFORM PRINT-I                   THRU PRINT-F.
      *
           INITIALIZE WS-REG-2
           MOVE '*** MOVE CORRESPONDING ***'   TO WS-TIT
           MOVE CORRESPONDING WS-REG-1         TO WS-REG-2.
           PERFORM PRINT-REG-2               THRU PRINT-REG-2-F.
      *    PERFORM PRINT-I                   THRU PRINT-F.
      *
           MOVE '*** ADD 200 and MOVE CORR ***'TO WS-TIT
           ADD 200                             TO WS-SALARIO 
                                               OF WS-REG-1.
           MOVE CORR WS-REG-1                  TO WS-REG-2.
           PERFORM PRINT-REG-1               THRU PRINT-REG-1-F.
           PERFORM PRINT-REG-2               THRU PRINT-REG-2-F.
      *    PERFORM PRINT-I                   THRU PRINT-F.
      *
           MOVE '*** SUBTRACT 50,25 and MOVE CORR ***' 
                                               TO WS-TIT
           SUBTRACT 50,25                    FROM WS-SALARIO 
                                               OF WS-REG-1.
           MOVE CORR WS-REG-1                  TO WS-REG-2.
           PERFORM PRINT-REG-1               THRU PRINT-REG-1-F.
           PERFORM PRINT-REG-2               THRU PRINT-REG-2-F.
      *    PERFORM PRINT-I                   THRU PRINT-F.
      *
           MOVE '*** ADD CORR ***' TO WS-TIT
           ADD CORR WS-REG-1                   TO WS-REG-2.
           PERFORM PRINT-REG-2               THRU PRINT-REG-2-F.
      *    PERFORM PRINT-I                   THRU PRINT-F.
      *
           MOVE '*** SUBTRACT CORR ***' TO WS-TIT
           SUBTRACT CORR WS-REG-1            FROM  WS-REG-2.
           PERFORM PRINT-REG-2               THRU PRINT-REG-2-F.
      *    PERFORM PRINT-I                   THRU PRINT-F.
      *
           STOP RUN.
      *
       PRINT-I.
           IF WS-TIT NOT = SPACES THEN
              DISPLAY ' '
              DISPLAY  WS-TIT 
              DISPLAY 'WS-REG-1:' WS-REG-1 
              DISPLAY 'WS-REG-2:' WS-REG-2
           END-IF.
       PRINT-F.
      *
       PRINT-REG-1.
           DISPLAY ' '
           DISPLAY '*** REG 1 ' WS-TIT 
           DISPLAY 'Nome...: ' WS-NOME         OF WS-REG-1 
           DISPLAY 'Fone...: ' WS-TEL          OF WS-REG-1 
           DISPLAY 'Salario: ' WS-SALARIO      OF WS-REG-1 
           DISPLAY 'UF.....: ' WS-UF           OF WS-REG-1.
       PRINT-REG-1-F.
      *
       PRINT-REG-2.
           DISPLAY '*** REG 2 ' WS-TIT 
           DISPLAY 'Nome...: ' WS-NOME         OF WS-REG-2 
           DISPLAY 'Fone...: ' WS-TEL          OF WS-REG-2 
           DISPLAY 'Salario: ' WS-SALARIO      OF WS-REG-2 
           DISPLAY 'UF.....: ' WS-UF           OF WS-REG-2.
       PRINT-REG-2-F.
      *
       END PROGRAM PGCORRES.
