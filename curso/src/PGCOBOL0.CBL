      *****************************************************************
      * Program name:    PGCORRES                                      
      * Original author: Anderson Nascimento                           
      * Purpose: Apresentar a dinamica dos paragrafos                  
      *                                                                
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID. PGCOBOL0.
      *
      *----------------------------------------------------------------*
       ENVIRONMENT DIVISION.
         CONFIGURATION SECTION.
          SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *----------------------------------------------------------------*
       DATA DIVISION. 
         FILE SECTION.
          WORKING-STORAGE SECTION. 
         77  WS-MOSTRA                         PIC X(20) VALUE SPACES.
      *----------------------------------------------------------------*
       PROCEDURE DIVISION.
      *-------------------------- 1ª Sessão ---------------------------*
       MAIN-PROC SECTION.
      *------------------- Paragrafos da 1ª Sessão --------------------*
       S001-PROC1.
           MOVE 'S001-PROC1'                   TO WS-MOSTRA.
           DISPLAY WS-MOSTRA.
           PERFORM SECOND-PROC.

       S001-PROC2.
           MOVE 'S001-PROC2'                   TO WS-MOSTRA.
           DISPLAY WS-MOSTRA.
           PERFORM SECOND-PROC.

       S001-PROC3.
           IF WS-MOSTRA NOT = 'S002-PROC3' THEN
              MOVE 'S001-PROC3'                TO WS-MOSTRA
              DISPLAY WS-MOSTRA
              PERFORM S002-PROC3
           ELSE
              PERFORM FIM-PROC
           END-IF.
      *-------------------------- 2ª Sessão ---------------------------*
       SECOND-PROC SECTION.
      *------------------- Paragrafos da 2ª Sessão --------------------*
       S002-PROC1.
           IF WS-MOSTRA NOT = 'S001-PROC2' THEN
              MOVE 'S002-PROC1'                TO WS-MOSTRA
              DISPLAY WS-MOSTRA
              PERFORM S001-PROC2
           END-IF.

       S002-PROC2.
           MOVE 'S002-PROC2'                   TO WS-MOSTRA.
           DISPLAY WS-MOSTRA.
           PERFORM S001-PROC3.

       S002-PROC3.
           MOVE 'S002-PROC3'                   TO WS-MOSTRA.
           DISPLAY WS-MOSTRA.
           PERFORM S001-PROC3.

      *--------------------- Sessão de Finalização --------------------*
       FIM-PROC SECTION.
           MOVE 'FIM-PROC'                     TO WS-MOSTRA.
           DISPLAY WS-MOSTRA.           
           STOP RUN.

       END PROGRAM PGCOBOL0.
