"
I am a wrapper for InterProScan, a protein functional analysis tool.

InterProScan searches protein sequences against the InterPro database of protein families, domains, and functional sites.

Usage:
| wrapper |
wrapper := BioInterProScanWrapper new.
wrapper input: protein.fasta.
wrapper out: results.tsv.
wrapper outfmt: tsv.
wrapper applications: Pfam,SMART.
wrapper goterms.
wrapper execute.
"
Class {
	#name : 'BioInterProScanWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Functional',
	#package : 'BioWrappers',
	#tag : 'Functional'
}

{ #category : 'accessing' }
BioInterProScanWrapper class >> category [

	^ 'Protein Functional Analysis'
]

{ #category : 'parameters' }
BioInterProScanWrapper >> applications: aString [
	"Comma-separated list of analyses: Pfam, TIGRFAM, SMART, PROSITE, etc."

	^ self propertyAt: 'appl' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioInterProScanWrapper >> cpu: aNumber [

	^ self propertyAt: 'cpu' ifAbsentPut: [ aNumber ]
]

{ #category : 'defaults' }
BioInterProScanWrapper >> defaultProgramName [

	^ self execNameFor: 'interproscan'
]

{ #category : 'parameters' }
BioInterProScanWrapper >> goterms [

	^ self addOption: 'goterms'
]

{ #category : 'parameters' }
BioInterProScanWrapper >> input: aFilename [

	^ self propertyAt: 'i' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioInterProScanWrapper >> out: aFilename [

	^ self propertyAt: 'o' ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioInterProScanWrapper >> outfmt: aString [
	"Output format: tsv, xml, gff3, json, html"

	^ self propertyAt: 'f' ifAbsentPut: [ aString ]
]

{ #category : 'parameters' }
BioInterProScanWrapper >> pathways [

	^ self addOption: 'pathways'
]

{ #category : 'parameters' }
BioInterProScanWrapper >> sequenceTypeDNA [

	^ self propertyAt: 'dp' ifAbsentPut: [ 'n' ]
]

{ #category : 'parameters' }
BioInterProScanWrapper >> sequenceTypeProtein [

	^ self propertyAt: 'dp' ifAbsentPut: [ 'p' ]
]
