"
I am a wrapper for the EMBOSS cpgplot tool.

Cpgplot identifies and plots CpG islands in nucleotide sequences using a sliding window approach. Reports CpG islands that exceed defined thresholds for window size, minimum length, minimum observed/expected ratio, and minimum percentage GC.

Usage:
| wrapper |
wrapper := BioEMBOSSCpgplotWrapper new.
wrapper input: sequence.fasta.
wrapper windowSize: 100.
wrapper minLength: 200.
wrapper minObserved: 0.6.
wrapper minPercentage: 50.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSCpgplotWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'organization' }
BioEMBOSSCpgplotWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSCpgplotWrapper >> defaultProgramName [

	^ self execNameFor: 'cpgplot'
]

{ #category : 'parameters' }
BioEMBOSSCpgplotWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSCpgplotWrapper >> minLength: aNumber [

	^ self propertyAt: 'minlen' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSCpgplotWrapper >> minObserved: aNumber [

	^ self propertyAt: 'minobs' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSCpgplotWrapper >> minPercentage: aNumber [

	^ self propertyAt: 'minpc' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSCpgplotWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSCpgplotWrapper >> windowSize: aNumber [

	^ self propertyAt: 'window' ifAbsentPut: [ aNumber ]
]
