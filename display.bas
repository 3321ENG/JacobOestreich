#config
__config _XT_OSC & _WDT_ON & _CP_OFF
#endconfig

TRISB=%00000000
'Define pin output for each digit
pins VAR byte[10]

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

n VAR byte
n=0
mloop:
	PORTB=pins[n]
	PAUSE 1000
	n=n+1
	IF (n<10) THEN
		GOTO mloop
	ELSE
		n=0
		GOTO mloop
	ENDIF
END