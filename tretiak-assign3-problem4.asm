INCLUDE Irvine32.inc
;--------------------------------------------------------
;Student:Michael Tretiak
;CPSC 355 Assignment 3 Problem 4
;Program translates from big Endian to Little Edian
;-------------------------------------------------------

;-------------------------------------------------------
;data
;-------------------------------------------------------
.DATA
	bigEndian BYTE 12h, 34h, 56h, 78h;array of values to switch
	littleEndian DWORD ?;end value


;-------------------------------------------------------
;code
;-------------------------------------------------------
.CODE
main PROC
	mov al, [bigEndian+3];swap 78h and 12h
    mov ah, [bigEndian]
    mov [bigEndian], al
    mov [bigEndian+3], ah

	mov al, [bigEndian+2] ;swap 56h and 34h
	mov ah, [bigEndian+1]
	mov [bigEndian+1], al
	mov [bigEndian+2], ah

	mov eax, DWORD PTR bigEndian;set reversed order to eax
	mov ittleEndian, eax;copy to our little endian
	exit;exit prompt
	main ENDP;end main proc
end MAIN;end all
