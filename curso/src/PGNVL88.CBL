      *****************************************************************
      * Program name:    PGNLV88                               
      * Original author: Anderson Nascimento
      * Purpose: Apresentar usabilidade no nível 88
      *****************************************************************
       IDENTIFICATION DIVISION. 
         PROGRAM-ID. PGNLV88.
         AUTHOR. Anderson Nascimento.
         DATE-WRITTEN. 03/05/2022.
         DATE-COMPILED. 03/05/2022.
      *****************************************************************
       ENVIRONMENT DIVISION.
      *****************************************************************
       DATA DIVISION. 
         FILE SECTION. 
         WORKING-STORAGE SECTION. 
         01 WS-REGISTRO.
            05 WS-NOME                         PIC X(36).
            05 WS-SEXO                         PIC A.
               88 WS-SEXO-OK                   VALUE "M", "F".
            05 WS-CEP                          PIC 9(5).
               88 WS-CEP-OK                    VALUE 30000 THRU 39999.
            05 WS-ESTRANGEIRO                  PIC X.
               88 WS-TRANG-OK                  VALUE 'S' FALSE 'N'.
            05 WS-EST-CIVIL                    PIC 9.
               88 WS-EST-CIV-OK                VALUE 1 THRU 4.
            05 WS-FONE                         PIC X(8).
               88 WS-FONE-FIXO                 VALUE '30000000' 
                                                THRU '49999999'.
               88 WS-FONE-CEL                  VALUE '80000000' 
                                                THRU '99999999'.

      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
      *    ---  Entrada de dados ---
           DISPLAY '****** CADASTRO DE FUNCIONARIO ******'
           DISPLAY 'Nome: '
           ACCEPT WS-NOME 
           DISPLAY 'Sexo: '
           ACCEPT WS-SEXO
           DISPLAY 'CEP: '
           ACCEPT WS-CEP
           DISPLAY 'Estrangeiro (S/N): '
           ACCEPT WS-ESTRANGEIRO 
           DISPLAY 'Estado Civil: '
           ACCEPT WS-EST-CIVIL
           DISPLAY 'Fone: '
           ACCEPT WS-FONE 

      *    ---  Crítica de dados ---
           IF WS-SEXO-OK 
              DISPLAY 'Sexo válido!'
           ELSE 
              DISPLAY 'Sexo inválido!'
           END-IF 

           IF WS-CEP-OK 
              DISPLAY 'CEP válido!'
           ELSE 
              DISPLAY 'CEP inválido!'
           END-IF 

           IF WS-TRANG-OK 
              DISPLAY 'Estrangeiro!'
           ELSE 
              DISPLAY 'Brasileiro!'
           END-IF 

           IF WS-EST-CIV-OK 
              DISPLAY 'Estado civil válido!'
           ELSE 
              DISPLAY 'Estado civil inválido!'
           END-IF 

           IF WS-FONE-FIXO 
              DISPLAY 'Fone fixo!'
           ELSE 
              IF WS-FONE-CEL 
                 DISPLAY 'Fone celular!'
              ELSE 
                 DISPLAY 'Fone inválido!'
              END-IF 
           END-IF 

           STOP RUN.
       END PROGRAM PGNLV88.
