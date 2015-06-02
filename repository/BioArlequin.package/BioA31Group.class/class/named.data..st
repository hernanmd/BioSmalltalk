instance creation
named: aString data: sampleParams
	" Answer a new Arlequin group "

	^ self new 
		name: aString;
		data: sampleParams;
		yourself