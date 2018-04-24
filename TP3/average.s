.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		/* Write your solution here */

        movl $0, -4(%ebp)                        /* # 'r' = 0 */
		mov 16(%ebp), %ebx          /* #valeur de matorder dans ebx*/
		mov 12(%ebp), %ecx          /* # valeur du outmatdata dans ecx*/
		mov 8(%ebp), %edi           /* # valeur de inmatdata dans registre edi, car edx 
                                                utilise plus tard pour multiplcation */

        Boucle_1:
                cmp -4(%ebp), %ebx
                jna end
                movl $0, -8(%ebp)   /* c */
                movl $0, -12(%ebp)  /* elem */


        Boucle_2:
                cmp -8(%ebp), %ebx
                jna incr_r
                mov %ebx, %eax      /* # mettre matorder dans %eax pour multiplication */

                mul -4(%ebp),       /* # multiplier 'r' par le contenu de %eax (par defaut) */

                add -8(%ebp), %eax

                movl (%edi, %eax, 4), %esi
                add %esi, -12(%ebp)

        incr:
                mov -12(%ebp), %eax
                mov $0, %edx
                div %ebx
                mov %eax, (%ecx, -4(%ebp), 4)
                inc -4(%ebp)
                jmp Boucle_1


	
        leave          		    	/* Restore ebp and esp */
        ret           			 /* Return to the caller */
		
