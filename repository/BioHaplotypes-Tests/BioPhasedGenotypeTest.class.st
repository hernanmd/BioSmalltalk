Class {
	#name : 'BioPhasedGenotypeTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
BioPhasedGenotypeTest >> exampleGenotype [

	| v1 v2 h1 h2 |
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
	h1 := BioHaplotype withAlleles: #( 'A' 'C' ) atVariants: {
			      v1.
			      v2 }.
	h2 := BioHaplotype withAlleles: #( 'T' 'G' ) atVariants: {
			      v1.
			      v2 }.
	^ BioPhasedGenotype withHaplotype1: h1 haplotype2: h2
]

{ #category : 'tests' }
BioPhasedGenotypeTest >> testGenotypeAt [

	| geno |
	geno := self exampleGenotype.
	self assert: (geno genotypeAt: 1) equals: #( 'A' 'T' ).
	self assert: (geno genotypeAt: 2) equals: #( 'C' 'G' )
]

{ #category : 'tests' }
BioPhasedGenotypeTest >> testGenotypeString [

	| geno |
	geno := self exampleGenotype.
	self assert: geno genotypeString equals: 'A/T C/G'
]

{ #category : 'tests' }
BioPhasedGenotypeTest >> testIsHeterozygous [

	| geno |
	geno := self exampleGenotype.
	self assert: (geno isHeterozygousAt: 1).
	self assert: (geno isHeterozygousAt: 2)
]
