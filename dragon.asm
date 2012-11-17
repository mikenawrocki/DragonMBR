org 7C00h

Setup:  
	mov	sp, 0FF00h       ; Initialize the Stack pointer, arbitrarily
	mov	ax, 0Dh          ; Initialize the display to mode 0x0D, 320x200
	int	10h              ;    pixel graphic mode.

	mov	ax, 0C04h        ; Fill the entire screen with RED
	mov	dx, 199
Outer:
	mov	cx, 319
Inner:
	int	10h
	dec	cx
	cmp	cx, -1
	jne short Inner

	dec	dx
	mov	cx,dx
	cmp	cx, -1
	jne short Outer

	xor	bh, bh           ; Prepare to draw the dragon. Top left corner
	mov	cx, 100          ; at 100,7 px
	mov	dx, 7
	mov	si, Image
	push	cx

DrawPixel:
	add	si, [DIR]
	mov	al, [si]
	mov	cl, al
	sub	al, [COLOR]
	and	al, 1
	add	al, 15
	shr	cx, 1

RTELoop:
	mov	di, cx
	pop	cx
	int 	10h
	inc	cx
	cmp	cx, 220
	je short Incr
	push	cx
	mov	cx, di
	loop RTELoop
	jmp short DrawPixel

Incr:
	mov	cx, 100
	inc	dx
	cmp	dx, [YOFFT]
	jge short Done
	push	cx
	mov	cx, di
	loop RTELoop
	jmp short DrawPixel

Done:
	mov	cx, [DIR]
	neg	cx
	mov	[DIR], cx
	cmp	cx, 1
	je short Finish
	mov	cx, [YOFFT]
	add	cx, 93
	inc	si
	mov	[YOFFT], cx
	mov	cx, [COLOR]
	inc	cx
	mov	[COLOR], cx
	xor	cx,cx
	add	cx, 100
	push	cx
	jmp short DrawPixel
Finish:
	hlt
	jmp short	Finish

COLOR	dw 0
YOFFT	dw 100
DIR	dw 1

Image	db 0
	db 003h
	db 0FFh
	db 059h
	db 01Ch
	db 0DBh
	db 020h
	db 0C1h
	db 010h
	db 009h
	db 01Ah
	db 003h
	db 004h
	db 0AFh
	db 046h
	db 003h
	db 002h
	db 0A1h
	db 054h
	db 0A3h
	db 04Eh
	db 005h
	db 002h
	db 0A1h
	db 052h
	db 09Fh
	db 054h
	db 08Dh
	db 066h
	db 087h
	db 06Ah
	db 085h
	db 06Eh
	db 081h
	db 072h
	db 005h
	db 002h
	db 077h
	db 076h
	db 003h
	db 004h
	db 071h
	db 082h
	db 003h
	db 002h
	db 005h
	db 002h
	db 007h
	db 002h
	db 05Bh
	db 090h
	db 005h
	db 004h
	db 057h
	db 094h
	db 003h
	db 004h
	db 005h
	db 002h
	db 051h
	db 004h
	db 003h
	db 096h
	db 003h
	db 002h
	db 051h
	db 002h
	db 003h
	db 09Eh
	db 04Dh
	db 002h
	db 003h
	db 0A0h
	db 04Dh
	db 002h
	db 003h
	db 0A0h
	db 04Fh
	db 0A4h
	db 04Dh
	db 0A2h
	db 04Dh
	db 0A4h
	db 041h
	db 0B0h
	db 045h
	db 0ACh
	db 049h
	db 0A6h
	db 04Bh
	db 0A4h
	db 04Bh
	db 0A6h
	db 047h
	db 0A8h
	db 047h
	db 0AAh
	db 045h
	db 0AAh
	db 045h
	db 0AAh
	db 047h
	db 09Eh
	db 051h
	db 008h
	db 00Bh
	db 086h
	db 057h
	db 004h
	db 011h
	db 080h
	db 05Dh
	db 002h
	db 013h
	db 07Eh
	db 071h
	db 07Ch
	db 06Dh
	db 078h
	db 00Dh
	db 004h
	db 05Dh
	db 080h
	db 00Bh
	db 008h
	db 067h
	db 088h
	db 06Fh
	db 080h
	db 06Dh
	db 082h
	db 06Bh
	db 082h
	db 06Dh
	db 07Eh
	db 071h
	db 07Ah
	db 077h
	db 072h
	db 07Dh
	db 00Ah
	db 003h
	db 062h
	db 08Dh
	db 062h
	db 08Dh
	db 064h
	db 08Bh
	db 066h
	db 089h
	db 068h
	db 087h
	db 06Ah
	db 083h
	db 06Eh
	db 07Fh
	db 072h
	db 08Bh
	db 066h
	db 089h
	db 062h
	db 08Dh
	db 064h
	db 08Bh
	db 064h
	db 08Bh
	db 066h
	db 089h
	db 068h
	db 089h
	db 008h
	db 005h
	db 05Ah
	db 01Fh
	db 012h
	db 059h
	db 006h
	db 007h
	db 05Ch
	db 019h
	db 020h
	db 051h
	db 004h
	db 007h
	db 05Eh
	db 015h
	db 02Ch
	db 049h
	db 002h
	db 007h
	db 05Eh
	db 013h
	db 034h
	db 045h
	db 002h
	db 005h
	db 060h
	db 00Fh
	db 03Ch
	db 047h
	db 060h
	db 00Dh
	db 040h
	db 039h
	db 06Ch
	db 00Bh
	db 012h
	db 007h
	db 02Eh
	db 031h
	db 070h
	db 00Bh
	db 004h
	db 003h
	db 00Ah
	db 00Bh
	db 02Eh
	db 02Dh
	db 072h
	db 009h
	db 004h
	db 019h
	db 030h
	db 029h
	db 076h
	db 007h
	db 004h
	db 01Bh
	db 032h
	db 023h
	db 078h
	db 007h
	db 002h
	db 01Fh
	db 034h
	db 01Dh
	db 07Eh
	db 003h
	db 002h
	db 021h
	db 036h
	db 019h
	db 00Ch
	db 007h
	db 06Eh
	db 003h
	db 002h
	db 01Fh
	db 03Ch
	db 011h
	db 00Ch
	db 00Bh
	db 06Eh
	db 023h
	db 03Eh
	db 00Dh
	db 00Ch
	db 00Dh
	db 06Eh
	db 021h
	db 040h
	db 00Bh
	db 00Ch
	db 00Dh
	db 06Eh
	db 021h
	db 044h
	db 005h
	db 00Ch
	db 00Fh
	db 070h
	db 021h
	db 044h
	db 003h
	db 00Ah
	db 011h
	db 074h
	db 01Dh
	db 04Ch
	db 015h
	db 074h
	db 01Dh
	db 04Ah
	db 017h
	db 074h
	db 01Fh
	db 042h
	db 003h
	db 004h
	db 013h
	db 07Ah
	db 01Dh
	db 042h
	db 003h
	db 004h
	db 00Fh
	db 006h
	db 005h
	db 078h
	db 019h
	db 042h
	db 003h
	db 004h
	db 00Fh
	db 002h
	db 009h
	db 07Ch
	db 017h
	db 040h
	db 003h
	db 004h
	db 019h
	db 084h
	db 00Fh
	db 040h
	db 005h
	db 002h
	db 019h
	db 088h
	db 00Dh
	db 03Eh
	db 01Fh
	db 08Eh
	db 007h
	db 03Eh
	db 01Fh
	db 004h
	db 005h
	db 08Ah
	db 005h
	db 03Ch
	db 01Fh
	db 002h
	db 007h
	db 08Eh
	db 003h
	db 03Ah
	db 01Fh
	db 002h
	db 005h
	db 0CCh
	db 025h
	db 0CCh
	db 01Dh
	db 002h
	db 007h
	db 0CCh
	db 023h
	db 0CEh

        ;Zerofill up to0 510 bytes
	times 0200h - 2 - ($ - $$)  db 0
 
	dw 0AA55h          ;Boot Sector signature

%ifdef FDIMG
	;To zerofill up to the size of a standard 1.44MB, 3.5" floppy disk
	times 1474560 - ($ - $$) db 0
%endif
