      *****************************************************************
      * Program name:    PGINSPCT                               
      * Original author: Anderson Nascimento
      * Purpose: Apresentar variações de uso da instrução 'INSPECT'
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID.  PGINSPCT.
         AUTHOR. Anderson Nascimento. 
         INSTALLATION. COBOL DEVELOPMENT CENTER. 
         DATE-WRITTEN. 03/05/2022. 
         DATE-COMPILED. 03/05/2022. 
         SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION. 
      *****************************************************************
       DATA DIVISION. 
         FILE SECTION. 
         WORKING-STORAGE SECTION. 
         77 WS-STRING                          PIC X(50) VALUE 
           'TODAS AS COMPRAS FEITAS EM 01/07 NAO TEM PREMIACAO'.
         01 WS-CONTADORES.
            03 WS-CONT-1                       PIC 99.
            03 WS-CONT-2                       PIC 99.
            03 WS-CONT-3                       PIC 99.
            03 WS-CONT-4                       PIC 99.
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY 'RÉGUA DE CARACT: '
            '12345678901234567890123456789012345678901234567890'

           DISPLAY 'STRING ORIGINAL: ' WS-STRING
      *********** FORMATO 1: CONTAGEM DE CARACTERES *******************
           INITIALIZE WS-CONTADORES 

           INSPECT WS-STRING TALLYING WS-CONT-1 FOR ALL ZEROS
           DISPLAY 'Quantidade de ZEROS na string: ' WS-CONT-1

           INSPECT WS-STRING TALLYING WS-CONT-2 FOR ALL SPACES 
           DISPLAY 'Quantidade de ESPACES na string: ' WS-CONT-2 

           INSPECT WS-STRING TALLYING WS-CONT-3 FOR ALL 'A'
           DISPLAY 'Quantidade de caracteres "A" na string: ' WS-CONT-3

           INSPECT WS-STRING TALLYING WS-CONT-4 FOR CHARACTERS 
              BEFORE INITIAL ZEROS
           DISPLAY 'Quantidade de caracteres ANTES do ZERO: ' WS-CONT-4
           
           INITIALIZE WS-CONT-4 
           INSPECT WS-STRING TALLYING WS-CONT-4 FOR CHARACTERS 
              AFTER INITIAL ZEROS
           DISPLAY 'Quantidade de caracteres DEPOIS do ZERO: ' WS-CONT-4

      *********** FORMATO 2: SUBSTITUIÇÃO DE CARACTERES ***************
           DISPLAY 'Trocando "A" por "X": '
           INSPECT WS-STRING REPLACING ALL 'A' BY 'X'
           DISPLAY 'Nova string: ' WS-STRING 

           DISPLAY 'Trocando tudo antes do "X": '
           INSPECT WS-STRING REPLACING CHARACTERS BY 'Y' 
              BEFORE INITIAL 'X'
           DISPLAY 'Nova string: ' WS-STRING 

           DISPLAY 'Trocando o 1º "X" por "W": '
           INSPECT WS-STRING REPLACING FIRST 'X' BY 'W' 
           DISPLAY 'Nova string: ' WS-STRING 

      *********** FORMATO 3: SUBSTITUIÇÃO INTELIGENTE *****************
           INITIALIZE WS-CONTADORES 

           DISPLAY 'Contando alteração de "XS" numa condição: '
           INSPECT WS-STRING TALLYING WS-CONT-1 FOR ALL 'XS'
              AFTER ' C' BEFORE 'T'
           DISPLAY 'Tamanho do corte: ' WS-CONT-1 
           DISPLAY 'Nova string: ' WS-STRING 

           DISPLAY 'Fazendo a alteração de "XS" numa condição'
           INSPECT WS-STRING REPLACING ALL 'XS' BY '11'
              AFTER ' C' BEFORE 'T'
           DISPLAY 'Nova string: ' WS-STRING 

      *********** FORMATO 4: CONVERSÃO INTELIGENTE ********************

           DISPLAY 'Converte uma coleção de "11" por caracteres de'
                 'iguais quantidades'
           INSPECT WS-STRING CONVERTING 'XO' TO ALL 'CU'
           DISPLAY 'Nova string: ' WS-STRING 

           STOP RUN.
       END PROGRAM PGINSPCT.
