use16
;org 0x7C00
l:
mov ax, 0x3
int 10h

mov ax, 0xB800
mov es,ax

mov di, 0

mov ah, 0x7F
mov si,love

print:
    lodsb
    cmp al, 0
    jz halt
    stosw
    jmp print

halt:
cli
hlt


love: db "******** loves Feroz",0
times 510 - ( $ - $$ ) db 0
dw 0xAA55
