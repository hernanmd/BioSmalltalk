Class {
	#name : 'BioPDBFile',
	#superclass : 'BioObject',
	#instVars : [
		'atoms',
		'seqResRecords',
		'records',
		'header',
		'title'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBFile >> atoms [
	^ atoms
]

{ #category : 'accessing' }
BioPDBFile >> atoms: aCollection [
	atoms := aCollection
]

{ #category : 'accessing' }
BioPDBFile >> atomsForChain: aChainID [
	^ atoms select: [ :a | a chainID = aChainID ]
]

{ #category : 'accessing' }
BioPDBFile >> header [
	^ header
]

{ #category : 'accessing' }
BioPDBFile >> header: aRecord [
	header := aRecord
]

{ #category : 'accessing' }
BioPDBFile >> records [
	^ records
]

{ #category : 'accessing' }
BioPDBFile >> records: aCollection [
	records := aCollection
]

{ #category : 'accessing' }
BioPDBFile >> seqResRecords [
	^ seqResRecords
]

{ #category : 'accessing' }
BioPDBFile >> seqResRecords: aCollection [
	seqResRecords := aCollection
]

{ #category : 'accessing' }
BioPDBFile >> sequenceForChain: aChainID [
	| chainSeqRes |
	chainSeqRes := seqResRecords select: [ :r | r chainID = aChainID ].
	^ String streamContents: [ :s |
		chainSeqRes do: [ :r | s nextPutAll: r sequenceString ] ]
]

{ #category : 'accessing' }
BioPDBFile >> title [
	^ title
]

{ #category : 'accessing' }
BioPDBFile >> title: aRecord [
	title := aRecord
]
