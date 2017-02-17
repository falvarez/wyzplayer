                ORG 25000

start

                DI
                CALL PLAYER_OFF

                include "wyzplayer.asm"
                include "billiejean.mus.asm"
SONG_0:         incbin "billiejean.mus"

TABLA_SONG:     DW SONG_0

BUFFER_CANAL_A: DEFS 80

                CALL PLAYER_OFF

                DI
                CALL PLAYER_OFF
                LD HL, BUFFER_CANAL_A
                LD [CANAL_A], HL
                LD HL, BUFFER_CANAL_A + 20
                LD [CANAL_B], HL
                LD HL, BUFFER_CANAL_A + 40
                LD [CANAL_C], HL
                LD HL, BUFFER_CANAL_A + 60
                LD [CANAL_P], HL
                LD A, 0 ; Cancion 0
                CALL CARGA_CANCION

                EI
LOOP:           HALT
                CALL INICIO ; CALL INICIO 1/50s
                JR LOOP

end start
