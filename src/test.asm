

ORG 25000

start

; STEP1: 	STARTING SET UP

		DI
		CALL	PLAYER_OFF



; STEP2:	MUSIC RAM BUFFER

                LD      HL,#D000        	;* $40 BYTES FREE RAM MEMORY
                LD      [CANAL_A],HL		;* $10 BYTES x CHANNEL SHOULD BE ENOUGHT

                LD      HL,#D010
                LD      [CANAL_B],HL

                LD      HL,#D020
                LD      [CANAL_C],HL

                LD      HL,#D030
                LD      [CANAL_P],HL


                LD      A,0             	;* CANCION N� 0
                CALL    CARGA_CANCION

                INCLUDE "billiejean.mus.asm"
SONG_0:         INCBIN "billiejean.mus"

TABLA_SONG:     DW    SONG_0   ;


                INCLUDE "WYZPROPLAY47c_ZX.ASM"

                EI
LOOP:           HALT
                CALL    INICIO            ;CALL INICIO 1/50s
                JR    LOOP

end start
