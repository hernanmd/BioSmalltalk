testing
testTokenizeFirstLine
	" Private - Answer a <String> with a sample phylip DNA "
	
	| firstLine |
	
	firstLine := '6   13
'.
	parseResult := self firstLineTokenizer parse: firstLine.
	self assert: (parseResult bioHasEqualElements: #('6' '13') ).
	
	firstLine := '      6   13
'.
	parseResult := self firstLineTokenizer parse: firstLine.
	self assert: (parseResult bioHasEqualElements: #('6' '13') ).
	
	firstLine := '6   13    
'.
	parseResult := self firstLineTokenizer parse: firstLine.
	self assert: (parseResult bioHasEqualElements: #('6' '13') ).