.MODEL small
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
etiq1			DB			10H
etiq2			DB			01FH
etiq3			DW			0FFFFh  ;(0-65535)
etiq4			DW			-50
etiq5			DD			12345678h
etiq6			DW			10H,20H,30H,40H
etiq7			DB	        "H","O","L","A"
etiq8			DB			"HOLA"
etiq9			DB			"LENGUAJE ENSAMBLADOR"
etiq10			DW			10 DUP(1234H)
etiq11			DW			10 DUP(?)
etiq12			DB			20 DUP("ASSEMBLER")


.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX
			
	    MOV		BL, etiq2
		MOV		CX, etiq3
		MOV		DX, etiq6+4
		
		MOV		DX, OFFSET etiq7
		MOV		AH,09
		INT		21H

		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP
		END  main

