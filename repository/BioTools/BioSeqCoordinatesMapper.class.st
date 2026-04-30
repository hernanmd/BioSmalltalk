Class {
	#name : 'BioSeqCoordinatesMapper',
	#superclass : 'BioObject',
	#instVars : [
		'exons',
		'strand',
		'exonLengths',
		'totalCDSLength'
	],
	#category : 'BioTools-Genomic-Coordinates',
	#package : 'BioTools',
	#tag : 'Genomic-Coordinates'
}

{ #category : 'as yet unclassified' }
BioSeqCoordinatesMapper class >> fromExonPairs: exonPairs [
    ^ self new initializeFromExonPairs: exonPairs
]

{ #category : 'as yet unclassified' }
BioSeqCoordinatesMapper class >> validateExonPairs: exonPairs [
    exonPairs ifEmpty: [ self error: 'Must provide exons' ]
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> cdsLength [

	^ totalCDSLength
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> cdsToGenomic: cdsPos [
	"Answer a BioLocus for the genomic position (1-based)"

	| pos cumCDS genomicPos |
	pos := cdsPos isNumber
		       ifTrue: [ cdsPos ]
		       ifFalse: [ cdsPos anchor ].
	pos < 1 ifTrue: [
			genomicPos := self exonStart + pos.
			^ BioLocus newFrom: genomicPos to: genomicPos chr: nil ].
	cumCDS := 0.
	1 to: exons size do: [ :i |
			| exonStart exonEnd exonLen |
			exonStart := (exons at: i) key.
			exonEnd := (exons at: i) value.
			exonLen := exonEnd - exonStart + 1.
			pos <= (cumCDS + exonLen) ifTrue: [
					genomicPos := exonStart + pos - cumCDS - 1.
					^ BioLocus newFrom: genomicPos to: genomicPos chr: nil ].
			cumCDS := cumCDS + exonLen ].
	genomicPos := self exonEnd + pos - cumCDS.
	^ BioLocus newFrom: genomicPos to: genomicPos chr: nil
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> cdsToGenomicLocus: cdsPos [
	"Answer a BioLocus for the genomic position (1-based)"

	| pos cumCDS |
	pos := cdsPos isNumber
		       ifTrue: [ cdsPos ]
		       ifFalse: [ cdsPos anchor ].
	pos < 1 ifTrue: [
			^ BioLocus
				  newFrom: self exonStart + pos
				  to: self exonStart + pos
				  chr: nil ].
	cumCDS := 0.
	1 to: exons size do: [ :i |
			| exonStart exonEnd exonLen |
			exonStart := (exons at: i) key.
			exonEnd := (exons at: i) value.
			exonLen := exonEnd - exonStart + 1.
			pos <= (cumCDS + exonLen) ifTrue: [
					^ BioLocus
						  newFrom: exonStart + pos - cumCDS - 1
						  to: exonStart + pos - cumCDS - 1
						  chr: nil ].
			cumCDS := cumCDS + exonLen ].
	^ BioLocus
		  newFrom: self exonEnd + pos - cumCDS
		  to: self exonEnd + pos - cumCDS
		  chr: nil
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> cdsToProtein: cdsPos [

	| pos |
	pos := cdsPos isNumber
		       ifTrue: [ cdsPos ]
		       ifFalse: [ cdsPos anchor ].
	^ BioProteinPosition at: pos + 2 // 3
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> exonCount [
    ^ exons size
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> exonEnd [
    ^ exons last value
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> exonStart [
    ^ exons first key
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> exons [
    ^ exons
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> genomicToCDS: gPos [

	| cumCDS |
	gPos < self exonStart ifTrue: [
		^ BioCDSPosition preCDS: gPos - self exonStart ].
	gPos > self exonEnd ifTrue: [
		^ BioCDSPosition postCDS: gPos - self exonEnd ].
	cumCDS := 0.
	1 to: exons size do: [ :i |
			| exonStart exonEnd exonLen |
			exonStart := (exons at: i) key.
			exonEnd := (exons at: i) value.
			exonLen := exonEnd - exonStart + 1.
			(gPos >= exonStart and: [ gPos <= exonEnd ]) ifTrue: [
				^ BioCDSPosition at: cumCDS + (gPos - exonStart) + 1 ].
			cumCDS := cumCDS + exonLen ].
	^ BioCDSPosition preCDS: gPos - self exonStart
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> genomicToProtein: gPos [

	| cdsPos |
	cdsPos := self genomicToCDS: gPos.
	cdsPos isExon ifFalse: [ ^ nil ].
	^ self cdsToProtein: cdsPos
]

{ #category : 'initialization' }
BioSeqCoordinatesMapper >> initializeFromExonPairs: exonPairs [

	exons := exonPairs asArray.
	strand := 1.
	exonLengths := exons collect: [ :pair | pair value - pair key + 1 ].
	totalCDSLength := exonLengths sum
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> proteinToCDS: proteinPos [

	| pos cdsStart cdsEnd |
	pos := proteinPos isNumber
		       ifTrue: [ proteinPos ]
		       ifFalse: [ proteinPos position ].
	cdsStart := pos - 1 * 3 + 1.
	cdsEnd := pos * 3.
	^ {
		  (BioCDSPosition at: cdsStart).
		  (BioCDSPosition at: cdsEnd) }
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> proteinToGenomic: proteinPos [

	| cdsRange |
	cdsRange := self proteinToCDS: proteinPos.
	^ {
		  (self cdsToGenomic: cdsRange first).
		  (self cdsToGenomic: cdsRange second) }
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> proteinToGenomicLocus: proteinPos [
	"Answer a BioLocus spanning the codon for this protein position (1-based)"

	| cdsRange |
	cdsRange := self proteinToCDS: proteinPos.
	^ BioLocus
		  newFrom: (self cdsToGenomicLocus: cdsRange first) start
		  to: (self cdsToGenomicLocus: cdsRange second) start
		  chr: nil
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> strand [
    ^ strand ifNil: [ strand := 1 ]
]

{ #category : 'accessing' }
BioSeqCoordinatesMapper >> strand: anInteger [
    strand := anInteger
]
