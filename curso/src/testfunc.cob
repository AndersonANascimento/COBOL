      *************************
       IDENTIFICATION DIVISION.
      *************************
       PROGRAM-ID. testfunc.
       AUTHOR. ANDERSON ABREU.
       DATE-WRITTEN.  16/03/2022.
       DATE-COMPILED. 

      **********************
       ENVIRONMENT DIVISION.
      **********************
      
      ***************
       DATA DIVISION.
      ***************
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  800-WHEN-COMPILED.
           05  800-COMPILED-DATE-YYYY          PIC X(04) VALUE SPACES.
           05  800-COMPILED-DATE-MM            PIC X(02) VALUE SPACES.
           05  800-COMPILED-DATE-DD            PIC X(02) VALUE SPACES.
           05  800-COMPILED-TIME-HH            PIC X(02) VALUE SPACES.
           05  800-COMPILED-TIME-MM            PIC X(02) VALUE SPACES.
           05  800-COMPILED-TIME-SS            PIC X(02) VALUE SPACES.
           05  FILLER                          PIC X(07) VALUE SPACES.

       01  800-CURRENT-DATE.     
           05  800-CURRENT-DATE-YYYY           PIC X(04) VALUE SPACES.
           05  800-CURRENT-DATE-MM             PIC X(02) VALUE SPACES.
           05  800-CURRENT-DATE-DD             PIC X(02) VALUE SPACES.
           05  800-CURRENT-TIME-HH             PIC X(02) VALUE SPACES.
           05  800-CURRENT-TIME-MM             PIC X(02) VALUE SPACES.
           05  800-CURRENT-TIME-SS             PIC X(02) VALUE SPACES.
           05  FILLER                          PIC X(07) VALUE SPACES.

       01  WS-DATA-ATUAL.
           05 WS-DT-ATUAL                      PIC X(21) VALUE SPACES.
           05 WS-DT-ATUAL-R REDEFINES WS-DT-ATUAL.
              10  WS-DT-AA                     PIC X(04).
              10  WS-DT-MM                     PIC X(02).
              10  WS-DT-DD                     PIC X(02).
              10  WS-TM-HH                     PIC X(02).
              10  WS-TM-MM                     PIC X(02).
              10  WS-TM-SS                     PIC X(02).
              10  FILLER                       PIC X(07).
       
      ********************
       PROCEDURE DIVISION.
      ********************
       MAINLINE.
           
           DISPLAY 'TESTFUNC Start - GnuCOBOL 2.2.0 17JUL2018'.
           
           MOVE FUNCTION WHEN-COMPILED         TO 800-WHEN-COMPILED.
           MOVE FUNCTION CURRENT-DATE          TO 800-CURRENT-DATE.
           MOVE 800-CURRENT-DATE               TO WS-DATA-ATUAL.

           DISPLAY 'TESTFUNC Compiled = '
               800-COMPILED-DATE-YYYY '/'
               800-COMPILED-DATE-MM '/'
               800-COMPILED-DATE-DD SPACE
               800-COMPILED-TIME-HH ':'
               800-COMPILED-TIME-MM ':'
               800-COMPILED-TIME-SS SPACE.
           DISPLAY 'TESTFUNC Executed = '
               800-CURRENT-DATE-YYYY '/'
               800-CURRENT-DATE-MM '/'
               800-CURRENT-DATE-DD SPACE
               800-CURRENT-TIME-HH ':'
               800-CURRENT-TIME-MM ':'
               800-CURRENT-TIME-SS SPACE.

           DISPLAY 'Data de Execução = '
               WS-DT-DD '/'
               WS-DT-MM '/'
               WS-DT-AA SPACE
               WS-TM-HH ':'
               WS-TM-MM ':'
               WS-TM-SS SPACE.

           DISPLAY 'TESTFUNC Successfully Completed'.
           STOP RUN.
