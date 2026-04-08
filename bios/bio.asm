use16
org 0x7c00

mov ax, 3
int 16

lp:
mov ah,0 
int 22

mov ah,0xE
int 16

cmp al,13
je newline
jne lp


newline:
mov ah,2
mov bh,0
mov dl,0
mov dh,[colm]
int 10h
inc dh
mov [colm],dh

jmp lp

cli 
hlt

colm db 1
times 510 -($-$$) db 0 
dw 0xaa55