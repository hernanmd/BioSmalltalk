Class {
	#name : 'BioHaplotypeIOTest',
	#superclass : 'TestCase',
	#category : 'BioHaplotypes-Tests-Core',
	#package : 'BioHaplotypes-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioHaplotypeIOTest >> testAsBioHaplotypesReturnsCollection [
	| reader haps |
	reader := BioHaplotypePlinkReader new.
	haps := reader asBioHaplotypes.
	self assert: haps class equals: BioHaplotypes.
	self assert: haps size equals: 0
]

{ #category : 'tests' }
BioHaplotypeIOTest >> testFromPedFileMapFileCreatesCollection [
	"Tests class-side factory exists and configuration works (no file I/O)."
	| reader |
	reader := BioHaplotypePlinkReader new.
	reader pedFile: 'test.ped'; mapFile: 'test.map'.
	self assert: reader pedFile equals: 'test.ped'.
	self assert: reader mapFile equals: 'test.map'
]

{ #category : 'tests' }
BioHaplotypeIOTest >> testParseMapLines [
	| reader lines variants |
	reader := BioHaplotypePlinkReader new.
	lines := #( '1 rs111 0 100' '1 rs222 0 200' '1 rs333 0 300' ).
	variants := reader parseMapLines: lines.
	self assert: variants size equals: 3.
	self assert: (variants at: 1) rsID equals: 'rs111'.
	self assert: (variants at: 1) position equals: 100.
	self assert: (variants at: 1) chromosome equals: '1'.
	self assert: (variants at: 2) rsID equals: 'rs222'.
	self assert: (variants at: 3) rsID equals: 'rs333'
]

{ #category : 'tests' }
BioHaplotypeIOTest >> testParsePedLines [
	| reader variants haps v1 v2 |
	v1 := BioVariant position: 100 referenceAllele: 'A' alternateAlleles: #('T') rsID: 'rs111' chromosome: '1'.
	v2 := BioVariant position: 200 referenceAllele: 'C' alternateAlleles: #('G') rsID: 'rs222' chromosome: '1'.
	variants := {v1 . v2}.
	reader := BioHaplotypePlinkReader new.
	haps := reader parsePedLines: #('FAM1 IND1 0 0 1 1 A T C G') variants: variants.
	self assert: haps size equals: 2.
	self assert: (haps at: 1) alleles equals: #('A' 'C').
	self assert: (haps at: 2) alleles equals: #('T' 'G').
	self assert: (haps at: 1) identifier equals: 'IND1_a'.
	self assert: (haps at: 2) identifier equals: 'IND1_b'
]

{ #category : 'tests' }
BioHaplotypeIOTest >> testPlinkWrapperConfiguration [
	"Verify plinkWrapper can be set and retrieved."
	| reader plink |
	reader := BioHaplotypePlinkReader new.
	plink := BioPLINK1Wrapper new.
	reader plinkWrapper: plink.
	self assert: reader plinkWrapper equals: plink
]
