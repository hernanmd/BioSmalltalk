tests-text-mining
testRemovePrefixes

	" No prefixes found "
	self assert: ((BioPopSpecies removePrefixes: 'NW') isKindOf: Collection).
	self assert: (BioPopSpecies removePrefixes: 'NW') isEmpty.
	" Remove known prefix "
	self assert: ((BioPopSpecies removePrefixes: 'N Portugal') bioHasEqualElements: #('Portugal')).
	" Empty case "
	self assert: ((BioPopSpecies removePrefixes: '') isKindOf: Collection).
	self assert: (BioPopSpecies removePrefixes: '') isEmpty.	
	" null case "
	self should: [ BioPopSpecies removePrefixes: nil ] raise: MessageNotUnderstood.
	" Do not remove unknown prefix "
	self assert: ((BioPopSpecies removePrefixes: 'China') bioHasEqualElements: #('China')).
	" Do not remove unknown prefix with several words "
	self assert: ((BioPopSpecies removePrefixes: 'South China') bioHasEqualElements: #('South' 'China')).
