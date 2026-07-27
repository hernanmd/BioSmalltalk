"
I represent a rooted phylogenetic tree, the Pharo analogue of BioPython Bio.Phylo.BaseTree.Tree and of the tree read by R ape/ggtree. I hold a root BioPhyloClade plus metadata (name, rooted, weight).

I/O:
  tree := BioPhyloTree readFromNewick: '((A:0.1,B:0.2):0.3,(C:0.4,D:0.5):0.6);'.
  tree newickString.
  BioPhyloXMLParser parseString: xml.   ""Array of BioPhyloTree""
  BioNeXMLParser parseString: xml.

Queries (Bio.Phylo / ggtree):
  tree countTerminals.
  tree leaves collect: #name.
  tree commonAncestor: #('A' 'B').      ""MRCA (ggtree MRCA)""
  tree distanceBetween: 'A' and: 'B'.   ""patristic distance""
  tree ladderize.

Visualization (Roassal 3, ggtree-style grammar of layers):
  (BioPhyloPlotBuilder on: tree) tipPoints; nodePoints; scaleBar; open.
  (BioPhyloPlotBuilder on: tree) circular; tipLabels; open.

See AIDendrogram class-side examples for Roassal 3 dendrogram examples.
"
Class {
	#name : 'BioPhyloTree',
	#superclass : 'Object',
	#instVars : [
		'name',
		'rooted',
		'weight',
		'root'
	],
	#category : 'BioPhylogenetics-Model',
	#package : 'BioPhylogenetics',
	#tag : 'Model'
}

{ #category : 'converting' }
BioPhyloTree class >> readFromNewick: aString [
"Parse a Newick string. Uses the SmaCC-generated BioNewickSmaCCParser when available (fast LALR); falls back to the hand-rolled BioPhyloNewickReader for quoted labels / NHX comments or when the generated parser is not loaded."
| parser |
parser := Smalltalk at: #BioNewickSmaCCParser ifAbsent: [ nil ].
^ parser ifNil: [ BioPhyloNewickReader read: aString ] ifNotNil: [ [ parser parse: aString ] on: SmaCCParserError do: [ BioPhyloNewickReader read: aString ] ]
]

{ #category : 'metrics' }
BioPhyloTree >> allClades [
	^ root ifNil: [ #() ] ifNotNil: [ root allClades ]
]

{ #category : 'converting' }
BioPhyloTree >> asNewickString [
	^ self newickString
]

{ #category : 'querying' }
BioPhyloTree >> commonAncestor: aCollectionOfNames [
	"Answer the MRCA clade of the clades whose names are in aCollectionOfNames.
	 Mirrors ggtree's MRCA(tree, tip=...) and Bio.Phylo's Tree.common_ancestor."
	| clades first |
	clades := aCollectionOfNames collect: [ :n | self cladeNamed: n ] thenSelect: #notNil.
	clades ifEmpty: [ ^ nil ].
	first := clades first.
	^ clades allButFirst inject: first into: [ :acc :each | acc commonAncestorWith: each ]
]

{ #category : 'metrics' }
BioPhyloTree >> countTerminals [
	^ root ifNil: [ 0 ] ifNotNil: [ root countTerminals ]
]

{ #category : 'querying' }
BioPhyloTree >> distanceBetween: name1 and: name2 [
	"Answer the patristic (branch-length) distance between two named terminals/clades."
	| c1 c2 mrca |
	c1 := self cladeNamed: name1. c2 := self cladeNamed: name2.
	(c1 isNil or: [ c2 isNil ]) ifTrue: [ ^ nil ].
	mrca := c1 commonAncestorWith: c2.
	mrca ifNil: [ ^ nil ].
	^ (c1 branchLengthToRoot - mrca branchLengthToRoot) + (c2 branchLengthToRoot - mrca branchLengthToRoot)
]

{ #category : 'metrics' }
BioPhyloTree >> getTerminals [
	"Bio.Phylo compatibility."
	^ self leaves
]

{ #category : 'initialization' }
BioPhyloTree >> initialize [
	super initialize.
	rooted := false.
	weight := 1.0.
	^ self
]

{ #category : 'operations' }
BioPhyloTree >> ladderize [
	"Reorder the tree's branches (Bio.Phylo Tree.ladderize). Answers the receiver."
	root ifNotNil: [ root ladderize ].
	^ self
]

{ #category : 'operations' }
BioPhyloTree >> ladderizeDirection: aSymbol [
	root ifNotNil: [ root ladderizeDirection: aSymbol ].
	^ self
]

{ #category : 'metrics' }
BioPhyloTree >> leaves [
	^ root ifNil: [ #() ] ifNotNil: [ root leaves ]
]

{ #category : 'accessing' }
BioPhyloTree >> name [
	^ name
]

{ #category : 'accessing' }
BioPhyloTree >> name: aString [
	name := aString
]

{ #category : 'converting' }
BioPhyloTree >> newickString [
	^ BioPhyloNewickWriter write: self
]

{ #category : 'printing' }
BioPhyloTree >> printOn: aStream [

	super printOn: aStream.
	name ifNotNil: [
			aStream
				nextPutAll: ' (';
				nextPutAll: name;
				nextPutAll: ')' ].
	aStream
		nextPutAll: ' [';
		print: self countTerminals;
		nextPutAll: ' tips]'
]

{ #category : 'accessing' }
BioPhyloTree >> root [
	^ root
]

{ #category : 'accessing' }
BioPhyloTree >> root: aBioPhyloClade [
	root := aBioPhyloClade
]

{ #category : 'accessing' }
BioPhyloTree >> rooted [
	^ rooted
]

{ #category : 'accessing' }
BioPhyloTree >> rooted: aBoolean [
	rooted := aBoolean
]

{ #category : 'metrics' }
BioPhyloTree >> totalBranchLength [
	"Sum of all branch lengths in the tree."
	^ self allClades inject: 0 into: [ :sum :c | sum + c branchLength ]
]

{ #category : 'accessing' }
BioPhyloTree >> weight [
	^ weight
]

{ #category : 'accessing' }
BioPhyloTree >> weight: aNumber [
	weight := aNumber
]
