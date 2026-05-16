"
I am a wrapper for the EMBOSS polydot tool.

Polydot generates multiple dotplots for all-against-all comparison of multiple sequences in a single display, useful for identifying conserved regions across a sequence family.

Usage:
| wrapper |
wrapper := BioEMBOSSPolydotWrapper new.
wrapper input: sequences.fasta.
wrapper wordsize: 8.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSPolydotWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'accessing' }
BioEMBOSSPolydotWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSPolydotWrapper >> defaultProgramName [

	^ self execNameFor: 'polydot'
]

{ #category : 'parameters' }
BioEMBOSSPolydotWrapper >> graphType: aString [

	^ self propertyAt: 'graph' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioEMBOSSPolydotWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPolydotWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPolydotWrapper >> wordsize: aNumber [

	^ self propertyAt: 'wordsize' ifAbsentPut: [ aNumber ]
]
