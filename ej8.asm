.model SMALL
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH    ;(0-255)
wDato3			DW			010FFh  ;(0-65535)
wDato4			DW			00AFFh
;                           100h

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX

		MOV		AX, 1100101000111011b
		MOV     BX, 0001010011000000b
		AND		AX, BX ; AX = AX AND BX
		
		MOV		CX, 1100101000111011b
		MOV     DX, 0000111000000000b
		OR		CX, DX ; AX = AX OR BX

		MOV		AX, 1100101000111011b
		MOV     BX, 0000111000000000b
		XOR		AX, BX ; AX = AX OR BX
		
		NOT		AX   ;  AX = NOT AX

		MOV		AX, 1100101000111011b
		MOV     BX, 0001010011000000b		
		TEST    AX, BX ;  AX AND BX  -> Banderas
		
		CMP		AX, BX ;  AX - BX = 0  (iguales)
					   ;  AX - BX > 0  (AX > BX)
					   ;  AX - BX < 0  (AX < BX)
					   ;   5 - 10 (-5)
					   
		MOV     AX, 10
		MOV		BX, 10
		CMP		AX,BX

		MOV     AX, 10
		MOV		BX, 5
		CMP		AX,BX

		MOV     AX, 5
		MOV		BX, 10
		CMP		AX,BX
				
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP
		END  main

