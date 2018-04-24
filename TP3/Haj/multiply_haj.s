.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
		       
	#initialiser les variables

		movl 20(%ebp), %ebx			#matorder
		movl 16(%ebp), %edx			#outmatdata
		movl 12(%ebp), %eax			#inmatdata2
		movl 8(%ebp), %ecx			#inmatdata1

		push -4(%ebp)
		movl $0, -4(%ebp)			#r=0
		push -8(%ebp)
		movl $0, -8(%ebp)			#c=0
		push -12(%ebp)				
		movl $0, -12(%ebp)			#i=0
		push -16(%ebp)		
		
		FOR1:
			movl $0, -8(%ebp)
			
			FOR2:
				movl $0, -16(%ebp)					#elem=0
				movl $0,-12(%ebp)
				
				FOR3:
					movl %ebx,%esi					#esi=matorder
					imul -4(%ebp), %esi				#r*matorder
					add	-12(%ebp), %esi				#i+r*matorder

					movl %ebx, %edi		
					imul -12(%ebp), %edi			#i*matorder
					add	-8(%ebp), %edi				#c+i*matorder

					movl (%ecx,%esi,4), %esi		#INT1(esi)
					movl (%eax,%edi,4), %edi		#INT2(edi)
				
					imul %edi, %esi					#INT1(esi)*INT2(edi)
		
					add %esi, -16(%ebp)				#elem+=imul
					
			
				
				CONDITION3:
					add $1, -12(%ebp)
					cmp %ebx, -12(%ebp)				#c-matorder
					jl FOR3							#Voir 2e boucle si condition
				
				AUTRE:
					movl %ebx, %esi					#esi=matorder
					imul -4(%ebp), %esi				#eax=r*matorder
					add -8(%ebp), %esi				#eax=c+r*matorder

					movl -16(%ebp), %edi
					movl %edi, (%edx,%esi,4)		#OUT(r)=elem
					
			CONDITION2:
				add $1, -8(%ebp)
				cmp %ebx, -8(%ebp)				#c-matorder
				jl FOR2							#Voir 2e boucle si condition
			
			
		CONDITION1:
			addl $1, -4(%ebp)
			cmp %ebx, -4(%ebp)		#matorder-r
			jl FOR1					#Voir 1e boucle si condition
		      

        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
