	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	AREA Mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	MOV R0,#10
	MOV R1,#8
	MOV R2,#2
	MOV R3,#4
	MOV R4,#7
	MOV R5,#1
	MOV R6,#9
	MOV R7,#3
	MOV R8,#5
	MOV R9,#6
	STMDB R13!,{R0-R9}
	MOV R0,R13
L2
	MOV R1,R0
	MOV R3,R0
	ADD R3,#4
	ADD R11,R10,#1
L1
	LDM R3,{R4}
	LDM R1,{R7}
	CMP R4,R7
	BCS UP
	MOV R1,R3
UP
	ADD R3,#4
	ADD R11,#1
	CMP R11,#10
	BNE L1
	LDM R0!,{R2}
	LDM R1!,{R6}
	STMDB R1,{R2}
	STMDB R0,{R6}
	ADD R10,#1
	CMP R10,#9
	BNE L2
	LDM R13!,{R0-R9}
STOP
	B STOP
	END