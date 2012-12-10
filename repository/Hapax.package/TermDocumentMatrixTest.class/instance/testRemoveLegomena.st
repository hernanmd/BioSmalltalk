running
testRemoveLegomena

	|  tdm expected |
	tdm := self testRemoveStopwords.
	tdm removeHapaxes.

	self assert: tdm dimension = (12@9).
	expected := 'computer eps graph human interface minors response survey system time trees user' runsSatisfying: #isLetter.
	self assert: (tdm terms asArray equalsTo: expected).

	^tdm