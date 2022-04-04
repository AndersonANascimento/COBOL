      *****************************************************************
      * Program name:    PGSTR001                               
      * Original author: Anderson Nascimento                           
      * Purpose: Apresentar o comando UNSTRING
      * Maintenence Log                                              
      * Date      Author               Maintenance Requirement         
      * --------- -------------------  ----------------------------- 
      * 01/04/22  Anderson Nascimento  Created for COBOL class         
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PGSTR001.
       AUTHOR. Anderson Nascimento. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN. 01/04/22. 
       DATE-COMPILED. 01/04/22. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION. 
      *****************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-POINTER                          PIC 9(02) VALUE ZEROS.
       77  WS-CT-01                            PIC 9(02) VALUE ZEROS.
       77  WS-CT-02                            PIC 9(02) VALUE ZEROS.
       77  WS-CT-03                            PIC 9(02) VALUE ZEROS.
       77  WS-TOT-CAMPOS                       PIC 9(02) VALUE ZEROS.
       77  WS-NOME-COMPLETO                    PIC X(60) VALUE SPACES.
       77  WS-PRIMEIRO-NOME                    PIC X(20) VALUE SPACES.
       77  WS-MEIO-NOME                        PIC X(20) VALUE SPACES.
       77  WS-ULTIMO-NOME                      PIC X(20) VALUE SPACES.

      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      * EXEMPLO 1
           DISPLAY '>> EXEMPLO 1'.
           PERFORM P100-INITIALIZE             THRU P100-INITIALIZE-FIM.

           MOVE 'ANA MARIA BRAGA'              TO WS-NOME-COMPLETO.

           UNSTRING WS-NOME-COMPLETO DELIMITED BY SPACES
                                             INTO  WS-PRIMEIRO-NOME
                                                   WS-MEIO-NOME 
                                                   WS-ULTIMO-NOME
           END-UNSTRING.

           PERFORM PRINT-PROCEDURE             THRU PRINT-PROCEDURE-FIM.

      * EXEMPLO 2
           DISPLAY '>> EXEMPLO 2'.
           PERFORM P100-INITIALIZE             THRU P100-INITIALIZE-FIM.

           MOVE 'ANA MARIA BRAGA '             TO WS-NOME-COMPLETO.
           MOVE 1                              TO WS-POINTER.

           UNSTRING WS-NOME-COMPLETO DELIMITED BY SPACES
                                             INTO  WS-PRIMEIRO-NOME
                                                   WS-MEIO-NOME 
                                                   WS-ULTIMO-NOME
                                             WITH POINTER WS-POINTER 
                                             TALLYING IN WS-TOT-CAMPOS
           END-UNSTRING.

           PERFORM PRINT-PROCEDURE             THRU PRINT-PROCEDURE-FIM.

      * EXEMPLO 3
           DISPLAY '>> EXEMPLO 3'.
           PERFORM P100-INITIALIZE             THRU P100-INITIALIZE-FIM.

           MOVE 'ANA*MARIA;BRAGA*'             TO WS-NOME-COMPLETO.
           MOVE 1                              TO WS-POINTER.

           UNSTRING WS-NOME-COMPLETO DELIMITED BY '*' OR ';'
                                             INTO  WS-PRIMEIRO-NOME
                                                   WS-MEIO-NOME 
                                                   WS-ULTIMO-NOME
                                             WITH POINTER WS-POINTER 
                                             TALLYING IN WS-TOT-CAMPOS
           END-UNSTRING.

           PERFORM PRINT-PROCEDURE             THRU PRINT-PROCEDURE-FIM.

      * EXEMPLO 4
           DISPLAY '>> EXEMPLO 4'.
           PERFORM P100-INITIALIZE             THRU P100-INITIALIZE-FIM.

           MOVE 'ANA*MARIA;BRAGA*'             TO WS-NOME-COMPLETO.
           MOVE 1                              TO WS-POINTER.

           UNSTRING WS-NOME-COMPLETO 
                    DELIMITED BY '*' OR ';'
                    INTO  WS-PRIMEIRO-NOME COUNT IN WS-CT-01
                          WS-MEIO-NOME     COUNT IN WS-CT-02 
                          WS-ULTIMO-NOME   COUNT IN WS-CT-03 
                    WITH POINTER WS-POINTER 
                    TALLYING IN WS-TOT-CAMPOS
           END-UNSTRING.

           PERFORM PRINT-PROCEDURE             THRU PRINT-PROCEDURE-FIM.

      * EXEMPLO 5
           DISPLAY '>> EXEMPLO 5'.
           PERFORM P100-INITIALIZE             THRU P100-INITIALIZE-FIM.

           MOVE 'ANA*MARIA;;;;BRAGA*'          TO WS-NOME-COMPLETO.
           MOVE 1                              TO WS-POINTER.

           UNSTRING WS-NOME-COMPLETO 
                    DELIMITED BY '*' OR ';'
                    INTO  WS-PRIMEIRO-NOME COUNT IN WS-CT-01
                          WS-MEIO-NOME     COUNT IN WS-CT-02 
                          WS-ULTIMO-NOME   COUNT IN WS-CT-03 
                    WITH POINTER WS-POINTER 
                    TALLYING IN WS-TOT-CAMPOS
           END-UNSTRING.

           PERFORM PRINT-PROCEDURE             THRU PRINT-PROCEDURE-FIM.

           PERFORM P900-TERMINAL.

       P100-INITIALIZE.
           INITIALIZE                          WS-POINTER
                                               WS-CT-01
                                               WS-CT-02
                                               WS-CT-03
                                               WS-TOT-CAMPOS
                                               WS-PRIMEIRO-NOME
                                               WS-MEIO-NOME
                                               WS-ULTIMO-NOME.
       P100-INITIALIZE-FIM.

       PRINT-PROCEDURE.
           DISPLAY 'Nome: ' WS-PRIMEIRO-NOME.
           DISPLAY 'Meio: ' WS-MEIO-NOME.
           DISPLAY 'Sobrenome: ' WS-ULTIMO-NOME.
           IF WS-POINTER > ZERO THEN
              DISPLAY 'WS-POINTER: ' WS-POINTER
              DISPLAY 'WS-TOT-CAMPOS: ' WS-TOT-CAMPOS
           END-IF.
           IF WS-CT-01 > ZERO 
              DISPLAY 'WS-CT-01: ' WS-CT-01
              DISPLAY 'WS-CT-02: ' WS-CT-02
              DISPLAY 'WS-CT-03: ' WS-CT-03
           END-IF.
           DISPLAY ' '.
       PRINT-PROCEDURE-FIM.

       P900-TERMINAL.
           STOP RUN.

       END PROGRAM PGSTR001.
