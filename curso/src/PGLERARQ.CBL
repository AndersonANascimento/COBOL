      *****************************************************************
      * Program name:   PGLERARQ                               
      * Original author: Anderson Abreu do Nascimento                           
      *
      * Maintenence Log                                              
      * Date       Author               Maintenance Requirement               
      * ---------- -------------------  ------------------------------- 
      * 20/05/2022 Anderson Nascimento  Lê um arquivo sequencial 
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGLERARQ.
       AUTHOR. Anderson Abreu do Nascimento. 
       INSTALLATION. COBOL DEVELOPMENT CENTER. 
       DATE-WRITTEN.20/05/2022. 
       DATE-COMPILED.20/05/2022. 
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT CLIENTE ASSIGN TO './CLIENTE.TXT'
           ORGANIZATION IS SEQUENTIAL
      *    ACCESS MODE  IS SEQUENTIAL
           FILE STATUS  IS WS-FS.
      *****************************************************************
       DATA DIVISION.
       FILE SECTION. 
       FD  CLIENTE.
       01  REG-CLIENTE.
           03 CD-CLIENTE                       PIC 9(03).
           03 NM-CLIENTE                       PIC X(20).
           03 TL-CLIENTE                       PIC X(09).
       WORKING-STORAGE SECTION.
       77  WS-FS                               PIC 99.
       77  WS-EOF                              PIC 99.
       01  WS-DADOS.
           03 WS-CD-CLIENTE                    PIC 9(03).
           03 WS-NM-CLIENTE                    PIC X(20).
           03 WS-TL-CLIENTE                    PIC X(09).
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY '------ LISTAGEM DE CLIENTE -----'
           SET WS-FS                           TO 0.
           SET WS-EOF                          TO 0.

           OPEN INPUT  CLIENTE
           
           PERFORM UNTIL WS-EOF EQUAL 1
              READ CLIENTE INTO WS-DADOS
                 AT END 
                    MOVE 1                     TO WS-EOF
                 NOT AT END
                    DISPLAY 'Cod: '  WS-CD-CLIENTE 
                            ' Nome: ' WS-NM-CLIENTE 
                            ' Fone: ' WS-TL-CLIENTE
              END-READ
           END-PERFORM.

           CLOSE CLIENTE
           
           STOP RUN.
       END PROGRAM PGLERARQ.
