"
Test class for BioAlphabet and its subclasses. Validates alphabet construction, letter membership, and complement behavior.
"
Class {
	#name : 'BioAlphabetTest',
	#superclass : 'BioAbstractTest',
	#instVars : [
		'alphabet'
	],
	#category : 'BioTools-Tests-Alphabets',
	#package : 'BioTools-Tests',
	#tag : 'Alphabets'
}

{ #category : 'tests' }
BioAlphabetTest >> testCanTranslateDNAAlphabe [

	self assert: BioDNAAlphabet new canTranslate
]

{ #category : 'test' }
BioAlphabetTest >> testCanTranslateIUPACProtein [

	self deny: BioIUPACProtein new canTranslate 
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACAmbiguousDNACodes [

	self assert: (BioIUPACAmbiguousDNA new codes bioHasEqualElements: 'GATCRYWSMKHBVDN' ).
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACAmbiguousRNACodes [

	self assert: BioIUPACAmbiguousRNA new codes asSet equals: 'GAUCRYWSMKHBVDN' asSet.
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACDNAExtendedCodes [

	self assert: (BioIUPACDNAExtended new codes bioHasEqualElements: 'GATCBDSW').
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACProteinCodes [

	self assert: BioIUPACProtein new codes asSet equals: 'ACDEFGHIKLMNPQRSTVWY' asSet.
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACProteinExtendedCodes [

	self assert: BioIUPACProteinExtended new codes asSet equals: 'ACDEFGHIKLMNPQRSTVWYBXZJUO' asSet.
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACUnambiguousCodes [

	self assert: (BioIUPACUnambiguousDNA new codes bioHasEqualElements: 'GATCN').
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACUnambiguousDNACodes [

	self assert: (BioIUPACUnambiguousDNA new codes bioHasEqualElements: 'GATCN').
]

{ #category : 'tests' }
BioAlphabetTest >> testIUPACUnambiguousRNACodes [

	self assert: BioIUPACUnambiguousRNA new codes asSet equals: 'GAUC' asSet.
]

{ #category : 'testing' }
BioAlphabetTest >> testTranslation [

	self assert: ( BioIUPACDNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACRNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACProtein	withAllSubclasses noneSatisfy: [: alpha | alpha new canTranslate ] ).
	
]
