accessing
dataLinesCount
	" Answer a <Number> with the count of the data lines in the receiver "

	^ dataLinesCount
		ifNil: [ dataLinesCount := 0 ]