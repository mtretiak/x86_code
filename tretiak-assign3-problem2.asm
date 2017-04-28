INCLUDE Irvine32.inc
;--------------------------------------------------------
;Student:Michael Tretiak
;CPSC 355 Assignment 3 Problem 2
;Program is designed to reverse an array in place and print
;-------------------------------------------------------
.DATA
	; Hardcode values
	array  BYTE 1,5,6,8,0Ah,1Bh,1Eh,22h,2Ah,32h   ; Create Array of five elements
	;leng = ($ - arrayB)
	msg1    BYTE "Before: ",0
	msg2    BYTE "After: ",0
	msgReverseArray BYTE "Reverse Array",0

.CODE

	main PROC
		mov edx, OFFSET msgReverseArray   ; "Reverse Array"
        call WriteString ;display string
        call Crlf;clear line

		;--------------------------------------------------------
		; Display Array Before Reversing Elements
		;--------------------------------------------------------
		mov edx, OFFSET msg1; "Before"
		call WriteString;prints msg
		call Crlf

		mov eax,0;eax set to zero
		mov esi,0
		mov ecx, lengthof array;ecx set to length of our array

	printBefore:
			mov al,array[esi]
			call WriteDec;print array value from above

			call Crlf
			inc esi; increase esi
			loop printBefore;loop
		;--------------------------------------------------------
		; Reverse Elements
		;--------------------------------------------------------
		mov eax,0;eax is set to zero
		mov esi,0
		mov edi, lengthof array -1;length of array -1 since array indexing

		mov ecx, lengthof array / 2;length divided by 2
	reverse:
			mov al,array[esi]
			mov bl, array[edi];mov array value to bl
			xchg al,bl        ;exchange call to switch values
			mov [array+esi],al;move the values into place
			mov [array+edi],bl
			inc esi;increase by one
			dec edi;decrease by one
			loop reverse;loop
		;--------------------------------------------------------
		;Display Array After Reversing Elements
		;--------------------------------------------------------
		mov edx, OFFSET msg2    ; "After: "
		call Crlf

		mov eax,0
		mov esi,0
		mov ecx, lengthof array
	printAfter:
			mov al,array[esi];value to print
			call WriteDec;print

			call Crlf
			inc esi;increase by one
			loop printAfter;loop

		call WaitMsg;displays a message and waits for a key to be pressed.
		exit
	main ENDP;end main proc
END main;end all
;--------------------------------------------------------
