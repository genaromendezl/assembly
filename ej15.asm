.model SMALL
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH    ;(0-255)
wDato3			DW			010FFh  ;(0-65535)
wDato4			DW			00AFFh
bCadena1        DB          "Esta es una cadena",0
bCadena2        DB          50 dup (0)

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX
		MOV		ES, AX       ;  ES = AX
		
        ; REGISTROS INDICE
		; SI  SOURCE INDEX 
		; DI  DESTINATION INDEX
		
		MOV		SI, OFFSET bCadena1	
		MOV     DI, OFFSET bCadena2
		
		CLD 	; DF=0, Auto-Incrementa si/di	
		MOV		CX,19

		REP		MOVSB

		
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP

		END  main

