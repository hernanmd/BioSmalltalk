"
I am a wrapper for the EMBOSS pepwindow tool.

Pepwindow produces a graphical representation of hydropathy (Kyte-Doolittle) and other amino acid property plots along a protein sequence, with configurable window size.

Usage:
| wrapper |
wrapper := BioEMBOSSPepwindowWrapper new.
wrapper input: protein.fasta.
wrapper windowSize: 9.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSPepwindowWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'accessing' }
BioEMBOSSPepwindowWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSPepwindowWrapper >> defaultProgramName [

	^ self execNameFor: 'pepwindow'
]

{ #category : 'parameters' }
BioEMBOSSPepwindowWrapper >> graphType: aString [

	^ self propertyAt: 'graph' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioEMBOSSPepwindowWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPepwindowWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPepwindowWrapper >> windowSize: aNumber [

	^ self propertyAt: 'window' ifAbsentPut: [ aNumber ]
]
