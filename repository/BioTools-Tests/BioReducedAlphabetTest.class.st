"
Test class for BioReducedAlphabet and BioReducedAlphabetRegistry. Validates reduced alphabet mapping and registry behavior.
"
Class {
	#name : 'BioReducedAlphabetTest',
	#superclass : 'TestCase',
	#category : 'BioTools-Tests-Alphabets',
	#package : 'BioTools-Tests',
	#tag : 'Alphabets'
}

{ #category : 'tests' }
BioReducedAlphabetTest >> testAllNames [

	| names |
	names := BioReducedAlphabetRegistry instance classicAlphabets keys.
	self assert: (names includes: #DAYHOFF6).
	self assert: (names includes: #MURPHY15)
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testBioSequenceExtension [

	| protein result |
	protein := BioSequence newProtein: 'ACDE'.
	result := protein reducedWith: #Dayhoff6.
	self assert: result size equals: 4
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testCustomAlphabetCreation [

	| m alpha |
	m := Dictionary new.
	m at: $A put: 1.
	m at: $C put: 1.
	m at: $D put: 2.
	m at: $E put: 2.
	alpha := BioReducedAlphabet
		         fromMapping: m
		         name: 'Custom2'
		         size: 2
		         source: 'test'.
	self assert: alpha size equals: 2.
	self assert: (alpha reduce: 'ACD') equals: '112'
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testDayhoff6Reduction [

	| alpha result |
	alpha := BioReducedAlphabetRegistry get: #Dayhoff6.
	result := alpha reduce: 'ACDEFGHIKLMNPQRSTVWY'.
	self assert: result size equals: 20.
	self assert: alpha size equals: 6
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testGBMR4Reduction [

	| alpha |
	alpha := BioReducedAlphabetRegistry get: #GBMR4.
	self assert: alpha size equals: 4
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testMurphy15 [

	| alpha |
	alpha := BioReducedAlphabetRegistry get: #Murphy15.
	self assert: alpha size equals: 15
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testMurphy15Reduction [

	| alpha result |
	alpha := BioReducedAlphabetRegistry get: #Murphy15.
	result := alpha reduce: 'ACDEFGHIKLMNPQRSTVWY'.
	self assert: result size equals: 20.
	self assert: alpha size equals: 15
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testRegistryExists [

	self assert:
		BioReducedAlphabetRegistry instance classicAlphabets notNil
]

{ #category : 'tests' }
BioReducedAlphabetTest >> testWWMJ5Reduction [

	| alpha |
	alpha := BioReducedAlphabetRegistry get: #WWMJ5.
	self assert: alpha size equals: 5
]
