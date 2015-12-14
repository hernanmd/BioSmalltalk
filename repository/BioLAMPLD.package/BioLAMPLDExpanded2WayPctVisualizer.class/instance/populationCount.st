initialization
populationCount
	" Answer a <Number> representing the count of problem (admixed) pòpulation "
	
	^ populationCount
		ifNil: [ populationCount := self dataPoints size / 2 ]
