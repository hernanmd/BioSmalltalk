Class {
	#name : #BioNamingTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'formatter'
	],
	#category : 'BioFormatterTests-Core'
}

{ #category : #testing }
BioNamingTest >> testAsTriplet [

	| seqFmt |
	
	seqFmt := BioSequenceFormatter new sequence: 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA'.

	seqFmt delimiterTargetCharacter: Character space.
	self assert: seqFmt asTriplet = 'CCA CAC CAC ACC CAC ACA CCC ACA CAC CAC ACC ACA CAC CAC ACC ACA CCC ACA CAC ACA'.

	seqFmt delimiterTargetCharacter: Character tab.
	self assert: seqFmt asTriplet =  'CCA	CAC	CAC	ACC	CAC	ACA	CCC	ACA	CAC	CAC	ACC	ACA	CAC	CAC	ACC	ACA	CCC	ACA	CAC	ACA'.
]

{ #category : #testing }
BioNamingTest >> testContraction [

	formatter := BioContractionNaming new.
	
	self assert: ( formatter format: 'South Africa One' ) = 'SAO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWA'.
	
	formatter contractionLimit: 2.
	self assert: ( formatter format: 'South Africa One' ) = 'SA'.
	
	formatter contractionLimit: 1.
	self assert: ( formatter format: 'South Africa One' ) = 'S'.


]

{ #category : #testing }
BioNamingTest >> testContractionCapitalization [

	formatter := BioContractionNaming new.
	
	formatter unsetCapitalization.
	self assert: ( formatter format: 'South africa One' ) = 'SaO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWa'.
	
	formatter setCapitalization.
	self assert: ( formatter format: 'South Africa One' ) = 'SAO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWA'.


]

{ #category : #testing }
BioNamingTest >> testContractionLimit [

	formatter := BioContractionNaming new.
	
	self assert: ( formatter format: 'South Africa One' ) = 'SAO'.
	self assert: ( formatter format: 'Belgian White and Blue Pied' ) = 'BWA'.
	
	formatter contractionLimit: 2.
	self assert: ( formatter format: 'South Africa One' ) size = 2.
	self assert: ( formatter format: 'South Africa One' ) = 'SA'.
	
	formatter contractionLimit: 1.
	self assert: ( formatter format: 'South Africa One' ) size = 1.
	self assert: ( formatter format: 'South Africa One' ) = 'S'.
	
	formatter contractionLimit: 5.
	self should: [ formatter format: 'South Africa One' ] raise: BioErrorSpecificationObject.

]

{ #category : #testing }
BioNamingTest >> testJoinSequence [

	| seq01 |
	
	seq01 := #( 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACA
' 'CATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT
').
	self assert: (BioSequenceFormatter joinSequence: seq01) = 'CCACACCACACCCACACACCCACACACCACACCACACACCACACCACACCCACACACACACATCCTAACACTACCCTAACACAGCCCTAATCTAACCCTGGCCAACCTGTCTCTCAACTT'.
	
	self assert: (BioSequenceFormatter joinSequence: String empty) = String empty.
]
