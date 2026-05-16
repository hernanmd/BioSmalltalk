"
I am a wrapper for the EMBOSS dottup tool.

Dottup generates a dotplot from two sequences by finding exact word matches of a specified size, providing a fast method for identifying regions of high similarity.

Usage:
| wrapper |
wrapper := BioEMBOSSDottupWrapper new.
wrapper sequence1: seq1.fasta.
wrapper sequence2: seq2.fasta.
wrapper wordsize: 8.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSDottupWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioEMBOSSDottupWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSDottupWrapper >> defaultProgramName [

	^ self execNameFor: 'dottup'
]

{ #category : 'parameters' }
BioEMBOSSDottupWrapper >> graphType: aString [

	^ self propertyAt: 'graph' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioEMBOSSDottupWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDottupWrapper >> sequence1: aFilename [

	^ self
		  propertyAt: 'asequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDottupWrapper >> sequence2: aFilename [

	^ self
		  propertyAt: 'bsequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDottupWrapper >> wordsize: aNumber [

	^ self propertyAt: 'wordsize' ifAbsentPut: [ aNumber ]
]
