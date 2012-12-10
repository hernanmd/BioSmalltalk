running
testTopTen

	| charts |
	terms := Terms sample.
	terms removeEnglishStopwords.
	charts := terms topTen.

	self assert: charts size = 10.
	self assert: charts first = 'tree'.
	self assert: charts second = 'paths'.
	self assert: charts third = 'root'.

	^terms