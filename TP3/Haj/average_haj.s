.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */
	#initialiser les variables

		movl 16(%ebp), %ecx			#matorder
		movl 12(%ebp), %ebx			#outmatdata
		movl 8(%ebp), %edx			#inmatdata

		push -4(%ebp)
		movl $0, -4(%ebp)			#r=0
		push -8(%ebp)
		movl $0, -8(%ebp)			#c=0
		push -12(%ebp)				

		
		FOR1:
			movl $0, -8(%ebp)					#init c
			movl $0, -12(%ebp)					#elem=0
			
			FOR2:
				movl %ecx, %esi					#esi=matorder
				imul -4(%ebp), %esi				#esi=r*matorder
				add -8(%ebp), %esi				#esi=c+r*matorder
				
				movl (%edx,%esi,4), %esi			#esi=INT(c+r*matorder)
				add %esi, -12(%ebp)					#elem+=INT(")
				
			CONDITION2:
				add $1, -8(%ebp)
				cmp %ecx, -8(%ebp)				#c-matorder
				jl FOR2							#Voir 2e boucle si condition

			AUTRE:
				movl $0, %edx
				movl -12(%ebp), %eax			#eax=elem
				div %ecx						#elem/matorder: eax=entier edx=reste
	
				movl -4(%ebp), %edi				
				movl %eax, (%ebx,%edi,4)		#OUT(r)=elem/matorder
				movl 8(%ebp), %edx				#reinit inmatdata

		CONDITION1:
			addl $1, -4(%ebp)
			cmp %ecx, -4(%ebp)		#r-matorder
			jl FOR1					#Voir 1e boucle si condition
		      

		
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		
