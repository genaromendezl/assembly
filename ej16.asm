.model SMALL
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH    ;(0-255)
wDato3			DW			010FFh  ;(0-65535)
wDato4			DW			00AFFh
bMsgIgual		DB			"Son iguales","$"
bMsgMenor       DB			"S1 es MENOR que S2","$" 
bMsgMayor       DB			"S1 es MAYOR que S2","$" 
bCadena1        DB          "Esta es una cadena",0
bCadena2        DB          "Esta es una cadenb",0
bCadena3        DB          50 dup (0)

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX
		MOV		ES, AX       ;  ES = AX
		
    ; SCAS (SCAN STRING) Y CMPS (COMPARE STRING)
	; UTILIZAN LOS REGISTROS INDICE
	; SI  SOURCE INDEX 
	; DI  DESTINATION INDEX
	; DF=0 , Autoincremento,  DF=1 Autodecremento
	;
	; Ejemplo
	; SCASB, compara [ES:DI]==AL e incrementa o
	;        decrementa el valor de DI dependiendo
	;        del valor en el la badera DF
	; 
	
	    CLD
		MOV		DI, OFFSET bCadena1
		MOV		AL, 0
		MOV		CX, 0FFFFh
		REPNE	SCASB   ; [ES:DI]==AL  -> SF, ZF
		        ;  ZF=1, SON IGUALES
				;  ZF=0, DIFERENTES
			    ;     SF=1 A<B  SF=0 A>B
				;  REPNE, CX=CX-1
        NEG		CX
		DEC		CX
        ;                  (19)
        ; Esta es una cadena0#
        ;(-1)               (-20)
        ;(FFFF)             (FFEC)
		
		CLD
		MOV		SI, OFFSET bCadena1
		MOV		DI, OFFSET bCadena2
		REPE	CMPSB		
		;    SI ZF=1, SON IGUALES
		;    SI ZF=0, NO SON IGUALES		
		JB 		Menor ; Salta si s1 < s2
		JA 		Mayor ; Salta si s1 > s2
				
;   Continua si son iguales		
		MOV		DX, OFFSET bMsgIgual
		MOV		AH,09h  ; funcion 09h desplegar cadena
		INT		21h     ; interrupción de MSDOS
		JMP		fin
Menor:
		MOV		DX, OFFSET bMsgMenor
		MOV		AH,09h
		INT		21h
		JMP		fin
Mayor:
		MOV		DX, OFFSET bMsgMenor
		MOV		AH,09h
		INT		21h
		JMP		fin	
		
fin:		
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP

		END  main

