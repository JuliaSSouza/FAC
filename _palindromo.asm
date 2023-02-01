.data
   quebraLinha: .asciiz "\n"
   palavra: .space 256

.text
   main:
   
   li $t3, 0  #em t3 esta numero inicial = 0
   li $t5, 1 #resposta
   
   li $v0, 5
   syscall
   move $t0, $v0   #armazenado o numero(qtdeLetras) em t0
   
   li $v0, 8  #lendo a string e salva em t1
   la $a0, palavra
   la $a1, 256
   syscall
   move $t1, $a0
   
   add $t2, $t0, -1 #em t2 e armazenado o final = qtdeLetras - 1
   
   
   for:
   
   #for(int i = 0; i < fim; i++)
   slt $t4, $t3, $t2          #slt $t1, $t2, $t3 if t3 < t2(inicio < fim), t1 = 1 else t1 = 0
   beq $t4, $zero, saida      #se o t4 for 0 (t3> t2)inicio > fim ir pra exit 
   
   add $s6, $t1, $t3 #palavra + inicio
   lb $s2, 0($s6)    #palavra[inicio]  
   
   
   add $s7, $t1, $t2 #palavra + fim em s7
   lb $s3, 0($s7)  # palavra[fim]
   
   beq $s2, $s3, continue #se a letra do final for igual a do inicio
                          
   add $t5, $zero, $zero #se as letras forem diferentes, n e palindromo, t5 = 0                    
                                                                        
   continue:
   sub $t2, $t2, 1  #subtrai um do final(t2) = fim - 1
   addi $t3, $t3, 1 #adicionar 1 no inicio(t3) = inicio + 1
   
   j for
   
   saida:
   
   li $v0, 1
   move $a0, $t5
   syscall
   
   li $v0, 4
   la $a0, quebraLinha
   syscall
   
   li $v0, 10
   syscall
   