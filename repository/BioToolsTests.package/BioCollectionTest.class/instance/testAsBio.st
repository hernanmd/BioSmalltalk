testing
testAsBio

	| collection bioCollection |
	
	collection := OrderedCollection new add: 1; add: 4; yourself.
	bioCollection := collection asBio: BioOrderedCollection.

	self assert: (bioCollection isKindOf: BioOrderedCollection).
	self assert: (bioCollection hasEqualElements: collection).

	bioCollection := collection asBio: BioFileCollection.
	self assert: (bioCollection isKindOf: BioFileCollection).
	self assert: (bioCollection hasEqualElements: collection).
