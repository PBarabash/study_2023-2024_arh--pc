%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg3 db "Значение функции: ",0h

section .bss
x resb 10
a resb 10

section .text
global _start
_start:

; Вводим x
mov eax,msg1
call sprint

mov ecx,x
mov edx,10
call sread

mov eax,x
call atoi
mov [x],eax

; Вводим a
mov eax,msg2
call sprint

mov ecx,a
mov edx,10
call sread

mov eax,a
call atoi
mov [a],eax

; Узнаем, какому условию соответствует
mov ecx,[x]
cmp ecx,[a]
jl firstfunction

mov ebx,[x]
dec ebx
mov eax, msg3
call sprint
mov eax,ebx
call iprintLF
jmp _end

firstfunction:
mov ebx,[a]
dec ebx
mov eax, msg3
call sprint
mov eax,ebx
call iprintLF
jmp _end

_end:
call quit
