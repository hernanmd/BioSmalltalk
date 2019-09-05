Class {
	#name : #BioCollectionTest,
	#superclass : #BioAbstractTest,
	#category : 'BioToolsTests-Core'
}

{ #category : #testing }
BioCollectionTest >> testAsBio [

	| collection bioCollection |
	
	collection := OrderedCollection new add: 1; add: 4; yourself.
	bioCollection := collection asBio: BioOrderedCollection.

	self assert: (bioCollection isKindOf: BioOrderedCollection).
	self assert: (bioCollection hasEqualElements: collection).

	bioCollection := collection asBio: BioFileCollection.
	self assert: (bioCollection isKindOf: BioFileCollection).
	self assert: (bioCollection hasEqualElements: collection).

]

{ #category : #testing }
BioCollectionTest >> testAsFileDirectoryCollection [


	
]

{ #category : #testing }
BioCollectionTest >> testAsLowercase [

	self assert: 'This is A SAMPLE COLLECTION' asLowercase = 'this is a sample collection'.
	self assert: '' asLowercase = ''.
	self assert: #('SAMPLE' 'string' 'For' 'teSTING') asLowercase = #('sample' 'string' 'for' 'testing').
	
]

{ #category : #testing }
BioCollectionTest >> testIsBioCollection [

	self assert: (BioOrderedCollection withAllSubclasses allSatisfy: [ : cls | cls new isBioCollection ]) .
	self deny: OrderedCollection new isBioCollection.
]

{ #category : #testing }
BioCollectionTest >> testIsBiologicalSequence [

	self assert: 'ACGT' isBiologicalSequence.
	self assert: 'TWRP' isBiologicalSequence.
	
	self deny: 1 isBiologicalSequence.
	self deny: $. isBiologicalSequence.
	self deny: '    ' isBiologicalSequence.
	self deny: '' isBiologicalSequence.
	self deny: OrderedCollection new isBiologicalSequence.
]
