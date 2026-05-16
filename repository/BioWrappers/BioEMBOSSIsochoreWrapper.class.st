"
I am a wrapper for the EMBOSS isochore tool.

Isochore plots GC content along DNA sequences using a sliding window approach, identifying regions of distinct base composition (isochores) with configurable window and step sizes.

Usage:
| wrapper |
wrapper := BioEMBOSSIsochoreWrapper new.
wrapper input: sequence.fasta.
wrapper windowSize: 1000.
wrapper stepSize: 100.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSIsochoreWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioEMBOSSIsochoreWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSIsochoreWrapper >> defaultProgramName [

	^ self execNameFor: 'isochore'
]

{ #category : 'parameters' }
BioEMBOSSIsochoreWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSIsochoreWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSIsochoreWrapper >> stepSize: aNumber [

	^ self propertyAt: 'step' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSIsochoreWrapper >> windowSize: aNumber [

	^ self propertyAt: 'window' ifAbsentPut: [ aNumber ]
]
