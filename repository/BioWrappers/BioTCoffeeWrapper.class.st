"
I am a wrapper for T-Coffee (Tree-based Consistency Objective Function for alignment Evaluation).

T-Coffee is a multiple sequence alignment program that combines results from multiple alignment methods. It supports protein, DNA, and RNA sequences.

Usage:
| wrapper |
wrapper := BioTCoffeeWrapper new.
wrapper infile: sequences.fasta.
wrapper seqTypeProtein.
wrapper outfile: aligned.aln.
wrapper execute.
"
Class {
	#name : 'BioTCoffeeWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Aligners',
	#package : 'BioWrappers',
	#tag : 'Aligners'
}

{ #category : 'accessing' }
BioTCoffeeWrapper class >> category [

	^ 'Multiple Sequence Alignment'
]

{ #category : 'defaults' }
BioTCoffeeWrapper >> defaultProgramName [

	^ self execNameFor: 't_coffee'
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> infile: aFilename [

	^ self
		  propertyAt: 'infile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> matrixBlosum [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'blosom' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> matrixPam [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'pam' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> noMatrix [

	^ self propertyAt: 'matrix' ifAbsentPut: [ 'none' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> orderAligned [

	^ self propertyAt: 'order' ifAbsentPut: [ 'aligned' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> orderInput [

	^ self propertyAt: 'order' ifAbsentPut: [ 'input' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> outfile: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> outfmtAsClustal [

	^ self propertyAt: 'output_format' ifAbsentPut: [ 'clustal' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> outfmtAsFasta [

	^ self propertyAt: 'output_format' ifAbsentPut: [ 'fasta' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> outfmtAsMsf [

	^ self propertyAt: 'output_format' ifAbsentPut: [ 'msf' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> outfmtAsPhylip [

	^ self propertyAt: 'output_format' ifAbsentPut: [ 'phylip' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> seqTypeDNA [

	^ self propertyAt: 'type' ifAbsentPut: [ 'dna' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> seqTypeProtein [

	^ self propertyAt: 'type' ifAbsentPut: [ 'protein' ]
]

{ #category : 'parameters' }
BioTCoffeeWrapper >> seqTypeRNA [

	^ self propertyAt: 'type' ifAbsentPut: [ 'rna' ]
]
