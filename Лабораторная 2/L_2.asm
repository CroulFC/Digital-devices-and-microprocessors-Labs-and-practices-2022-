.686
.model flat, stdcall
.stack 100h
.data
x dw 87A3h
y dw 5322h
z dw 07F1h
r dd 0
.code
start:
    ;Очистка регистров
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    ;Определения числа итераций
    mov cx, 3
    ;Начало цикла
    @cycle:
    ;Сдвиг для х
    mov ax, x
    ror ax, 1
    mov x, ax
    ;Сдвиг для y
    mov ax, y
    ror ax, 1
    mov y, ax
    ;Сдвиг для z
    mov ax, z
    ror ax, 1
    mov z, ax
    loop @cycle
    ;Загрузка переменных в регистры для проверки результата
    mov ax, x
    mov bx, y
    mov cx, z
    ;Очистка регистра под M
    xor eax, eax
    ;Вычисление заданного выражения
    mov ax, x
    sub ax, z
    add ax, y
    ;Сравнение результата выражения
    cmp ax, 0h
    ;Переход к соответствующим участкам
    ja pp1
    jbe pp2
    
    pp1:
        add ax, 5
        jmp cont
        
    pp2:
        mov bx, ax
        xor ax, ax
        sub ax, bx
        xor bx, bx
        jmp cont

    cont:
        cmp ax, 007Dh
        ja adr1
        jbe adr2
    
    adr1:
        mov ebx, 2h
        div ebx
        jmp exit 
    
    adr2:
        or ax, 17D1h
        jmp exit
    
    exit: 
        ret
        end start