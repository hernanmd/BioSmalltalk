Class {
	#name : 'BioSeqCoordinatesMapperTest',
	#superclass : 'BioAbstractTest',
	#instVars : [
		'mapper',
		'exonPairs'
	],
	#category : 'BioTools-Tests',
	#package : 'BioTools-Tests'
}

{ #category : 'running' }
BioSeqCoordinatesMapperTest >> setUp [

	super setUp.
	exonPairs := {
		             (5809 -> 5860).
		             (6758 -> 6874).
		             (7769 -> 7912).
		             (13710 -> 13785) }.
	mapper := BioSeqCoordinatesMapper fromExonPairs: exonPairs
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsLength [

	| expected |
	expected := 5860 - 5809 + 1 + (6874 - 6758 + 1) + (7912 - 7769 + 1)
	            + (13785 - 13710 + 1).
	self assert: mapper cdsLength equals: expected
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsPositionExon [

	| pos |
	pos := BioCDSPosition at: 100.
	self assert: pos isExon.
	self deny: pos isIntron.
	self assert: pos anchor equals: 100
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsPositionIntron [

	| pos |
	pos := BioCDSPosition anchor: 50 offset: 5.
	self deny: pos isExon.
	self assert: pos isIntron.
	self assert: pos anchor equals: 50.
	self assert: pos offset equals: 5
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsPositionPostCDS [

	| pos |
	pos := BioCDSPosition postCDS: 50.
	self assert: pos isPostCDS.
	self deny: pos isExon
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsPositionPreCDS [

	| pos |
	pos := BioCDSPosition preCDS: -100.
	self assert: pos isPreCDS.
	self deny: pos isExon
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsToGenomic [

	| locus |
	locus := mapper cdsToGenomic: 1.
	self assert: locus start equals: 5809.
	locus := mapper cdsToGenomic: 52.
	self assert: locus start equals: 5860
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCdsToProtein [

	| pos |
	pos := mapper cdsToProtein: 1.
	self assert: pos position equals: 1.
	pos := mapper cdsToProtein: 274.
	self assert: pos position equals: 92
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testCreateFromExonPairs [

	self assert: mapper class equals: BioSeqCoordinatesMapper.
	self assert: mapper exonCount equals: 4.
	self assert: mapper exonStart equals: 5809.
	self assert: mapper exonEnd equals: 13785
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testGenomicPosition1Based [
	"Now uses BioLocus"

	| pos |
	pos := BioLocus newFrom: 100 to: 100 chr: nil.
	self assert: pos start equals: 100.
	self assert: pos asGffInterval equals: #( 100 100 ).
	self assert: pos asBedInterval equals: #( 99 100 )
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testGenomicToCDSExon [

	| cdsPos locus |
	cdsPos := mapper genomicToCDS: 5810.
	self assert: cdsPos isExon.
	self assert: cdsPos anchor equals: 2.

	locus := mapper cdsToGenomicLocus: 1.
	self assert: locus start equals: 5809
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testGenomicToCDSPostCDS [

	| pos |
	pos := mapper genomicToCDS: 14000.
	self assert: pos isPostCDS
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testGenomicToCDSPreCDS [

	| pos |
	pos := mapper genomicToCDS: 5000.
	self assert: pos isPreCDS
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testProteinPosition1Based [

	| pos |
	pos := BioProteinPosition at: 92.
	self assert: pos position equals: 92.
	self assert: pos toGenBank equals: 92.
	self assert: pos toBed equals: 91
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testProteinToCDS [

	| range |
	range := mapper proteinToCDS: 1.
	self assert: range first anchor equals: 1.
	self assert: range second anchor equals: 3.
	range := mapper proteinToCDS: 92.
	self assert: range first anchor equals: 274.
	self assert: range second anchor equals: 276
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testRoundTripGenomicExon [

	| cdsPos locus |
	cdsPos := mapper genomicToCDS: 5810.
	locus := mapper cdsToGenomic: cdsPos.
	self assert: locus start equals: 5810
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testRoundTripProtein [

	| cdsRange proteinPos |
	cdsRange := mapper proteinToCDS: 92.
	proteinPos := mapper cdsToProtein: cdsRange first anchor.
	self assert: proteinPos position equals: 92
]

{ #category : 'tests' }
BioSeqCoordinatesMapperTest >> testStrand [

	self assert: mapper strand equals: 1.
	mapper strand: -1.
	self assert: mapper strand equals: -1
]
