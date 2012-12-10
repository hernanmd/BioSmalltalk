running
testRemoveStopwords

	|  tdm before expected |
	tdm := self testDeer90.
	before := tdm terms asArray.
	expected := 'for to in a well and of the' runsSatisfying: #isLetter.
	tdm removeEnglishStopwords.

	self assert: tdm dimension = (34@9).
	self assert: ((before \ tdm terms asArray) equalsTo: expected).

	^tdm