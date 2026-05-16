"
I am a wrapper for Pratt, a pattern discovery tool for protein sequences.

Pratt finds patterns conserved in sets of unaligned protein sequences with configurable pattern parameters including minimum percentage, pattern length, and flexibility.

Usage:
| wrapper |
wrapper := BioPrattWrapper new.
wrapper input: proteins.fasta.
wrapper minPercentage: 80.
wrapper maxPatternLength: 50.
wrapper maxNumPatternSymbols: 5.
wrapper execute.
"
Class {
	#name : 'BioPrattWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Functional',
	#package : 'BioWrappers',
	#tag : 'Functional'
}

{ #category : 'accessing' }
BioPrattWrapper class >> category [

	^ 'Protein Functional Analysis'
]

{ #category : 'defaults' }
BioPrattWrapper >> defaultProgramName [

	^ self execNameFor: 'pratt'
]

{ #category : 'parameters' }
BioPrattWrapper >> input: aFilename [

	^ self propertyAt: 'f' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioPrattWrapper >> maxFlexProduct: aNumber [

	^ self propertyAt: 'FP' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> maxFlexibility: aNumber [

	^ self propertyAt: 'FL' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> maxNumFlexSpaces: aNumber [

	^ self propertyAt: 'FN' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> maxNumPatternSymbols: aNumber [

	^ self propertyAt: 'PN' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> maxNumWildcard: aNumber [

	^ self propertyAt: 'PX' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> maxPatternLength: aNumber [

	^ self propertyAt: 'PL' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> minPercentage: aNumber [
	"C% parameter - min percentage of sequences matching pattern"

	^ self propertyAt: 'C' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioPrattWrapper >> out: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioPrattWrapper >> patternPositionComplete [

	^ self propertyAt: 'PP' ifAbsentPut: [ 'complete' ]
]

{ #category : 'parameters' }
BioPrattWrapper >> patternPositionOff [

	^ self propertyAt: 'PP' ifAbsentPut: [ 'off' ]
]

{ #category : 'parameters' }
BioPrattWrapper >> patternPositionStart [

	^ self propertyAt: 'PP' ifAbsentPut: [ 'start' ]
]

{ #category : 'parameters' }
BioPrattWrapper >> patternScoringInfo [

	^ self propertyAt: 'score' ifAbsentPut: [ 'info' ]
]

{ #category : 'parameters' }
BioPrattWrapper >> patternScoringMdl [

	^ self propertyAt: 'score' ifAbsentPut: [ 'mdl' ]
]
