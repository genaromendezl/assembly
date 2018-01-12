.model SMALL
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH    ;(0-255)
wDato3			DW			000FFh  ;(0-65535)
wDato4			DW			00001h
;                           100h

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX

;		ADD     dest, orig  ; dest = dest + orig
;		SUB     dest, orig  ; dest = dest - orig 
;		INC     dest  ; dest = dest + 1
;		DEC     dest  ; dest = dest - 1

        MOV		AX, wDato3
		ADD		AX, wDato4
		
		;   -10  -5   -8
		; MSB | 0 es positivo, 1 es negativo
		;  1 1 1 1 1 1 1 1  
		;  _ _ _ _ _ _ _ _		
		;  1111 1111 1111 1110
		;  0000 0000 0000 0001
		;  -------------------
		;                    1
		; --------------------
		;  0000 0000 0000 0010  (2)
		
		SUB     AX, 00F1h 
		
		INC     wDato3
		DEC		wDato4
		
		MOV     BX, 0FFFFh
		MOV     CX, 0FFFFh
		ADD     CX,BX  ; CX = CX + BX
		
		
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP
		END  main

