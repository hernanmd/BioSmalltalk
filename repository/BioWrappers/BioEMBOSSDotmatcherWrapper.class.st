"
I am a wrapper for the EMBOSS dotmatcher tool.

Dotmatcher draws a threshold dotplot comparing two sequences, using configurable substitution matrices (BLOSUM62, BLOSUM35, BLOSUM40, DNAfull, DNAmat), window size, and threshold score. Supports both protein and DNA sequence types.

Usage:
| wrapper |
wrapper := BioEMBOSSDotmatcherWrapper new.
wrapper sequence1: seq1.fasta.
wrapper sequence2: seq2.fasta.
wrapper matrixBlosum62.
wrapper windowSize: 10.
wrapper threshold: 23.
wrapper seqTypeProtein.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSDotmatcherWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioEMBOSSDotmatcherWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSDotmatcherWrapper >> defaultProgramName [

	^ self execNameFor: 'dotmatcher'
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> matrixBlosum35 [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'EBLOSUM35' ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> matrixBlosum40 [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'EBLOSUM40' ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> matrixBlosum62 [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'EBLOSUM62' ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> matrixDNAfull [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'EDNAFULL' ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> seqTypeDNA [

	^ self propertyAt: 'type' ifAbsentPut: [ 'dna' ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> seqTypeProtein [

	^ self propertyAt: 'type' ifAbsentPut: [ 'protein' ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> sequence1: aFilename [

	^ self
		  propertyAt: 'asequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> sequence2: aFilename [

	^ self
		  propertyAt: 'bsequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> threshold: aNumber [

	^ self propertyAt: 'threshold' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSDotmatcherWrapper >> windowSize: aNumber [

	^ self propertyAt: 'windowsize' ifAbsentPut: [ aNumber ]
]
