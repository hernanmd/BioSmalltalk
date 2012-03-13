*BioSupport
fillMatrix: aMatrix atColumn: aColumnNumber repeat: aRepeatNumber

	| generator |
	generator := Generator on: [: g | 
		aRepeatNumber timesRepeat: [ g yield: self ] ].
	aMatrix 
		atColumn: aColumnNumber 
		put: generator upToEnd.