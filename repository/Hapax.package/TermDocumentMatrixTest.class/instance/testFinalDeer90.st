running
testFinalDeer90

	|  tdm |
	tdm := self testRemoveLegomena.
	self assert: tdm dimension = (12@9).
	
	self TODO.

	^tdm