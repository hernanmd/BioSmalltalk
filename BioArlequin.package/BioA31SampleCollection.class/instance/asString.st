converting
asString
	" Answer the String representation of the receiver." 	

	^ String streamContents: [ : stream |
		self writeSamplesOn: stream 
			delimiter: self iniFile newProfileSection locusSeparator value. ]
	