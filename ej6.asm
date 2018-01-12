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

		MOV     AL, bDato1
		iMUL     bDato2  ;    AX = AL * origB
		
		MOV     AX, wDato3	                
		MUL     wDato4  ; DX:AX = AX * origW
		
		;DIV     orig    DX:AX/BX=AX  Residuo=DX
        ;                AX/BL=AL     Residuo=AH
		
	    MOV		BX,wDato4
		DIV     wDato4

;       MOV		AX,wDato4
;       MOV     BL,0h
;		DIV     BL    ; Division por cero.
		
		mov ax,1000h
		mov dx,1234h
		
		cwd       ; conv word dobleword 
		          ; cbw  conv byte a word
				  ; cdq  conv dobleword a quadword
				  
		mov bx,10h
		div bx ; en Ax SI puede guardar 100h		
		
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP
		END  main

