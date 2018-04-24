.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        /* Write your solution here */
		#initialiser les variables

		mov 16(%ebp), %eax		#matorder
		mov 12(%ebp), %edx		#inmatdata2
		mov 8(%ebp), %ecx		#inmatdata1
		mov $0, %ebx			#r=0
		mov $0, %edi			#c=0
		
		jmp CONDITION1

		FOR1:
			jmp CONDITION2

			FOR2:
				
				imul %ebx, %eax				#eax=r*matorder
				add %edi, %eax				#eax=c+r*matorder
				inc %edi
				mov (%ecx,%eax,4), %esi			#le contenu de INT1(eax) est dans le registre esi
				cmp %esi, (%edx,%eax,4)			#INT1(eax)-INT2(eax)
				jne RETURN0
				
			
			CONDITION2:
				mov 16(%ebp), %eax			#afin d'assurer eax=matorder à tous les tours
				cmp %edi,%eax				#matorder-c
				jae FOR2					#Voir 2e boucle si condition

			inc %ebx

		CONDITION1:
			mov 16(%ebp), %eax				#reinit matorder
			cmp %ebx, %eax					#matorder-r
			jae FOR1						#Voir 1e boucle si condition
		
		mov $1,%eax				#return 1
		jmp END			
		
		RETURN0:
			mov $0,%eax			#retun 0
		END:

		
			
        
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
