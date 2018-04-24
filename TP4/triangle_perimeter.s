.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */

        fld 12(%ebp)    # st[0] prend la valeur du premier cote du triangle
        fld 16(%ebp)    # st[1] prend la valeur du deuxieme cote du triangle
        faddp           # addition des deux premiers cotes du triangle   
        fld 20(%ebp)    # st[0] prend la valeur du troisieme cote du triangle
        faddp           # addition du troiseme cote du triangle aux deux premiers
        

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
