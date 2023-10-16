SYS_EXIT        equ 1
SYS_READ        equ 3
SYS_WRITE       equ 4
STDIN           equ 0
STDOUT          equ 1

section .data
    msg1 db 'Insira um dígito', 0xa, 0xd
    len1 equ $ - msg1
    msg2 db 'Insira um segundo dígito', 0xa, 0xd
    len2 equ $ - msg2
    msg3 db 'A soma é:', 0xa, 0xd
    len3 equ $ - msg3

section .bss
    num1 resb 2
    num2 resb 2
    res resb 2  ; Corrigido para 2 bytes para armazenar um número de dois dígitos

section .text
    global _start

_start:
    ; Imprime a mensagem msg1
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; Lê o primeiro número
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2  ; Lê 2 bytes para permitir a entrada de um número de dois dígitos
    int 0x80

    ; Imprime a mensagem msg2
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; Lê o segundo número
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; Converte o primeiro número para decimal
    mov eax, [num1]
    sub eax, '0'

    ; Converte o segundo número para decimal
    mov ebx, [num2]
    sub ebx, '0'

    ; Soma eax e ebx
    add eax, ebx

    ; Converte o resultado de volta para ASCII
    add eax, '0'

    ; Armazena o resultado na variável 'res'
    mov [res], al  ; Apenas 1 byte é necessário para armazenar um dígito

    ; Imprime a mensagem msg3
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    ; Imprime o resultado
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 2
    int 0x80

    ; Termina o programa
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
