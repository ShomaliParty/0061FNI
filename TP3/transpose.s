.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */

        movl $0, -4(%ebp)               /* r = 0 */
        movl 16(%esp), %ebx              /* matorder dans ebx */
        movl 12(%esp), %ecx              /* outmatdata dans ecx */
        movl 8(%esp), %edi               /* inmatdata dans edi */

        
        Boucle_1:
                cmp -4(%ebp), %ebx       /* matorder - r */
                jna end
                movl $0, -8(%ebp)        /* c = 0 */

        Boucle_2:
                cmp -8(%ebp), %ebx
                jna incr
                
                mov %ebx, %eax
                mul -8(%ebp)
                add -4(%ebp), %eax
                mov (%edi, %eax, 4), %esi
                mov %ebx, %eax
                mul -4(%ebp)
                add -8(%ebp), %eax
                mov %esi, (%ecx, %eax, 4)

                inc -8(%ebp)
                jmp Boucle_2
        
        incr:
                inc -4(%ebp)
                jmp Boucle_1

        
        
        
        end:
                leave                   /* restore ebp and esp */
                ret                     /* return to the caller */
