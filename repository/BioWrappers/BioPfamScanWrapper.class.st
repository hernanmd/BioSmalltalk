"
I am a wrapper for PfamScan, a tool for searching protein sequences against the Pfam database of protein families.

PfamScan uses HMM profiles to identify protein domains and families.

Usage:
| wrapper |
wrapper := BioPfamScanWrapper new.
wrapper input: protein.fasta.
wrapper outfile: pfam_results.txt.
wrapper database: Pfam-A.
wrapper evalue: 0.001.
wrapper activeSite.
wrapper execute.
"
Class {
	#name : 'BioPfamScanWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Functional',
	#package : 'BioWrappers',
	#tag : 'Functional'
}

{ #category : 'accessing' }
BioPfamScanWrapper class >> category [

	^ 'Protein Functional Analysis'
]

{ #category : 'parameters' }
BioPfamScanWrapper >> activeSite [

	^ self addOption: 'as'
]

{ #category : 'parameters' }
BioPfamScanWrapper >> database: aDbPath [

	^ self
		  propertyAt: 'database'
		  ifAbsentPut: [ self buildPath: aDbPath ]
]

{ #category : 'defaults' }
BioPfamScanWrapper >> defaultProgramName [

	^ self execNameFor: 'pfam_scan'
]

{ #category : 'parameters' }
BioPfamScanWrapper >> evalue: aString [
	"Accept string e-values like '1e-5'"

	^ self propertyAt: 'E' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioPfamScanWrapper >> input: aFilename [

	^ self propertyAt: 'i' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioPfamScanWrapper >> outfile: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioPfamScanWrapper >> outfmtJson [

	^ self propertyAt: 'output' ifAbsentPut: [ 'json' ]
]

{ #category : 'parameters' }
BioPfamScanWrapper >> outfmtPlain [

	^ self propertyAt: 'output' ifAbsentPut: [ 'text' ]
]
