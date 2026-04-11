use16
org 0x7c00

;
mov di,storage
mov ax, 3
int 10h

lp:
mov ah,0 
int 16h

mov ah,0xE
int 10h
stosb

cmp al,0xD
jne lp
je ent

ent:
mov al,0
stosb

newline:
mov ah,2
mov bh,0
mov dl,0
mov dh,[colm]
int 10h
add dh,2
mov [colm],dh



;enter key pressed or not 
cld
mov si,storage
mov di,exit
mov cx,5
 repe cmpsb
jz exitpressed



mov ah,0xE
mov si,storage
prnt:
    lodsb 
    or al,al
    jz forenter
    int 10h
    jmp prnt   

forenter:
mov ah,2
mov bh,0
mov dl,0
mov dh,[colm]
int 10h
add dh,1
mov [colm],dh

;clearing storage
mov di,storage
mov al,0
mov cx,30
rep stosb
mov di,storage

;the closed infinite loop
jmp lp

exitpressed:
jmp halt

halt: ;the stopping label 
cli 
hlt

storage: times 30 db 0
colm db 1
exit: db "exit",0
exitl equ $ - exit
times 510 -($-$$) db 0 
dw 0xaa55