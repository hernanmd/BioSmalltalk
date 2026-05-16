"
I am a wrapper for MUSCLE v5 (MUltiple Sequence Comparison by Log-Expectation).

MUSCLE5 is the latest version of the popular MUSCLE alignment program with improved accuracy and speed for large datasets.

Usage:
| wrapper |
wrapper := BioMUSCLE5Wrapper new.
wrapper input: sequences.fasta.
wrapper out: aligned.fasta.
wrapper maxiters: 2.
wrapper execute.
"
Class {
	#name : 'BioMUSCLE5Wrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Aligners',
	#package : 'BioWrappers',
	#tag : 'Aligners'
}

{ #category : 'accessing' }
BioMUSCLE5Wrapper class >> category [

	^ 'Multiple Sequence Alignment'
]

{ #category : 'defaults' }
BioMUSCLE5Wrapper >> defaultProgramName [

	^ self execNameFor: 'muscle5'
]

{ #category : 'parameters' }
BioMUSCLE5Wrapper >> input: aFilename [

	^ self propertyAt: 'align' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioMUSCLE5Wrapper >> maxiters: aNumber [

	^ self propertyAt: 'maxiters' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioMUSCLE5Wrapper >> out: aFilename [

	^ self
		  propertyAt: 'output'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioMUSCLE5Wrapper >> outfmtAsFasta [

	^ self propertyAt: 'seqtype' ifAbsentPut: [ 'fasta' ]
]

{ #category : 'parameters' }
BioMUSCLE5Wrapper >> perm: aString [
	"perm strategy: perm-all, perm-one, perm-none"

	^ self propertyAt: 'perm' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioMUSCLE5Wrapper >> threads: aNumber [

	^ self propertyAt: 'threads' ifAbsentPut: [ aNumber ]
]
