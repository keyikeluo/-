SEGMENT .data
Label2 DW 0
Label3 DW 0
Label5 DW 0
a DW 0
b DW 0
c DW 0
demo DW 0
i DW 0
j DW 0
program DW 0
SEGMENT .text
global _start
_start:
demo:
PUSH BP
MOV BP, SP
MOV DX, [a]
MOV CX, 2
ADD BX, DX
MOV AX, 2
ADD DX, DX
MOV DX, 2
MOV DX, 3
ADD DX, DX
MOV DX, [a]
MOV DX, 2
ADD DX, DX
MOV AX, BX
RET
main:
MOV DX, 3
MOV CX, 4
MOV BX, 2
MOV [a], DX
MOV [b], CX
PUSH BX
CALL demo
Label6:
MOV DX, [a]
PUSH DX
MOV DX, [b]
PUSH DX
PUSH AX
CALL program
Label7:
RET
program:
PUSH BP
MOV BP, SP
MOV DX, 0
MOV CX, [b]
MOV BX, [c]
ADD AX, CX
MOV [i], DX
MOV BX, [a]
JLE BX, AX, Label2
Label1:
MOV DX, [b]
MOV CX, [c]
IMUL DX, DX
MOV CX, 1
ADD DX, DX
MOV BX, [a]
ADD BX, BX
MOV [j], BX
JMP Label3
Label2:
MOV DX, [a]
MOV [j], DX
Label3:
MOV DX, [i]
MOV CX, 100
JG DX, CX, Label5
Label4:
MOV DX, [j]
MOV CX, 2
IMUL DX, DX
MOV [i], DX
MOV [j], DX
JMP Label3
Label5:
MOV AX, [i]
RET
MOV AX, 4C00h
INT 21h
