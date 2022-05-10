      *****************************************************************
      * Program name:    PGMATEMA                               
      * Original author: Anderson Nascimento                                
      * Purpose: Apresentar operações matematicas no COBOL
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGMATEMA.
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
      *****************************************************************
       DATA DIVISION.
         WORKING-STORAGE SECTION. 
         01 WS-NUMEROS.
            05 WS-SOMA                         PIC S9(05)V99.
            05 WS-MULTI                        PIC S9(05)V99.
            05 WS-DIVID                        PIC S9(05)V99.
            05 WS-SUBTR                        PIC S9(05)V99.
            05 WS-POTEN                        PIC S9(05)V99.
            05 WS-CALC                         PIC S9(05)V99.
            05 WS-N-1                          PIC S9(04)V99.
            05 WS-N-2                          PIC S9(04)V99.
            05 WS-RESULT-FMT                   PIC -ZZ.ZZ9,99.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INITIALIZE WS-NUMEROS.
           DISPLAY '**** PROGRAMA DE CALCULO ****'
           DISPLAY 'Informe o 1º valor: '
           ACCEPT WS-N-1 
           DISPLAY 'Informe o 2º valor: '
           ACCEPT WS-N-2
      *
      *    DISPLAY 'WS-N-1:' WS-N-1 ' WS-N-2:' WS-N-2
           PERFORM SOMA-PROCEDURE.
           PERFORM SUBT-PROCEDURE.
           PERFORM MULT-PROCEDURE.
           PERFORM DIVI-PROCEDURE.
           PERFORM POTE-PROCEDURE.
           PERFORM INCR-PROCEDURE.
           PERFORM DECR-PROCEDURE.
      *   
           STOP RUN.
      *
       SOMA-PROCEDURE.
           MOVE ZEROS                          TO WS-SOMA
           COMPUTE WS-SOMA = WS-N-1 + WS-N-2.
           MOVE WS-SOMA                        TO WS-RESULT-FMT.
           DISPLAY 'O resultado da soma é..........: ' WS-RESULT-FMT.
      *
       SUBT-PROCEDURE.
           MOVE ZEROS                          TO WS-SUBTR 
           COMPUTE WS-SUBTR  = WS-N-1 - WS-N-2.
           MOVE WS-SUBTR                       TO WS-RESULT-FMT.
           DISPLAY 'O resultado da subtração é.....: ' WS-RESULT-FMT.
      *
       MULT-PROCEDURE.
           MOVE ZEROS                          TO WS-MULTI 
           COMPUTE WS-MULTI = WS-N-1 * WS-N-2.
           MULTIPLY WS-N-1 BY WS-N-2       GIVING WS-CALC 
           MOVE WS-MULTI                       TO WS-RESULT-FMT.
           DISPLAY 'O resultado da multiplicação é.: ' WS-RESULT-FMT.
           MOVE WS-CALC                        TO WS-RESULT-FMT.
           DISPLAY '                com MULTIPLY é.: ' WS-RESULT-FMT.
      *
       DIVI-PROCEDURE.
           MOVE ZEROS                          TO WS-DIVID
           COMPUTE WS-DIVID = WS-N-1 / WS-N-2.
           DIVIDE WS-N-1 BY WS-N-2         GIVING WS-CALC 
           MOVE WS-DIVID                       TO WS-RESULT-FMT.
           DISPLAY 'O resultado da divisão é.......: ' WS-RESULT-FMT.
           MOVE WS-CALC                        TO WS-RESULT-FMT.
           DISPLAY '            com DIVIDE é.......: ' WS-RESULT-FMT.
      *
       POTE-PROCEDURE.
           MOVE ZEROS                          TO WS-POTEN
           COMPUTE WS-POTEN = WS-N-1 ** 4.
           MOVE WS-POTEN                       TO WS-RESULT-FMT.
           DISPLAY 'O da potencia (' WS-N-1 ')^4 é...: ' WS-RESULT-FMT.
      *
       INCR-PROCEDURE.
           MOVE ZEROS                          TO WS-CALC 
           ADD WS-N-1 WS-DIVID                 TO WS-CALC 
           MOVE WS-CALC                        TO WS-RESULT-FMT.
           DISPLAY 'ADD  ' WS-N-1 '  a  ' WS-DIVID 
                                  '  dá  ' WS-RESULT-FMT.
      *
       DECR-PROCEDURE.
           MOVE ZEROS                          TO WS-CALC 
           SUBTRACT WS-N-1                   FROM WS-MULTI 
                                           GIVING WS-CALC 
           MOVE WS-CALC                        TO WS-RESULT-FMT.
           DISPLAY 'SUBTRACT ' WS-N-1 ' de ' WS-MULTI 
                                      ' dá' WS-RESULT-FMT.
      *
       END PROGRAM PGMATEMA.
