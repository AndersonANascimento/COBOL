       IDENTIFICATION DIVISION.                                         
         PROGRAM-ID.  PROG6601.                                         
         AUTHOR.      ANDERSON NASCIMENTO.                              
         INSTALLATION. CURSO COBOL.                                     
         DATE-WRITTEN. 02 DE AGOSTO 2013.                               
         DATE-COMPILED.                                                 
         SECURITY.                                                      
      ***********************************************************       
      *  OBJETIVO DO PROGRAMA E LISTAR O ARQUIVO TURMA93.ALUNOS *       
      ***********************************************************       
      *                                                                 
       ENVIRONMENT DIVISION.                                            
         CONFIGURATION SECTION.                                         
          SPECIAL-NAMES.  DECIMAL-POINT IS COMMA.                       
      *                                                                 
         INPUT-OUTPUT SECTION.                                          
          FILE-CONTROL.   SELECT ARQUIVO1 ASSIGN TO './ENTRADA.TXT'. 
                          SELECT ARQUIVO2 ASSIGN TO './SAIDA.TXT'.
      *   I-O-CONTROL.                                                  
      *        SAME RECORD AREA FOR ARQUIVO1 ARQUIVO2.                  
      *                                                                 
       DATA DIVISION.                                                   
         FILE SECTION.                                                  
          FD  ARQUIVO1    RECORDING MODE IS F                           
                          RECORD CONTAINS 81 CHARACTERS                 
                          LABEL RECORD IS STANDARD                      
                          DATA RECORD IS REG-ARQUIVO1.                  
          01  REG-ARQUIVO1.                                             
              05  MATR-ARQUIVO1       PIC 9(05).                        
              05  NOME-ARQUIVO1       PIC X(30).                        
              05  NOTA1-ARQUIVO1      PIC 9(02)V99.                     
              05  NOTA2-ARQUIVO1      PIC 9(02)V99.                     
              05  NOTA3-ARQUIVO1      PIC 9(02)V99.                     
              05  FILLER              PIC X(34).                        
      *                                                                 
      *                                                                 
          FD  ARQUIVO2    RECORDING MODE IS F                           
                          RECORD CONTAINS 80 CHARACTERS                 
                          LABEL RECORD IS OMITTED                       
                          DATA RECORD IS REG-IMP.                       
          01  REG-IMP.                                                  
              05  FILLER              PIC X(80).                        
      *                                                                 
      *                                                                 
         WORKING-STORAGE SECTION.                                        
         77  CONTLIN                  PIC 99    VALUE 10.               
         77  CONTPAG                  PIC 9(03) VALUE 1.                
         77  TRACEJADO                PIC X(80) VALUE ALL '-'.          
         77  MEDIA-FINAL              PIC 9(02)V9999.                   
      *                                                                 
      *                                                                 
        01  CABECALHO1.                                                 
            03  FILLER                PIC X(75) VALUE 'PROJETO OFICINA D
      -                               'O FUTURO - TURMA93'.             
            03  FILLER                PIC X(02) VALUE 'PG'.             
            03  CAB1-PAG              PIC ZZ9.                          
      *                                                                 
        01  CABECALHO2.                                                 
            03  FILLER                PIC X(23) VALUE SPACES.           
            03  FILLER                PIC X(24) VALUE 'TREINAMENTO  C O 
      -                               'B O L'.                          
            03  FILLER                PIC X(33) VALUE SPACES.           
      *                                                                 
        01  CABECALHO3.                                                 
            03  FILLER                PIC X(11) VALUE 'MATRICULA'.      
            03  FILLER                PIC X(32) VALUE 'N O M E'.        
            03  FILLER                PIC X(28) VALUE 'NOTA1  NOTA2  NOT
      -                               'A3  MEDIA'.                      
            03  FILLER                PIC X(09) VALUE 'RESULTADO'.      
      *                                                                 
        01  LINHA-DETALHE.                                              
            03  FILLER                PIC X(04) VALUE SPACES.           
            03  MATR-DETALHE          PIC 9(05).                        
            03  FILLER                PIC X(02) VALUE SPACES.           
            03  NOME-DETALHE          PIC X(30).                        
            03  FILLER                PIC X(02) VALUE SPACES.           
            03  NOTA1-DETALHE         PIC Z9,99.                        
            03  FILLER                PIC X(02) VALUE SPACES.           
            03  NOTA2-DETALHE         PIC Z9,99.                        
            03  FILLER                PIC X(02) VALUE SPACES.           
            03  NOTA3-DETALHE         PIC Z9,99.                        
            03  FILLER                PIC X(02) VALUE SPACES.           
            03  MEDIA-DETALHE         PIC Z9,99 VALUE ZEROES.           
            03  FILLER                PIC X(02) VALUE SPACES.           
            03  RESULTADO-DETALHE     PIC X(09).                        
      *                                                                 
       PROCEDURE DIVISION.                                              
       ABERTURA-ARQUIVOS.                                              
           OPEN INPUT  ARQUIVO1                                        
                 OUTPUT ARQUIVO2.                                       
      *                                                                 
       LEITURA-ARQUIVO.                                                
           READ ARQUIVO1                                               
              AT END  GO TO FIM-PROGRAMA.                            
      *                                                                 
       CALCULA-MEDIA.                                                  
           COMPUTE MEDIA-FINAL ROUNDED = (NOTA1-ARQUIVO1 +             
                                          NOTA2-ARQUIVO1 +             
                                          NOTA3-ARQUIVO1) / 3.         
      *                                                                 
       FORMATA-LINHA-DETALHE.                                           
           MOVE MATR-ARQUIVO1                  TO MATR-DETALHE                  
           MOVE NOME-ARQUIVO1                  TO NOME-DETALHE                  
           MOVE NOTA1-ARQUIVO1                 TO NOTA1-DETALHE                 
           MOVE NOTA2-ARQUIVO1                 TO NOTA2-DETALHE                 
           MOVE NOTA3-ARQUIVO1                 TO NOTA3-DETALHE                 
           MOVE MEDIA-FINAL                    TO MEDIA-DETALHE                 
           IF MEDIA-FINAL NOT LESS 7 THEN                                  
              MOVE 'APROVADO'                  TO RESULTADO-DETALHE  
           ELSE
              MOVE 'REPROVADO'                 TO RESULTADO-DETALHE. 
      *
       IMPRESSAO-RELATORIO.                                             
           IF CONTLIN NOT LESS 10 THEN
              MOVE CONTPAG                     TO CAB1-PAG                      
              WRITE REG-IMP FROM CABECALHO1 BEFORE ADVANCING 1 LINES
              WRITE REG-IMP FROM CABECALHO2 BEFORE ADVANCING 1 LINES
              WRITE REG-IMP FROM CABECALHO3 BEFORE ADVANCING 1 LINES
              WRITE REG-IMP FROM TRACEJADO  BEFORE ADVANCING 1 LINES
              MOVE ZEROS                       TO CONTLIN                       
              ADD 1                            TO CONTPAG                       
           ELSE                                                    
              NEXT SENTENCE.                                  
           
           WRITE REG-IMP FROM LINHA-DETALHE BEFORE ADVANCING 1 LINES.  
           ADD 1                               TO CONTLIN.                      
      *
       VOLTA-A-LER.                                                     
           GO TO LEITURA-ARQUIVO.                                      
      *
       FIM-PROGRAMA.                                                    
           CLOSE ARQUIVO1  ARQUIVO2.                                   
           STOP RUN.                                                   
      *
       END PROGRAM PROG6601.
