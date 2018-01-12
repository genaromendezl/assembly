.model SMALL
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH    ;(0-255)
wDato3			DW			010FFh  ;(0-65535)
wDato4			DW			00AFFh

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX
		

;	while i<10 do 
;		x = x + 10 
;		i = i + 1 
;	end 
;	x = 20 
		MOV		i,0
while1: 
		CMP 	i,10
		JAE 	finwhile1 
		ADD 	x,10 
		INC 	i ; salta si CX > 0
		JMP 	while1 
finwhile1:
		MOV 	x,20		

;   for cx = 10 downto 1
;       x = x + 10
;       cx = cx – 1 ; *
;   end
;   x = 20		
		MOV 	CX,10		
ciclo1:		
		ADD 	AX,10
		LOOP    ciclo1  ; LOOP decrementa CX y ciclo1
		MOV 	x,20		
		
		
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP

		END  main

