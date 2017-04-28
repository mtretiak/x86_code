INCLUDE Irvine32.inc


;--------------------------------------------------------
;Student:Michael Tretiak
;CPSC 355 Assignment 3 Problem Bonus
;Program behaves like ATM
;prompts user for what they want to do, user enters a digit.
;then program will sum all values when prompted
;----------------------------------------------------------



;--------------------------------------------------------
;Data section
;--------------------------------------------------------
.DATA

	iBalance WORD ?
	deposits WORD ?
	withdrawls WORD ?
	fBalance WORD ?
	key WORD ?


	msgGreeting1 BYTE "Enter 1 to enter your starting balance." ,0
	msgGreeting2 BYTE "Enter 2 to deposit cash.",0
	msgGreeting3 BYTE "Enter 3 to withdrawl cash.",0
	msgGreeting4 BYTE "Enter 4 for your balance.",0
	msgQuit BYTE "Enter 5 to quit.",0
	msgInitialBalance BYTE "What is your starting balance today?",0
	msgDeposit BYTE "How much would you like to Deposit?",0
	msgWithdrawl BYTE "How much would you like to Withdrawl?",0
	msgBalance BYTE "Your balance is: ",0
	msgStop BYTE "Thank you!",0


;--------------------------------------------------------
;code
;--------------------------------------------------------
.code
	main proc

;-------------------------------------------------------
;Greeting
;prompts greeting and user input for next action
;-------------------------------------------------------
	greeting:
		call Crlf
		mov edx, OFFSET msgGreeting1;sets edx to message
		call WriteString;writes msg
		call Crlf

		mov edx, OFFSET msgGreeting2;sets message
		call WriteString;writes message
		call Crlf

		mov edx, OFFSET msgGreeting3
		call WriteString
		call Crlf

		mov edx, OFFSET msgGreeting4
		call WriteString
		call Crlf

		mov edx, OFFSET msgQuit
		call WriteString
		call Crlf

		mov ax, 0;sets ax to zero
		call Crlf;blank line

		call ReadInt;reads user input
		mov key, ax;sets value

		call Crlf

		;-------------------------------------------------------
		;compares value and then jumps to proper section
		;-------------------------------------------------------
		cmp ax,1;compares ax
			je initial;if 1 jump to initial
		cmp ax, 2
			je deposit
		cmp ax, 3
			je withdrawl
		cmp ax, 4
			je balance
		cmp ax, 5
			je stop




;--------------------------------------------------------
;Gets initial balance
;--------------------------------------------------------
		initial:
		mov edx, OFFSET msgInitialBalance;sets msg
		call WriteString;prints message
		call Crlf

		mov ax, 0

		call Crlf
		call ReadInt
		mov iBalance, ax ;mov initialBalance to ax reg

		add fBalance, ax ;adds initial balance to final balanace
		mov ax,0
		cmp ax,0
		jz greeting;jumps back to greeting to get more input
;--------------------------------------------------------
;prints prompt for deposit
;reads in int and adds it to final balance
;--------------------------------------------------------

	deposit:
		mov edx, OFFSET msgDeposit;sets msg
		call WriteString;prints msg
		call Crlf
		mov ax,0

		call Crlf
		call ReadInt;reads deposit value
		mov deposits, ax
		add ax, fBalance;adds it to final value

		mov fbalance,ax;moves ax to fBalance to save

		mov ax,0
		cmp ax,0
		jz greeting;jumps to greeting

;--------------------------------------------------------
;prints a wirthdrawl message and prompts for withdrawl
;--------------------------------------------------------
	withdrawl:
		mov edx, OFFSET msgWithdrawl;sets msg
		call WriteString;prints msg
		call Crlf;clear line

		mov ax,0;sets ax to zero

		call Crlf
		call ReadInt;reads in int from user
		mov withdrawls, ax
		mov ax,withdrawls

		sub fBalance, ax;subs from final balance

		mov ax,0
		cmp ax,0
		jz greeting;jumps to greeting

;-------------------------------------------------------
;Prints MSG and final balance
;-------------------------------------------------------
	balance:

		mov edx, OFFSET msgBalance;msg set
		call WriteString;prints msg
		call Crlf

		mov ax, fBalance;sets value to print

		call WriteInt;prints value
		call Crlf



		mov ax,0
		cmp ax,0

		jz greeting;jumps back to gretting

		;this where we jump back to greeting

;--------------------------------------------------------
;end msg
;--------------------------------------------------------
	stop:
		mov edx, OFFSET msgStop
		call Crlf
		call WriteString
		call crlf

	exit
main ENDP
END main
;end--------------------------------------------------------
