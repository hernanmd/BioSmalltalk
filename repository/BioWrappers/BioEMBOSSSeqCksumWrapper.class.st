"
I am a wrapper for the EMBOSS seqcksum sequence checksum tool.

Seqcksum calculates checksums for sequences to verify data integrity.

Usage:
| wrapper |
wrapper := BioEMBOSSSeqCksumWrapper new.
wrapper input: sequence.fasta.
wrapper execute.
"
Class {
	#name : 'BioEMBOSSSeqCksumWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Operations',
	#package : 'BioWrappers',
	#tag : 'Operations'
}

{ #category : 'accessing' }
BioEMBOSSSeqCksumWrapper class >> category [

	^ 'Sequence Operations'
]

{ #category : 'defaults' }
BioEMBOSSSeqCksumWrapper >> defaultProgramName [

	^ self execNameFor: 'seqcksum'
]

{ #category : 'parameters' }
BioEMBOSSSeqCksumWrapper >> input: aFilename [

	^ self
		  propertyAt: 'sequence'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioEMBOSSSeqCksumWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]
