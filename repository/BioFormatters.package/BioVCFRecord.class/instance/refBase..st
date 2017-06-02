accessing
refBase: aString
	" Set a <String> of reference base(s): A,C,G,T,N"

	self assert: (aString includesAnyOf: 'ACTGN').
	refBase := aString