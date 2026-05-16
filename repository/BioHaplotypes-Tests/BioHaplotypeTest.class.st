Class {
	#name : 'BioHaplotypeTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
BioHaplotypeTest >> exampleHaplotype [

	| v1 v2 |
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs1'
		      chromosome: '1'.
	v2 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' )
		      rsID: 'rs2'
		      chromosome: '1'.
	^ BioHaplotype
		  withAlleles: #( 'A' 'C' )
		  atVariants: {
				  v1.
				  v2 }
		  identifier: 'hap1'
]

{ #category : 'running' }
BioHaplotypeTest >> exampleHaplotype2 [

	| v1 v2 |
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs1'
		      chromosome: '1'.
	v2 := BioVariant
		      position: 200
		      referenceAllele: 'C'
		      alternateAlleles: #( 'G' )
		      rsID: 'rs2'
		      chromosome: '1'.
	^ BioHaplotype
		  withAlleles: #( 'T' 'G' )
		  atVariants: {
				  v1.
				  v2 }
		  identifier: 'hap2'
]

{ #category : 'tests' }
BioHaplotypeTest >> testAlleleAtRsID [

	| h |
	h := self exampleHaplotype.
	self assert: (h alleleAtRsID: 'rs1') equals: 'A'.
	self assert: (h alleleAtRsID: 'rs2') equals: 'C'
]

{ #category : 'tests' }
BioHaplotypeTest >> testAsAlleleString [

	| h |
	h := self exampleHaplotype.
	self assert: h asAlleleString equals: 'A-C'
]

{ #category : 'tests' }
BioHaplotypeTest >> testAt [
	| h |
	h := self exampleHaplotype.
	self assert: (h at: 1) equals: 'A'.
	self assert: (h at: 2) equals: 'C'
]

{ #category : 'tests' }
BioHaplotypeTest >> testCreation [

	| h |
	h := self exampleHaplotype.
	self assert: h alleles equals: #( 'A' 'C' ).
	self assert: h identifier equals: 'hap1'.
	self assert: h size equals: 2
]

{ #category : 'tests' }
BioHaplotypeTest >> testDynamicRsIDAccess [

	| h |
	h := self exampleHaplotype.
	self assert: (h perform: #rs1) equals: 'A'.
	self assert: (h perform: #rs2) equals: 'C'
]

{ #category : 'tests' }
BioHaplotypeTest >> testHammingDistance [

	| h1 h2 |
	h1 := self exampleHaplotype.
	h2 := self exampleHaplotype2.
	self assert: (h1 hammingDistanceTo: h2) equals: 2.
	self assert: (h1 hammingDistanceTo: h1) equals: 0
]

{ #category : 'tests' }
BioHaplotypeTest >> testImmutability [

	| h |
	h := self exampleHaplotype.
	self assert: h isImmutable.
	self should: [ h at: 1 put: 'T' ] raise: Error
]

{ #category : 'tests' }
BioHaplotypeTest >> testMatchesAtLocus [

	| h1 h2 |
	h1 := self exampleHaplotype.
	h2 := self exampleHaplotype2.
	self deny: (h1 matches: h2 atLocus: 1).
	self deny: (h1 matches: h2 atLocus: 2)
]

{ #category : 'tests' }
BioHaplotypeTest >> testPrintOn [

	| h |
	h := self exampleHaplotype.
	self assert: h printString equals: 'BioHaplotype(hap1)[A|C]'
]

{ #category : 'tests' }
BioHaplotypeTest >> testVariantAt [

	| h v1 |
	h := self exampleHaplotype.
	v1 := BioVariant
		      position: 100
		      referenceAllele: 'A'
		      alternateAlleles: #( 'T' )
		      rsID: 'rs1'
		      chromosome: '1'.
	self assert: (h variantAt: 1) position equals: 100
]
