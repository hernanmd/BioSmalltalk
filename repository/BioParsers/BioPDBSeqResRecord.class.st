"
Represents a SEQRES record in a PDB file. Instance Variables: serialNumber chainID numResidues residues
"
Class {
	#name : 'BioPDBSeqResRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'serialNumber',
		'chainID',
		'numResidues',
		'residues'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBSeqResRecord >> chainID [
	^ chainID
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> chainID: aString [
	chainID := aString
]

{ #category : 'testing' }
BioPDBSeqResRecord >> isSeqResRecord [
	^ true
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> numResidues [
	^ numResidues
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> numResidues: aNumber [
	numResidues := aNumber
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> residues [
	^ residues
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> residues: aCollection [
	residues := aCollection
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> sequenceString [
	^ String streamContents: [ :s | residues do: [ :r | s nextPutAll: r ] ]
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> serialNumber [
	^ serialNumber
]

{ #category : 'accessing' }
BioPDBSeqResRecord >> serialNumber: aNumber [
	serialNumber := aNumber
]
