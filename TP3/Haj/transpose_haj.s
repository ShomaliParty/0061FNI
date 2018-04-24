.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
	#initialiser les variables

		movl 16(%ebp), %ebx			#matorder
		movl 12(%ebp), %edx			#outmatdata2
		movl 8(%ebp), %ecx			#inmatdata1

		push -4(%ebp)
		movl $0, -4(%ebp)			#r=0
		push -8(%ebp)
		movl $0, -8(%ebp)			#c=0
		
		
		FOR1:
			movl $0, -8(%ebp)
			
			
			FOR2:
				movl %ebx, %esi
				imul -4(%ebp), %esi				#esi=r*matorder
				add -8(%ebp), %esi				#esi=c+r*matorder

				movl %ebx, %edi
				imul -8(%ebp), %edi				#edi=c*matorder
				add -4(%ebp), %edi				#edi=r+c*matorder
				
				movl (%ecx,%edi,4), %edi				#le contenu de INT(edi) est dans le registre esi
				movl %edi, (%edx,%esi,4)				#mettre contenu de INT(edi) dans OUT(eax)
				
				
			CONDITION2:
				add $1, -8(%ebp)
				cmp %ebx, -8(%ebp)				#c-matorder
				jl FOR2							#Voir 2e boucle si condition
			
			
		CONDITION1:
			addl $1, -4(%ebp)
			cmp %ebx, -4(%ebp)		#r-matorder
			jl FOR1					#Voir 1e boucle si condition
		      

        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
