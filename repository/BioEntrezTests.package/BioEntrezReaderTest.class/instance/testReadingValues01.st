testing
testReadingValues01

	reader := BioEReader newFromXML: self eSearchResult01 readStream.
	
	self assert: ( reader isKindOf: BioEReader ).
	self deny: reader contents isNil.
	self deny: reader contents isEmpty.
	self assert: (reader idList bioHasEqualElements: #('57240072' '57240071' '6273287' '6273291' '6273290' '6273289' '6273286' '6273285' '6273284')).
	self assert: reader count = '9'.
	self assert: reader retMax = '9'.
	self should: [ reader queryKey ] raise: BioNotFoundObject.
