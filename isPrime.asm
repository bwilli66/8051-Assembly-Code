; isPrime
MOV R0, #0x2F  ; number to test

;if R0 < 2
; R1 = #0x00

;if 2-R0 has no carry
; R0 is not prime

;if R0 == 2
; R1 = #0x01

;if 2-R0 results in Acc = 0
; R0 is prime

MOV A, #0x02

CLR	 C
SUBB A, R0

jz equalsTwo
jnc lessThanTwo
jc greaterThanTwo

equalsTwo:;R0 == 2
MOV R1, #0x01
sjmp endProgram

sjmp greaterThanTwo;skip over lessThanTwo

lessThanTwo:;R0 < 2
MOV R1, #0x00
sjmp endProgram

greaterThanTwo:
NOP;do nothing
;----------------------------------

;if R0 % 2 == 0
; R1 = #0x00

MOV A, R0
MOV B, #0X02

DIV AB;B hold remainder

MOV A, B

JZ dividesTwo;if remainder == 0
JNZ doesntDivideTwo; else

dividesTwo:;R0 % 2 == 0
MOV R1, #0x00
sjmp endProgram

doesntDivideTwo:
NOP;do nothing
;-----------------------------------

;loop
;for(int i=3; i<R0-1; i+=2)
;	if(R0 % i == 0)
;		R1 = #0x00

;set loop exit condition R0-1
MOV A, R0
SUBB A, #0x01
MOV R3, A

;set loop counter
MOV R2, #0x03

loop:
MOV A, R0
MOV B, R2

DIV AB

MOV A, B

JZ dividesLoopCount

;loopCount+=2
INC R2
INC R2

;check is R2(loopCount)<=R3(exit condtion)
MOV A, R3
SUBB A, R2
JC exitLoop

;jump to top of loop
SJMP loop

dividesLoopCount:
MOV R1, #0x00
SJMP endProgram

;R0 is prime
exitLoop:
MOV R1, #0x01

endProgram:
NOP


