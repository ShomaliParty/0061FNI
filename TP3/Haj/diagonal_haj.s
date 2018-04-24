.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
		       
	#initialiser les variables

		movl 16(%ebp), %ebx			#matorder
		movl 12(%ebp), %edx			#outmatdata
		movl 8(%ebp), %ecx			#inmatdata

		push -4(%ebp)
		movl $0, -4(%ebp)			#r=0
		push -8(%ebp)
		movl $0, -8(%ebp)			#c=0
		
		
		FOR1:
			movl $0, -8(%ebp)
			
			
			FOR2:

				movl -4(%ebp), %edi				#edi=r
				movl -8(%ebp), %eax				#esi=c

				movl %ebx, %esi					#esi=matorder
				imul -4(%ebp), %esi				#esi=r*matorder
				add -8(%ebp), %esi				#esi=c+r*matorder
				
				cmp %eax,%edi					#r-c
				jne ELSE

				movl (%ecx,%esi,4), %edi			#le contenu de INT(esi) est dans le registre edi
				movl %edi, (%edx,%esi,4)			#mettre contenu de INT(esi) dans OUT(esi)
				jmp CONDITION2
				ELSE:
					movl $0, (%edx,%esi,4)			#mettre 0 dans OUT(esi)
				
			CONDITION2:
				add $1, -8(%ebp)
				cmp %ebx, -8(%ebp)				#c-matorder
				jl FOR2							#Voir 2e boucle si condition
			
			
		CONDITION1:
			addl $1, -4(%ebp)
			cmp %ebx, -4(%ebp)		#r-matorder
			jl FOR1					#Voir 1e boucle si condition
		      

        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

