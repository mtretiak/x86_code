INCLUDE Irvine32.inc

;--------------------------------------------------------
;Student:Michael Tretiak
;CPSC 355 Assignment 3 Problem 1
;Program is designed to have hardcoded values input into arrays
;then program will sum the arrays, and total them.
;NOTE: deposits+iBalance>withdrawls
;-------------------------------------------------------

;-------------------
;Data
;-------------------
.Data
	iBalance WORD 100
	deposits WORD 100,1000,500,5,60
	tDeposit WORD ?
	tWithdrawl WORD ?
	withdrawls WORD 600,1000
	fBalance WORD ?
	key WORD ?
	msgDeposit BYTE "Total Deposit: ",0
	msgWithdrawl BYTE "Total Withdrawl: ",0
	msgIbalance BYTE "Initial Balance: ",0
	msgFbalance BYTE "Final Balance: ",0


;--------------
;CODE
;--------------
.CODE

	main PROC

;-------------
;sum arrays
;-------------

		mov ecx, lengthof deposits ; gathers the length of the array for loop count
		mov edx,0;set edx to zero
		mov eax,0
		Ldeposits:;start loop
			add ax, [deposits + (edx*2)];add the value in the array to ax
			;call WriteInt ;was for error checking
			;call crlf
			inc edx;increase our counter for array value by one
			loop ldeposits;loop

		mov edx, OFFSET msgDeposit;move message for print
		call WriteString;print message
		mov tDeposit, ax;move sum to total deposit
		call WriteInt;write tDeposit



		add iBalance,ax;add to our intitial balance
		mov ax, iBalance


		mov fBalance, ax;add to final balance

		call Crlf;clear line for looks

		mov ecx, lengthof withdrawls;length of withdrawl array
		mov edx,0;edx to zero
		mov ax,0
		Lwithdrawls:;start loop
			add ax, [withdrawls + (edx*2)];get value from array
			inc edx;increase array value by one
			loop Lwithdrawls;end loop

		mov edx, OFFSET msgWithdrawl;move message to edx
		call WriteString;print msg

		mov tWithdrawl, ax;move for print
		call WriteInt;print


		mov ax, fBalance
		sub ax, tWithdrawl;subtract from final

		call Crlf

		mov edx, OFFSET msgFbalance;set print messaage
		call WriteString
		mov fBalance,ax;print final balance
		call WriteInt

		call crlf

	exit;promts for exit
	main ENDP;ends main
END main;ends all
