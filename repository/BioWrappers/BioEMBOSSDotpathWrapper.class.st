"
I am a wrapper for the EMBOSS dotpath tool.

Dotpath generates a dotplot from two sequences by finding word matches of a specified size, useful for visualizing sequence similarity and identifying repeated regions.

Usage:
| wrapper |
wrapper := BioEMBOSSDotpathWrapper new.
wrapper sequence1: seq1.fasta.
wrapper sequence2: seq2.fasta.
wrapper wordsize: 6.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSDotpathWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioEMBOSSDotpathWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSDotpathWrapper >> defaultProgramName [

	^ self execNameFor: 'dotpath'
]

{ #category : 'parameters' }
BioEMBOSSDotpathWrapper >> graphType: aString [

	^ self propertyAt: 'graph' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioEMBOSSDotpathWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDotpathWrapper >> sequence1: aFilename [

	^ self
		  propertyAt: 'asequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDotpathWrapper >> sequence2: aFilename [

	^ self
		  propertyAt: 'bsequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSDotpathWrapper >> wordsize: aNumber [

	^ self propertyAt: 'wordsize' ifAbsentPut: [ aNumber ]
]
