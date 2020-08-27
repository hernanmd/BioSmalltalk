Class {
	#name : #BioAccessionTest,
	#superclass : #BioAbstractTest,
	#category : #'BioTools-Tests-Core'
}

{ #category : #testing }
BioAccessionTest >> testAsString [
	self
		assert:
			(BioAccession new
				name: 'AF288373';
				version: 2;
				yourself) asString
		equals: 'AF288373.2'.
	self
		assert:
			(BioAccession new
				name: String empty;
				yourself) asString
		equals: String empty
]

{ #category : #testing }
BioAccessionTest >> testHasVersion [
	
	| accession |
	
	accession := BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself.
	self assert: accession hasVersion.

	accession := BioAccession new 
					name: 'AF288373';
					yourself.
	self deny: accession hasVersion.

	accession := BioAccession new 
					name: 'AF288373';
					version: nil;
					yourself.
	self deny: accession hasVersion.

]

{ #category : #testing }
BioAccessionTest >> testIsEmpty [

	self deny: 'AF288373.2' asAccession isEmpty.
	self deny: (BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself) isEmpty.
	self assert: (BioAccession new 
					name: String empty;
					version: 2;
					yourself) isEmpty.
	self assert: BioAccession new isEmpty.
	
	self should: [ String empty asAccession ] raise: BioException.
]

{ #category : #testing }
BioAccessionTest >> testIsVersioned [
	
	| accession |
	
	accession := BioAccession new 
					name: 'AF288373';
					version: 2;
					yourself.
	self assert: accession isVersioned.

	accession := BioAccession new 
					name: 'AF288373';
					yourself.
	self deny: accession isVersioned.

]

{ #category : #testing }
BioAccessionTest >> testName [
	| accession |
	accession := BioAccession new
		name: 'AF288373';
		version: 2;
		yourself.
	self assert: accession name equals: 'AF288373'.
	accession := BioAccession new.
	self assert: accession asString equals: accession nullName
]

{ #category : #testing }
BioAccessionTest >> testVersion [
	| accession |
	accession := BioAccession new
		name: 'AF288373';
		version: 2;
		yourself.
	self assert: accession version equals: 2.
	accession := BioAccession new
		name: 'AF288373';
		yourself.
	self deny: accession isVersioned.
	self assert: accession version isNil
]
