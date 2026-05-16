"
I am a wrapper for the EMBOSS pepinfo tool.

Pepinfo produces information on amino acid properties including hydropathy, charge, and other physico-chemical parameters, with configurable window size for hydropathy averaging.

Usage:
| wrapper |
wrapper := BioEMBOSSPepinfoWrapper new.
wrapper input: protein.fasta.
wrapper hydropathyWindowSize: 9.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSPepinfoWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'accessing' }
BioEMBOSSPepinfoWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSPepinfoWrapper >> defaultProgramName [

	^ self execNameFor: 'pepinfo'
]

{ #category : 'parameters' }
BioEMBOSSPepinfoWrapper >> hydropathyWindowSize: aNumber [

	^ self propertyAt: 'hwindow' ifAbsentPut: [ aNumber ]
]

{ #category : 'parameters' }
BioEMBOSSPepinfoWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPepinfoWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]
