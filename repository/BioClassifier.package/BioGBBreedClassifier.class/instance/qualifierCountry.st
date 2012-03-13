accessing-qualifiers
qualifierCountry
	" Answer a String with the receiver's country name if present "

	^ self subject 
		at: self idForCountry
		ifAbsent: [ String empty ]