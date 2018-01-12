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

		MOV		AX, wDato3
		MOV		BX, wDato4
		MOV		CX, 1234h
		PUSH    AX
		
		POP     BX
		
;		PUSHA   386
		PUSH	AX
		PUSH	BX
		PUSH 	CX
;		        :	

;		POPA    386
;               :		
		POP		CX		
		POP		BX		
		POP		AX	

        PUSHF
		POPF
		
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP
		END  main

