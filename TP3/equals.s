.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        /* Write your solution here */

                movl $0, -4(%ebp)  /* #valeur 0 pour var locale 'r'*/
		mov 16(%ebp), %ebx /* #valeur de matorder dans ebx*/
		mov 12(%ebp), %ecx /* # valeur du pointeur inmatdata2 dans registre ecx*/
		mov 8(%ebp), %edi  /* # valeur de inmatdata1 dans registre edi, car edx utilise plus tard pour multiplcation */

		boucle_for_1:
			movl $0, -8(%ebp)       /*#valeur 0 pour var locale 'c'*/
			cmp -4(%ebp), %ebx      /*#compare matorder et r (matorder - r)*/
			jna return_1    /*#if matorder <= r, goto return_1*/

		boucle_for_2:
			cmp -8(%ebp), %ebx /*#compare matorder et c (matorder - c)*/
			jna     /* incrementation (voir sandu) */

                        mov %ebx, %eax   /* # mettre matorder dans %eax pour multiplication */

                        mul -4(%ebp),    /* # multiplier 'r' par le contenu de %eax (par defaut) */

                        add -8(%ebp), %eax /* # additionne 'c' et 'eax' (qui contient le
                                                resultat de la multiplication precedente) et place le
                                                resultat de l'adition dans 'eax'*/
                        cmp %eax(%edi) 

                        cmp (%edi, %eax, 4), (%ecx, %eax, 4)
                        jne return_0
                        /* #incrementer 'c' aka c++ */
                
                return_0:
                        movl $0, %eax
                        jmp end


                return_1:
                        movl $1, %eax
                        jmp end

                end:
                        leave          /* Restore ebp and esp */
                        ret            /* Return to the caller */
