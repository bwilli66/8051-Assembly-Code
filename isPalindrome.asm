;Check Palindrome 
;left = 0
;right = seqence.length - 1

;while (left<right)
; if(left != right)
;    return false
; left++
; right--

MOV 0x11, #0x01
MOV 0x12, #0x02
MOV 0x13, #0x03
MOV 0x14, #0x04
MOV 0x15, #0x02
MOV 0x16, #0x01; sequence
MOV R1, #0x11; first index

MOV R0, #0x06; sequence length

MOV A, R0
SUBB A, #0x01
MOV R0, A;  length-1

MOV A, R1
ADD A, R0
MOV R0, A; R0 = R1 + (R0-1)


loop:
MOV A, @R1
SUBB A, @R0 ; check if two values are the same (x-y=0)

JNZ breakFalse

INC R1; first index++
DEC R0; last index--

MOV A, R0
SUBB A, R1; check if first index < last index

JZ breakTrue; for odd sequence, middle value will result in 0
JNC loop
JC breakTrue

breakFalse:
MOV R1, #0x00
SJMP endProgram

breakTrue:
MOV R1, #0x01

endProgram:
NOP







