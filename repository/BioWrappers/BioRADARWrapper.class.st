"
I am a wrapper for RADAR (Rapid Automatic Detection and Alignment of Repeats).

RADAR identifies internal repeat units in protein sequences.

Usage:
| wrapper |
wrapper := BioRADARWrapper new.
wrapper input: protein.fasta.
wrapper out: radar_output.txt.
wrapper execute.
"
Class {
	#name : 'BioRADARWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Functional',
	#package : 'BioWrappers',
	#tag : 'Functional'
}

{ #category : 'accessing' }
BioRADARWrapper class >> category [

	^ 'Protein Functional Analysis'
]

{ #category : 'defaults' }
BioRADARWrapper >> defaultProgramName [

	^ self execNameFor: 'radar'
]

{ #category : 'parameters' }
BioRADARWrapper >> input: aFilename [

	^ self propertyAt: 'i' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioRADARWrapper >> out: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]
