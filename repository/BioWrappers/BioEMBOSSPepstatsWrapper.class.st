"
I am a wrapper for the EMBOSS pepstats tool.

Pepstats calculates protein statistics including molecular weight, isoelectric point, amino acid composition, and extinction coefficients. Supports monoisotopic weights and terminal charge options.

Usage:
| wrapper |
wrapper := BioEMBOSSPepstatsWrapper new.
wrapper input: protein.fasta.
wrapper includeTerminiCharges.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSPepstatsWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Statistics',
	#package : 'BioWrappers',
	#tag : 'Statistics'
}

{ #category : 'accessing' }
BioEMBOSSPepstatsWrapper class >> category [

	^ 'Sequence Statistics'
]

{ #category : 'accessing' }
BioEMBOSSPepstatsWrapper >> defaultProgramName [

	^ self execNameFor: 'pepstats'
]

{ #category : 'parameters' }
BioEMBOSSPepstatsWrapper >> includeTerminiCharges [

	^ self addOption: 'tercharges'
]

{ #category : 'parameters' }
BioEMBOSSPepstatsWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPepstatsWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSPepstatsWrapper >> useMonoisotopicWeights [

	^ self addOption: 'monoisotopic'
]
