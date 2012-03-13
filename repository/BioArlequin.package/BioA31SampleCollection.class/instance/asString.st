accessing
asString
	" Answer the String representation of the receiver." 	

	self halt.
	^ String streamContents: [: stream |
		self writeSamplesOn: stream 
			delimiter: self iniFile profileSection locusSeparator value. ]
	