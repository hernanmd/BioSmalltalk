Class {
	#name : #BioNamedObjectTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'namedObject'
	],
	#category : #'BioTools-Tests-Core'
}

{ #category : #accessing }
BioNamedObjectTest >> setUp [
	" Set up any named object for testing "

	super setUp.
	namedObject := BioAccession new.

]

{ #category : #testing }
BioNamedObjectTest >> testAddDuplicateName [
	namedObject name: 'accessionName1'.
	self assert: namedObject name equals: 'accessionName1'.
	self
		shouldnt: [ namedObject addName: 'accessionName2' ]
		raise: BioDuplicatedObject.
	self
		should: [ namedObject addName: 'accessionName1' ]
		raise: BioDuplicatedObject
]

{ #category : #testing }
BioNamedObjectTest >> testAddNameRemovesNullName [

	namedObject := BioAccession new.
	self assert: namedObject includesNullName.
	
	namedObject name: 'accessionName1'.
	self deny: namedObject includesNullName.
	
]

{ #category : #testing }
BioNamedObjectTest >> testAddNames [
	namedObject name: 'accessionName1'.
	self assert: namedObject name equals: 'accessionName1'.
	namedObject addName: 'accessionName2'.
	" Preserve the preferred name "
	self assert: namedObject name equals: 'accessionName1'.
	self assert: namedObject preferredName equals: 'accessionName1'.
	self
		assert: namedObject names asOrderedCollection
		equals: (OrderedCollection with: 'accessionName1' with: 'accessionName2')
]

{ #category : #testing }
BioNamedObjectTest >> testAlphaName [
	namedObject := BioAccession new.
	namedObject
		addName: '425';
		addName: 'alpha'.
	self assert: namedObject alphaName equals: 'alpha'.
	namedObject := BioAccession new.
	self assert: namedObject alphaName equals: namedObject nullName.
	namedObject addName: String new.
	self assert: namedObject alphaName equals: String empty
]

{ #category : #testing }
BioNamedObjectTest >> testEmptyName [
	| nullName |
	nullName := 'Unnamed ' , namedObject class name.
	self assert: namedObject name equals: nullName.
	self deny: namedObject hasName
]

{ #category : #testing }
BioNamedObjectTest >> testName [
	namedObject name: 'accessionName1'.
	self assert: namedObject name equals: 'accessionName1'.
	self assert: namedObject preferredName equals: 'accessionName1'.
	self
		assert: namedObject names asOrderedCollection
		equals: (OrderedCollection with: 'accessionName1')
]

{ #category : #testing }
BioNamedObjectTest >> testNumericName [
	namedObject := BioAccession new.
	namedObject
		addName: 'alpha';
		addName: '425'.
	self assert: namedObject numericName equals: '425'.
	namedObject := BioAccession new.
	namedObject
		addName: 'alpha';
		addName: 425.
	self assert: namedObject numericName equals: 425
]

{ #category : #testing }
BioNamedObjectTest >> testRemoveNullName [

	namedObject := BioAccession new.
	self assert: namedObject includesNullName.
	
	namedObject removeNullName.
	self deny: namedObject includesNullName.

	
]
