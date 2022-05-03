.686
.model flat, stdcall
.data
dots dd -3.0, -3.0, -1.0, -1.0, 6.0, 6.0
k dd 0.0, 0.0
.code
start: 
    ;Сравниваем x3, x2 и x1
    fld dots
    fld dots + 4*2
    fld dots + 4*4
    fcomip st, st(1)
    jne c2
    fcomip st, st(1)
    jne c2
    mov eax, 0h
    jmp ex
    
    ;Продолжаем выполнение
    c2:
    ffree st(1)
    ffree st(0)
    ;То же самое для y3, y2, y1
    fld dots + 4*1
    fld dots + 4*3
    fld dots + 4*5
    fcomip st, st(1)
    jne c3
    fcomip st, st(1)
    jne c3
    mov eax, 0h
    jmp ex
    
    ;теперь считаем
    c3:
    ffree st(1)
    ffree st(0)
    ;x3-x1
    fld dots + 4*4
    fld dots
    fsub
    fstp k
    ;x2-x1
    fld dots + 4*2
    fld dots
    fsub
    ;деление
    fld k
    fdivrp st(1), st(0)
    fstp k
    
    ;Часть с y
    ;y3-y1
    fld dots + 4*5
    fld dots + 4
    fsub
    fstp k + 4
    ;y2-y1
    fld dots + 4*3
    fld dots + 4
    fsub
    ;деление
    fld k + 4
    fdivrp st(1), st(0)
    fstp k + 4
    
    ;Проверка
    xor eax, eax
    fld k
    fld k + 4
    fcomip st, st(1)
    je ex
    mov eax, 1111111111111111b    
    ex: 
        ret
        end start