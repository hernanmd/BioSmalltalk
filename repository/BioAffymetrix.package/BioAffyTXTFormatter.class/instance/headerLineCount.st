accessing
headerLineCount
	^ headerLineCount
		ifNil: [ headerLineCount := 6 ]