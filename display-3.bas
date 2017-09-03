#config
__config _XT_OSC & _WDT_ON & _CP_OFF
#endconfig

TRISA=%000			'Set A0,1,2 as output
TRISB=%0000000		'Set B0-B6 as output

pins VAR byte[10]	'Array containing pin output for 7-segment
pins[0]=%0000001
pins[1]=%1001111
pins[2]=%0010010
pins[3]=%0000110
pins[4]=%1001100
pins[5]=%0100100
pins[6]=%0100000
pins[7]=%0001111
pins[8]=%0000000
pins[9]=%0000100

n VAR byte			'Variable containing number to display
n=0					'Initialise n starting at 0
c VAR byte
c=0
bpm VAR byte
bpm=255

n1 VAR byte
n2 VAR byte
n3 VAR byte

digits VAR byte[3]
digits[0]=%001
digits[1]=%010
digits[2]=%100


mainloop:

	n=bpm
	n1=n//10
	n=n-n1
	n2=n//100
	n=n-n2
	n2=n2/10
	n3=n/100
	
disp:
	PORTB=pins[n1]
	PORTA=digits[2]
	PAUSE 5

	PORTB=pins[n2]
	PORTA=digits[1]
	PAUSE 5

	PORTB=pins[n3]
	PORTA=digits[0]	
	PAUSE 5

	c=c+1
	IF (c<20) THEN
		GOTO disp
	ELSE
		c=0
		bpm=bpm-1
		IF (bpm=0) THEN
			bpm=255
		ENDIF
		GOTO mainloop
	ENDIF
END