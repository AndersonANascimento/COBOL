      *****************************************************************
      * Program name:   PGGERARQ                               
      * Original author: Anderson Abreu do Nascimento                           
      *
      * Maintenence Log                                              
      * Date       Author               Maintenance Requirement               
      * ---------- -------------------  ------------------------------- 
      * 20/05/2022 Anderson Nascimento  Grava um arquivo sequencial 
      *                                                               
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PGGERARQ.
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
           ACCESS MODE  IS SEQUENTIAL
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
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY '------ CADASTRO DE CLIENTE -----'
           SET WS-FS                           TO 0.

           OPEN EXTEND CLIENTE
           IF WS-FS EQUAL 35 THEN
              OPEN OUTPUT CLIENTE
           END-IF

           IF WS-FS EQUAL ZEROS THEN
              DISPLAY 'Informe o código do Cliente: '
              ACCEPT CD-CLIENTE
              DISPLAY 'Informe o nome do Cliente: '
              ACCEPT NM-CLIENTE
              DISPLAY 'Informe o telefone do Cliente: '
              ACCEPT TL-CLIENTE
              WRITE REG-CLIENTE
              IF WS-FS NOT EQUAL ZEROS
                 DISPLAY 'Não foi possível gravar o registro'
              ELSE
                 DISPLAY '>> Registro grava do sucesso!'
              END-IF
           ELSE
              DISPLAY '>> ERRO AO CRIAR O ARQUIVO!'
              DISPLAY '>> FILE STATUS: ' WS-FS
           END-IF

           CLOSE CLIENTE.
           
           STOP RUN.
       END PROGRAM PGGERARQ.
