"
I am a wrapper for Phobius, a program for prediction of transmembrane topology and signal peptides.

Phobius combines transmembrane topology prediction and signal peptide prediction into a single model.

Usage:
| wrapper |
wrapper := BioPhobiusWrapper new.
wrapper input: protein.fasta.
wrapper outShort.
wrapper execute.
"
Class {
	#name : 'BioPhobiusWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Functional',
	#package : 'BioWrappers',
	#tag : 'Functional'
}

{ #category : 'accessing' }
BioPhobiusWrapper class >> category [

	^ 'Protein Functional Analysis'
]

{ #category : 'defaults' }
BioPhobiusWrapper >> defaultProgramName [

	^ self execNameFor: 'phobius'
]

{ #category : 'parameters' }
BioPhobiusWrapper >> input: aFilename [

	^ self propertyAt: 'i' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioPhobiusWrapper >> outLong [

	^ self propertyAt: 'short' ifAbsentPut: [ false ]
]

{ #category : 'parameters' }
BioPhobiusWrapper >> outLongWithGraphics [

	^ self addOption: 'graph'
]

{ #category : 'parameters' }
BioPhobiusWrapper >> outRaw [

	^ self addOption: 'raw'
]

{ #category : 'parameters' }
BioPhobiusWrapper >> outShort [

	^ self propertyAt: 'short' ifAbsentPut: [ true ]
]
