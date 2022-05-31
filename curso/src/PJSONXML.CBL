      *****************************************************************
      * Program name:    PJSONXML                               
      * Original author: Anderson Nascimento                           
      * Purpose: Apresentar uso de JSON e XML
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PJSONXML.
         AUTHOR. Anderson Nascimento. 
         INSTALLATION. COBOL DEVELOPMENT CENTER. 
         DATE-WRITTEN. 12/05/2022. 
         DATE-COMPILED. 12/05/2022. 
         SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION.
         CONFIGURATION SECTION.
          SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA. 
      *****************************************************************
       DATA DIVISION.
         WORKING-STORAGE SECTION. 
         77 CTE-PROG                         PIC X(16) VALUE 'PJSONXML'.
      *  Estrura do JSON
         01 WS-REG-JSON.
            03 WS-NOME-J                       PIC X(15).
            03 WS-PROFISSAO-J                  PIC X(15).
            03 WS-IDADE-J                      PIC 99.
            03 WS-AMERICANO-J                  PIC X.
               88 WS-AMERIC-J                  VALUE 'S' 'N'.
            03 WS-IDIOMAS-J OCCURS 3 TIMES.
               05 WS-IDIOMA-J                  PIC X(10).
            03 WS-MILITAR-J                    PIC 9.
         01 WS-JSON-TXT               PIC X(2000) VALUE QUOTES.
         01 CT-JSON                            PIC 9(5).
      *
      *  Estrura do XML
         01 WS-REG-XML.
            03 WS-NOME-X                       PIC X(15).
            03 WS-PROFISSAO-X                  PIC X(15).
            03 WS-IDADE-X                      PIC 99.
            03 WS-AMERICANO-X                  PIC X.
               88 WS-AMERIC-X                  VALUE 'S' 'N'.
            03 WS-IDIOMAS-X OCCURS 3 TIMES.
               05 WS-IDIOMA-X                  PIC X(10).
            03 WS-MILITAR-X                    PIC 9.
      *  01 WS-XML-TXT                 PIC X(2000) USAGE NATIONAL.
         01 WS-XML-TXT                 PIC X(2000) VALUE QUOTES.
         01 CT-XML                             PIC 9(5).
      *
       PROCEDURE DIVISION.
           PERFORM P001-JSON                   THRU P001-FIM.
           PERFORM P002-XML                    THRU P002-FIM.
           PERFORM P009-FIM.                    
      *    THRU P999-FIM.
      *    
       P001-JSON.
           MOVE 'ANDERSON NASCIMENTO'          TO WS-NOME-J
           MOVE 'PROGRAMADOR'                  TO WS-PROFISSAO-J 
           MOVE 48                             TO WS-IDADE-J 
           MOVE 'N'                            TO WS-AMERICANO-J 
           MOVE 'Portugues'                    TO WS-IDIOMA-J(1)
           MOVE 'Ingles'                       TO WS-IDIOMA-J(2)
           MOVE 'Frances'                      TO WS-IDIOMA-J(3)
           MOVE ZEROS                          TO WS-MILITAR-J
      *
           JSON GENERATE WS-JSON-TXT FROM WS-REG-JSON COUNT CT-JSON
              ON EXCEPTION 
                 DISPLAY 'ERRO NA CONVERSÃO JSON' JSON-CODE 
              NOT ON EXCEPTION
                 DISPLAY 'JSON GERADO'
                 DISPLAY WS-JSON-TXT(1:CT-JSON)
                 DISPLAY FUNCTION DISPLAY-OF (WS-JSON-TXT(1:CT-JSON))
                 DISPLAY 'QUANTIDADE DE CARACTERES: ' CT-JSON 
           END-JSON.
       P001-FIM.
      *
       P002-XML.
           MOVE 'ANDERSON NASCIMENTO'          TO WS-NOME-X
           MOVE 'PROGRAMADOR'                  TO WS-PROFISSAO-X
           MOVE 48                             TO WS-IDADE-X
           MOVE 'N'                            TO WS-AMERICANO-X
           MOVE 'Portugues'                    TO WS-IDIOMA-X(1)
           MOVE 'Ingles'                       TO WS-IDIOMA-X(2)
           MOVE 'Frances'                      TO WS-IDIOMA-X(3)
           MOVE ZEROS                          TO WS-MILITAR-X
      *
           XML GENERATE WS-XML-TXT FROM WS-REG-XML COUNT CT-XML
              ON EXCEPTION 
                 DISPLAY 'ERRO NA CONVERSÃO XML' XML-CODE 
              NOT ON EXCEPTION
                 DISPLAY 'XML GERADO'
                 DISPLAY WS-XML-TXT(1:CT-XML)
                 DISPLAY FUNCTION DISPLAY-OF (WS-XML-TXT(1:CT-XML))
                 DISPLAY 'QUANTIDADE DE CARACTERES: ' CT-XML 
           END-XML.
       P002-FIM.
      *
       P009-FIM.
           STOP RUN.
      *P999-FIM.
      *
       END PROGRAM PJSONXML.
