*BioPharo4
printYMDHMS
	" Answer the receiver's date <String> in user-friendly format "

	^ String streamContents: [ : s | 
		self printYMDOn: s.
		s nextPut: Character space.
		self printHMSOn: s ]