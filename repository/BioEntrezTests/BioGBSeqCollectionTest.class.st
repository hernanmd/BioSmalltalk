Class {
	#name : #BioGBSeqCollectionTest,
	#superclass : #TestCase,
	#instVars : [
		'bioGBSeqCollection'
	],
	#category : #'BioEntrezTests-Core'
}

{ #category : #accessing }
BioGBSeqCollectionTest >> bioGBSeqCollection [
	" Answer the bioGBSeqCollection of this BioGBSeqCollectionTest "

	^ bioGBSeqCollection
]

{ #category : #accessing }
BioGBSeqCollectionTest >> bioGBSeqCollection: anObject [
	" Sets the bioGBSeqCollection of this BioGBSeqCollectionTest "

	bioGBSeqCollection := anObject
]

{ #category : #running }
BioGBSeqCollectionTest >> setUp [

	super setUp.
	bioGBSeqCollection := BioGBSeqCollection new.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testAccessionsWithVersion [

	| accKeyAccVer1 dict1 dict2 |
	
	accKeyAccVer1 := bioGBSeqCollection class qualifierForAccessionWithVersion.

	dict1 := Dictionary new at: accKeyAccVer1 put: 'BBBB.1'; yourself.
	dict2 := Dictionary new at: 'Test' put: 'AAAA'; yourself.

	self assert: bioGBSeqCollection accessionsWithVersion isEmpty.
	bioGBSeqCollection add: dict2.
	self assert: (bioGBSeqCollection accessionsWithVersion allSatisfy: #isEmpty).
	bioGBSeqCollection add: dict1.
	self deny: bioGBSeqCollection accessionsWithVersion isEmpty.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testAtAccession [

	| accKeyAccVer1 accKeyAccVer2 dict1 dict2 |
	
	accKeyAccVer1 := bioGBSeqCollection class qualifierForAccessionWithVersion.
	accKeyAccVer2 := bioGBSeqCollection class qualifierForXRefId.

	dict1 := Dictionary new at: accKeyAccVer1 put: 'BBBB.1'; yourself.
	dict2 := Dictionary new at: accKeyAccVer2 put: 'AAAA'; yourself.

	self should: [ bioGBSeqCollection atAccession: String empty ] raise: NotFound.
	bioGBSeqCollection add: dict2.
	self should: [ bioGBSeqCollection atAccession: String empty ] raise: NotFound.
	self should: [ bioGBSeqCollection atAccession: 'AAAAA.1' ] raise: NotFound.
	
	bioGBSeqCollection add: dict1.

	self should: [ bioGBSeqCollection atAccession: 'CCC' ] raise: NotFound.
	self assert: (bioGBSeqCollection atAccession: 'BBBB.1') equals: dict1.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testFeatures [

	self assert: (bioGBSeqCollection features isKindOf: Collection).

]

{ #category : #testing }
BioGBSeqCollectionTest >> testQualifierForAccessionWithVersion [

	self assert: (bioGBSeqCollection class qualifierForAccessionWithVersion isKindOf: String).
	self deny: bioGBSeqCollection class qualifierForAccessionWithVersion isEmpty.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testQualifierForAuthor [

	self assert: (bioGBSeqCollection class qualifierForAuthor isKindOf: String).
	self deny: bioGBSeqCollection class qualifierForAuthor isEmpty.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testQualifierForDefinition [

	self assert: (bioGBSeqCollection class qualifierForDefinition isKindOf: String).
	self deny: bioGBSeqCollection class qualifierForDefinition isEmpty.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testQualifierForReferenceJournal [

	self assert: (bioGBSeqCollection class qualifierForReferenceJournal isKindOf: String).
	self deny: bioGBSeqCollection class qualifierForReferenceJournal isEmpty.
]

{ #category : #testing }
BioGBSeqCollectionTest >> testQualifierForReferenceTitle [

	self assert: (bioGBSeqCollection class qualifierForReferenceTitle isKindOf: String).
	self deny: bioGBSeqCollection class qualifierForReferenceTitle isEmpty.
]
