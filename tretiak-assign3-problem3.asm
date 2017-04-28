INCLUDE Irvine32.inc

;--------------------------------------------------------
;Student:Michael Tretiak
;CPSC 355 Assignment 3 Problem 3
;Program is designed to create and store the first 7 fib numbers
;-------------------------------------------------------


;--------------------------------------------------------
;DATA
;--------------------------------------------------------
.DATA
		fibArray DWORD 7 DUP(0);creates array of 7 values
		msgEnd BYTE "END",0
		count BYTE 1;count value


;--------------------------------------------------------
;Code
;--------------------------------------------------------
.code

	main PROC
		mov   eax,1;sets first fib value
		call  WriteInt;prints it
		mov [fibArray],eax;moves it to first array place
		mov eax,1;second value
		call WriteInt;prints
		mov [fibArray+4],eax;sets second fib for base

		mov ebx,1;sets values for calculation
		mov edx,1
		mov ecx,5;count value
		mov	esi,1
		L1:

			inc esi
			mov  eax,ebx    ;eax = ebx + edx
			add  eax,edx
			call WriteInt   ;prints value
			mov  ebx,edx
			mov  edx,eax
			mov [fibArray+(esi*4)], eax;stores value in proper place
			Loop L1;loop

			call Crlf




		mov eax,0
		mov esi,0 ;set to zero
		mov ecx, lengthOf fibArray ;sets loop count to length of array if we want to make array bigger
	print:
			mov eax,fibArray[esi*4];gets values to print
			call WriteInt ;print
			;call Crlf
			inc esi;increase our counter
			loop print

	call Crlf
	exit;calls for exit
	main ENDP;ends main proc
END main;ends all
;--------------------------------------------------------
