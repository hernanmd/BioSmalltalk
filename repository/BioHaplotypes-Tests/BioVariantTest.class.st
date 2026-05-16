Class {
	#name : 'BioVariantTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
BioVariantTest >> exampleVariant [

	^ BioVariant
		  position: 14370
		  referenceAllele: 'G'
		  alternateAlleles: #( 'A' )
		  rsID: 'rs12345'
		  chromosome: '20'
]

{ #category : 'tests' }
BioVariantTest >> testAllAlleles [

	| v |
	v := self exampleVariant.
	self assert: v allAlleles equals: #( 'G' 'A' )
]

{ #category : 'tests' }
BioVariantTest >> testCreation [

	| v |
	v := self exampleVariant.
	self assert: v position equals: 14370.
	self assert: v referenceAllele equals: 'G'.
	self assert: v alternateAlleles equals: #( 'A' ).
	self assert: v rsID equals: 'rs12345'.
	self assert: v chromosome equals: '20'
]

{ #category : 'tests' }
BioVariantTest >> testEquality [

	| v1 v2 v3 |
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' ).
	v2 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' ).
	v3 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' ).
	self assert: v1 equals: v2.
	self deny: v1 equals: v3
]

{ #category : 'tests' }
BioVariantTest >> testIncludesAllele [

	| v |
	v := self exampleVariant.
	self assert: (v includesAllele: 'G').
	self assert: (v includesAllele: 'A').
	self deny: (v includesAllele: 'C')
]

{ #category : 'tests' }
BioVariantTest >> testIsBiallelicSNP [

	| v |
	v := self exampleVariant.
	self assert: v isBiallelic.
	self assert: v isSNP.
	self deny: v isMultiAllelic.
	self deny: v isIndel
]

{ #category : 'tests' }
BioVariantTest >> testMultiAllelic [

	| v |
	v := BioVariant
		     position: 100
		     referenceAllele: 'A'
		     alternateAlleles: #( 'T' 'G' ).
	self assert: v isMultiAllelic.
	self deny: v isBiallelic
]

{ #category : 'tests' }
BioVariantTest >> testName [

	| v1 v2 |
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs999'.
	v2 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' )
		      chromosome: 'chr1'.
	self assert: v1 name equals: 'rs999'.
	self assert: v2 name equals: 'chr1:200'
]
