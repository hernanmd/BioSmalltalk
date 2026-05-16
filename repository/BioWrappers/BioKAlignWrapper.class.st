"
I am a wrapper for the KAlign multiple sequence alignment program.

KAlign is a fast and accurate MSA tool suitable for large alignments. It supports protein and DNA sequences with configurable gap penalties.

Usage:
| wrapper |
wrapper := BioKAlignWrapper new.
wrapper input: sequences.fasta.
wrapper out: aligned.fasta.
wrapper seqTypeProtein.
wrapper execute.
"
Class {
	#name : 'BioKAlignWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Aligners',
	#package : 'BioWrappers',
	#tag : 'Aligners'
}

{ #category : 'accessing' }
BioKAlignWrapper class >> category [

	^ 'Multiple Sequence Alignment'
]

{ #category : 'accessing' }
BioKAlignWrapper >> defaultProgramName [

	^ self execNameFor: 'kalign'
]

{ #category : 'parameters' }
BioKAlignWrapper >> gapExtensionPenalty: aNumber [

	^ self propertyAt: 'gapext' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> gapOpenPenalty: aNumber [

	^ self propertyAt: 'gapopen' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> input: aFilename [

	^ self propertyAt: 'i' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> out: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> outfmtAsClustal [

	^ self propertyAt: 'format' ifAbsentPut: [ 'clustal' ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> outfmtAsFasta [

	^ self propertyAt: 'format' ifAbsentPut: [ 'fasta' ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> outfmtAsMsf [

	^ self propertyAt: 'format' ifAbsentPut: [ 'msf' ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> seqTypeDNA [

	^ self propertyAt: 'type' ifAbsentPut: [ 'dna' ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> seqTypeProtein [

	^ self propertyAt: 'type' ifAbsentPut: [ 'protein' ]
]

{ #category : 'parameters' }
BioKAlignWrapper >> terminalGapPenalties: aNumber [

	^ self propertyAt: 'termgaps' ifAbsentPut: [ aNumber ]
]
