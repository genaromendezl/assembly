.model SMALL
.STACK 256
.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH
wDato3			DW			0FFFFh  ;(0-65535)
wDato4			DW			-50
dDato5			DD			12345678h
awDato6			DW			10H,20H,30H,40H
sDato7			DB	        "H","O","L","A"
sDato8			DB			"HOLA"
sDato9			DB			"LENGUAJE ENSAMBLADOR"
awDato10		DW			10 DUP(1234H)

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX

		MOV		AX, wDato3   ; AX = wDato3
		MOV		wDato4,AX    ; wDato4 = AX
		
		MOV		BX, 0AB12H
		MOV     awDato10, 1111h
		
		XCHG    AX,CX
		
		MOV		BX, AX
		MOV		AX, CX
		MOV		CX, BX		
		
		MOV     DX, awDato6+4 
	
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP
		END  main

