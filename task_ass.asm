.model small
.stack 100h

.data
    msg1        db 0Dh,0Ah,0Dh,0Ah,"Enter password: $"
    wrong       db 0Dh,0Ah,0Dh,0Ah,"Wrong! You have "
    attemptsMsg db " attempts left.$"
    success     db 0Dh,0Ah,0Dh,0Ah,"Login Successful$"
    fail        db 0Dh,0Ah,0Dh,0Ah,"Login Failed$"


    pass    db "Assembly7",0
    input   db 20 dup(?)

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5

try_again:
    mov si, offset input

    mov ah, 09h
    mov dx, offset msg1
    int 21h

read_loop:
    mov ah, 08h
    int 21h

    cmp al, 13
    je compare

    cmp al, 8
    je backspace

    cmp al, 0
    je skip_special

    mov [si], al
    inc si

    mov ah, 0Eh
    mov bh, 0
    mov bl, 7
    int 10h
    jmp read_loop

skip_special:
    mov ah, 08h
    int 21h
    jmp read_loop

backspace:
    cmp si, offset input
    je read_loop

    dec si

    mov ah, 03h
    mov bh, 0
    int 10h

    cmp dl, 0
    je read_loop

    dec dl

    mov ah, 02h
    mov bh, 0
    int 10h

    mov al, ' '
    mov ah, 0Eh
    mov bh, 0
    mov bl, 7
    int 10h

    mov ah, 02h
    int 10h

    jmp read_loop

compare:
    mov byte ptr [si], 0

    mov si, offset input
    mov di, offset pass

check_chars:
    mov al, [si]
    mov bl, [di]

    cmp al, bl
    jne wrong_pass

    cmp al, 0
    je correct_pass

    inc si
    inc di
    jmp check_chars

correct_pass:
    mov ah, 09h
    mov dx, offset success
    int 21h
    jmp exit_program

wrong_pass:
    dec cx
    jcxz no_attempts

    mov ah, 09h
    mov dx, offset wrong
    int 21h

    mov ax, cx
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 09h
    mov dx, offset attemptsMsg
    int 21h

    jmp try_again

no_attempts:
    mov ah, 09h
    mov dx, offset fail
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h

main endp
end main
