"
I am a wrapper for SAPS (Statistical Analysis of Protein Sequences).

SAPS evaluates a variety of statistical properties of protein sequences including compositional bias, charge clustering, and high-scoring segments.

Usage:
| wrapper |
wrapper := BioSAPSWrapper new.
wrapper input: protein.fasta.
wrapper execute.
"
Class {
	#name : 'BioSAPSWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioSAPSWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioSAPSWrapper >> defaultProgramName [

	^ self execNameFor: 'saps'
]

{ #category : 'parameters' }
BioSAPSWrapper >> input: aFilename [

	^ self propertyAt: 'i' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioSAPSWrapper >> out: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]
