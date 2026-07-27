"
I serialize a BioPhyloTree to a Newick (New Hampshire) string. Labels containing Newick metacharacters are single-quoted (with internal quotes doubled).

  BioPhyloNewickWriter write: aBioPhyloTree.   ""e.g. '((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);'""

BioPhyloTree>>newickString / asNewickString delegate to me.
"
Class {
	#name : 'BioPhyloNewickWriter',
	#superclass : 'Object',
	#category : 'BioPhylogenetics-IO',
	#package : 'BioPhylogenetics',
	#tag : 'IO'
}

{ #category : 'writing' }
BioPhyloNewickWriter class >> write: aBioPhyloTree [	^ self new write: aBioPhyloTree
]

{ #category : 'writing' }
BioPhyloNewickWriter >> escapeLabel: aString [
	"Quote the label if it contains Newick metacharacters; double internal quotes."
	(aString anySatisfy: [ :ch | #($( $) $, $: $; $') includes: ch ])
		ifTrue: [ ^ $' asString , (aString copyReplaceAll: $' asString with: '''''') , $' asString ]
		ifFalse: [ ^ aString ]
]

{ #category : 'writing' }
BioPhyloNewickWriter >> write: aBioPhyloTree [
	"Answer the Newick string for aBioPhyloTree."
	^ (self writeClade: aBioPhyloTree root) , ';'
]

{ #category : 'writing' }
BioPhyloNewickWriter >> writeClade: aClade [
	| stream |
	stream := (String new: 64) writeStream.
	aClade isLeaf ifFalse: [
		stream nextPut: $(.
		aClade children
			do: [ :c | stream nextPutAll: (self writeClade: c) ]
			separatedBy: [ stream nextPut: $, ].
		stream nextPut: $) ].
	aClade name ifNotNil: [ :n | stream nextPutAll: (self escapeLabel: n) ].
	aClade branchLength > 0 ifTrue: [ stream nextPut: $:; print: aClade branchLength ].
	^ stream contents
]
