"
I am a wrapper for the EMBOSS seqret sequence format conversion tool.

Seqret reads and writes sequences in many formats including FASTA, GenBank, EMBL, GCG, PIR, NBRF, PHYLIP, Clustal, and Stockholm.

Usage:
| wrapper |
wrapper := BioEMBOSSSeqretWrapper new.
wrapper input: input.gbk.
wrapper out: output.fasta.
wrapper outfmtAsFasta.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSSeqretWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Format',
	#package : 'BioWrappers',
	#tag : 'Format'
}

{ #category : 'accessing' }
BioEMBOSSSeqretWrapper class >> category [

	^ 'Sequence Format Conversion'
]

{ #category : 'defaults' }
BioEMBOSSSeqretWrapper >> defaultProgramName [

	^ self execNameFor: 'seqret'
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> infmtAsEmbl [

	^ self propertyAt: 'sformat' ifAbsentPut: [ 'embl' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> infmtAsFasta [

	^ self propertyAt: 'sformat' ifAbsentPut: [ 'fasta' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> infmtAsGenbank [

	^ self propertyAt: 'sformat' ifAbsentPut: [ 'genbank' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outseq'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsClustal [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'clustal' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsEmbl [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'embl' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsFasta [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'fasta' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsGcg [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'gcg' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsGenbank [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'genbank' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsPhylip [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'phylip' ]
]

{ #category : 'parameters' }
BioEMBOSSSeqretWrapper >> outfmtAsPir [

	^ self propertyAt: 'osformat' ifAbsentPut: [ 'pir' ]
]
