.model SMALL
.STACK 256

.DATA
; Lista de definiciones tabla 3-3 del libro, pag. 65
; Etiqueta		Tipo		Inicializacion
bDato1			DB			10H
bDato2			DB			01FH    ;(0-255)
wDato3			DW			010FFh  ;(0-65535)
wDato4			DW			00AFFh
i				DW			0
x				DW			0
;                           100h

.CODE
main 	PROC
		MOV		AX,@DATA
		MOV		DS, AX       ;  DS = AX

		MOV		CX, 6
		
	   ;JMP		etiq1 
		
		MOV		AX,10H
		MOV		BX,10H
		CMP		AX,BX   ;  ZF=1 (AX-BX)
                        ; (AX-BX) = 0  [ZF=1]
						; (AX-BX) > 0  [ZF=0,SF=0]
						; (AX-BX) < 0  [ZF=0,SF=1]
		JE		etiq1
				
        MOV		CX,1
etiq1:
		
		
						
;  Nomeclatura
;  J[Tipo de condicion]
;
;   E - EQUAL                [ A == B ]
;   N - NOT                  [ ! A ]
;
;   Enteros        Enteros     
;   Sin Signo      CON Signo
;   ------------------------------------------------------------------------------------------------------------------------
;   A - ABOVE      G - GREAT   [ A > B ]
;   B - BELOW      L - LOW     [ A < B ]
;
;  Combinaciones
;  ----------------------------------------------------------------------------------
;   Para enteros SIN signo
;   =======================
;   JNA - NOT ABOVE           [!(A > B)] 
;   JNB - NOT BELOW           [!(A < B)] 
;   JAE - ABOVE OR EQUAL      [  A >= B] 
;   JNAE - NOT ABOVE OR EQUAL [!(A >= B)]
;   JBE - BELOW OR EQUAL      [  A <= B] 
;   JNBE - NOT BELOW OR EQUAL [!(A <= B)]  
;
;   Para enteros CON signo
;   =======================
;   JNG - NOT ABOVE           [!(A > B)] 
;   JNL - NOT BELOW           [!(A < B)] 
;   JGE - GREAT OR EQUAL      [  A >= B] 
;   JNGE - NOT GREAT OR EQUAL [!(A >= B)]
;   JLE - LESS OR EQUAL       [  A <= B] 
;   JNLE - NOT LESS OR EQUAL  [!(A <= B)]  

						
						
		MOV		AH,04Ch
		MOV		AL,0
		INT		21h
main	ENDP

		END  main

