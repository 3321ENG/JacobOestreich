#config
__config _XT_OSC & _WDT_ON & _CP_OFF
#endconfig

bigloop: HIGH PORTA.1
		PAUSE 1000

		LOW PORTA.1
		pause 1000

		GOTO bigloop
		END
		