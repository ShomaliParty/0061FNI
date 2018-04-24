.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        movl 20(%ebp), %ebx
        movl 16(%ebp), %ecx     /* outmatdata */
        movl 12(%ebp), %esi     /* inmatdata2 */
        movl 8(%ebp), %edi      /* inmatdata1 */
        movl $0, -4(%ebp)                       /* r */
        


        Boucle_1:
                cmp -4(%ebp), %ebx       /* matorder - r */
                jna end

                movl $0, -8(%ebp)        /* c = 0 */
        
        Boucle_2_0:
                cmp -8(%ebp), %ebx      /* matorder - c */
                jna incr_r

                movl $0, -16(%ebp)                      /* elem = 0 */
                movl $0, -12(%ebp)                      /* i = 0 */
        Boucle 3:
                cmp -12(%ebp), %ebx
                jna Boucle_21

                movl %ebx, %eax      /* # mettre matorder dans %eax pour multiplication */
                mul -4(%ebp)       /* # multiplier 'r' par le contenu de %eax (par defaut) */
                add -12(%ebp), %eax      /* i + resultat de multiplication dans eax */
                movl (%edi, %eax, 4), %edx

                movl %ebx, %eax      /* # mettre matorder dans %eax pour multiplication */
                mul -12(%ebp)       /* # multiplier 'i' par le contenu de %eax (par defaut) */
                add -8(%ebp), %eax      /* c + resultat de multiplication dans eax */
                imul %edx, (%esi, %eax, 4), %edx

        
/* voir sandov pr le rest*/



        
        incr_r:
                inc -4(%ebp)
                jmp Boucle_1

        Boucle_2_1:
                mov %ebx, %eax      /* # mettre matorder dans %eax pour multiplication */

                mul -4(%ebp)       /* # multiplier 'r' par le contenu de %eax (par defaut) */

                add -8(%ebp), %eax      /* c + resultat de multiplication dans eax */

                mov -16(%ebp), %edx             /* on met 'elem' dans edx car on peut pas mov mem-mem */
                mov %edx, (%ecx, %eax, 4)       /* outmatdata[c + r * matorder] = elem */
                
                inc -8(%ebp)                    /* ++c */
                jmp Boucle_2_0
        
        end:
                leave          /* restore ebp and esp */
                ret            /* return to the caller */
