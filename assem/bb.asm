use16
org 0x7c00

;
mov ax,0
mov es,ax
mov ds,ax
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
jmp newline


newline:
mov ah,2
mov bh,0
mov dl,0
mov dh,[colm]
int 10h

add dh,2
mov [colm],dh


mov ah,0xE
mov si,storage
dark:
    lodsb 
    or al,al
    jz newline2
    int 10h
    jmp dark   

newline2:
mov ah,2
mov bh,0
mov dl,0
mov dh,[colm]
int 10h
inc dh
mov [colm],dh

;clearing storage
mov di,storage
mov al,0
mov cx,50
rep stosb
mov di,storage

jmp lp

cli 
hlt

storage: times 50 db 0
colm db 1
times 510 -($-$$) db 0 
dw 0xaa55