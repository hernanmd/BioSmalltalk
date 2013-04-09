testing
testGiList

	| giList |
	
	giList := (BioNCBIBlastReader newFromXML: self resultBlastp01) giList.
	self assert: (giList isKindOf: Collection).
	self deny: giList isEmpty.

	self assert: giList size = 10.
	self assert: (giList bioHasEqualElements: #('116414' '227369' '544028' '118083358' '326912741' '348530520' '130498679' '292622140' '47221590' '348526341'))
	

