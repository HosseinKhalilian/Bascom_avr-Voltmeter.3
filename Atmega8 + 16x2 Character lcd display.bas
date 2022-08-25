'======================================================================='

' Title: LCD Display Voltmeter 24-0
' Last Updated :  03.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega8 + 16x2 Character lcd display

'======================================================================='

$regfile = "m8def.dat"
$crystal = 8000000

Config Lcdpin = Pin , Db4 = Portb.3 , Db5 = Portb.2 , _
 Db6 = Portb.1 , Db7 = Portb.0 , E = Portb.4 , Rs = Portb.5
Config Lcd = 16 * 2

Config Adc = Single , Prescaler = Auto

Config Single = Scientific , Digits = 2

Dim A As Word
Dim B As Single

Cls
Cursor Off
Start Adc

'-----------------------------------------------------------

do

A = Getadc(0)
B = A
B = B / 42.625

Locate 2 , 1
Lcd "AI:" ; B ; "V"
Locate 1 , 1
Lcd "Analog Input:"
Waitms 250

loop
End

'-----------------------------------------------------------