tests-text-mining
testRemovePrefixes

	" No prefixes found "
	self assert: ((BioBreed removePrefixes: 'NW') isKindOf: Collection).
	self assert: (BioBreed removePrefixes: 'NW') isEmpty.
	" Remove known prefix "
	self assert: ((BioBreed removePrefixes: 'N Portugal') bioHasEqualElements: #('Portugal')).
	" Empty case "
	self assert: ((BioBreed removePrefixes: '') isKindOf: Collection).
	self assert: (BioBreed removePrefixes: '') isEmpty.	
	" null case "
	self should: [ BioBreed removePrefixes: nil ] raise: MessageNotUnderstood.
	" Do not remove unknown prefix "
	self assert: ((BioBreed removePrefixes: 'China') bioHasEqualElements: #('China')).
	" Do not remove unknown prefix with several words "
	self assert: ((BioBreed removePrefixes: 'South China') bioHasEqualElements: #('South' 'China')).
