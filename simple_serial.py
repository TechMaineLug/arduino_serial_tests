#!/usr/bin/env python

import serial

ser = serial.Serial(port='/dev/ttyUSB0', baudrate=115200, bytesize=8, parity='N', stopbits=1, timeout=1)

ser.open()
ser.write("hello\n")
str = ser.readline()

if len(str) == 0:
	print "Arduino is not responding!\n"
else:
	print str
  
