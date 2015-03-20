testing
testCSV01

	| file |
	
	file := BioCSVFile on: self csvContents01.
	self deny: file isNil.
	
	file ignoreLinesCount: 2.
	self assert: file ignoreLinesCount = 2.
	
	file ignoreFirstLines.
	self assert: file ignoreLinesStrategy = #ignoreHeadersCount:.
	
	file ignoreLastLines.
	self assert: file ignoreLinesStrategy = #ignoreLastLinesCount:
