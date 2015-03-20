accessing
nameIndex
	" Answer a Number representing the current processed name "
	
	^ nameIndex
		ifNil: [ nameIndex := 1 ]
