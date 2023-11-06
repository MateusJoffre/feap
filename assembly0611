;Programa: HelloUser
;Author: Diego Fukayama, Mateus Joffre
;Version: 1.0

; MACROS
SYS_EXIT    equ 1
SYS_READ    equ 3
SYS_WRITE   equ 4
STDIN       equ 0
STDOUT      equ 1

section .data
    msg1 db "Insire seu nome: "
    len1 equ $-msg1

    msg2 db "Saudações, "
    len2 equ $-msg2

section .bss
    nome resb 10

section .text
    global _start

_start:
    ;Solicita o nome do usuário
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ;Lê o nome do usuário
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, nome
    mov edx, 10
    int  0x80

;Irá efetuar um loop para contar o total de caracteres que o usuário inseriu
;Isso evita a exibição desnecessária de bytes que não foram utilizados
xor esi, esi
.loop:
    mov edi, [nome + esi]   ;O ESI será o indíce para leitura de cada caractere da variável nome
                            ;O EDI será responsável pelo armazenamento do caractere

    cmp edi, 0              ;Efetua uma comparação com o caractere atual com 0
    je .print               ;Se for igual a zero, a string chegou ao fim, ele da um jump para imprimir o restante do texto
    inc esi                 ;Se não for igual, ele irá incrementar o ESI
    jmp .loop               ;Como não é o fim da string, ele irá repetir o processo

.print:
    ;Exibe "Saudações, [NOME DO USUÁRIO]"
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, nome
    mov edx, esi
    int 0x80

exit:
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
