"
I am a wrapper for the EMBOSS newcpgreport tool.

Newcpgreport identifies CpG islands in nucleotide sequences and produces a report of their locations and statistics, with configurable window size, minimum length, and threshold parameters.

Usage:
| wrapper |
wrapper := BioEMBOSSNewcpgreportWrapper new.
wrapper input: sequence.fasta.
wrapper windowSize: 100.
wrapper minLength: 200.
wrapper minObserved: 0.6.
wrapper minPercentage: 50.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSNewcpgreportWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioEMBOSSNewcpgreportWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSNewcpgreportWrapper >> defaultProgramName [

	^ self execNameFor: 'newcpgreport'
]

{ #category : 'parameters' }
BioEMBOSSNewcpgreportWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSNewcpgreportWrapper >> minLength: aNumber [

	^ self propertyAt: 'minlen' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSNewcpgreportWrapper >> minObserved: aNumber [

	^ self propertyAt: 'minobs' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSNewcpgreportWrapper >> minPercentage: aNumber [

	^ self propertyAt: 'minpc' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSNewcpgreportWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSNewcpgreportWrapper >> windowSize: aNumber [

	^ self propertyAt: 'window' ifAbsentPut: [ aNumber ]
]
