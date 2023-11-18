%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x',0
div: DB 'Результат: ',0
rem: DB 'Остаток от деления: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov eax,x
call atoi

mov ebx,12
mul ebx
add eax,3
xor edx,edx
mov ebx,5
div ebx
mov edi,eax

mov eax,div
call sprint
mov eax,edi
call iprintLF

mov eax,rem
call sprint
mov eax,edx
call iprintLF

call quit
