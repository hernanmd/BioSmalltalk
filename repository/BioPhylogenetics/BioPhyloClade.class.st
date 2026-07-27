"
A node in a phylogenetic tree, the Pharo analogue of Bio.Phylo Clade (a Tree.Node). I am an internal clade (with children) or a terminal/leaf clade (no children). Slots: name, branchLength, parent, children, confidence, comment.

Build by hand:
  root := BioPhyloClade new name: #root; yourself.
  root addChild: (BioPhyloClade new name: #A; branchLength: 0.1; yourself).

Navigation / metrics:
  clade isLeaf / isTerminal / isRoot.
  clade leaves.            ""terminal clades under me""
  clade countTerminals.
  clade depth.             ""edges from the root""
  clade branchLengthToRoot.
  clade ancestors.
  clade commonAncestorWith: other.   ""MRCA""
  clade ladderize.

I am normally created by the readers (BioPhyloNewickReader, BioNewickSmaCCParser, BioPhyloXMLParser, BioNeXMLParser).
"
Class {
	#name : 'BioPhyloClade',
	#superclass : 'Object',
	#instVars : [
		'name',
		'branchLength',
		'parent',
		'children',
		'confidence',
		'comment'
	],
	#category : 'BioPhylogenetics-Model',
	#package : 'BioPhylogenetics',
	#tag : 'Model'
}

{ #category : 'adding' }
BioPhyloClade >> addChild: aClade [
	"Add aClade as a child, setting its parent. Answers aClade."
	aClade parent: self.
	children add: aClade.
	^ aClade
]

{ #category : 'adding' }
BioPhyloClade >> addChildren: aCollection [
	^ aCollection collect: [ :each | self addChild: each ]
]

{ #category : 'accessing' }
BioPhyloClade >> allClades [
	^ Array streamContents: [ :s | self allCladesDo: [ :c | s nextPut: c ] ]
]

{ #category : 'enumerating' }
BioPhyloClade >> allCladesDo: aBlock [
	aBlock value: self.
	children do: [ :c | c allCladesDo: aBlock ]
]

{ #category : 'accessing' }
BioPhyloClade >> ancestors [
	"Answer the chain of ancestor clades from the parent up to the root."
	^ parent ifNil: [ Array empty ] ifNotNil: [ Array streamContents: [ :s | s nextPut: parent. parent ancestors do: [ :a | s nextPut: a ] ] ]
]

{ #category : 'accessing' }
BioPhyloClade >> branchLength [
	^ branchLength
]

{ #category : 'accessing' }
BioPhyloClade >> branchLength: aNumber [
	branchLength := aNumber
]

{ #category : 'metrics' }
BioPhyloClade >> branchLengthToRoot [
	"Sum of branch lengths from the receiver up to the root."
	^ parent ifNil: [ branchLength ] ifNotNil: [ branchLength + parent branchLengthToRoot ]
]

{ #category : 'accessing' }
BioPhyloClade >> children [
	^ children
]

{ #category : 'querying' }
BioPhyloClade >> cladeNamed: aString [
	"Answer the first clade (self or descendant) whose name equals aString, or nil."
	^ self allClades detect: [ :c | c name = aString ] ifNone: [ nil ]
]

{ #category : 'accessing' }
BioPhyloClade >> comment [
	^ comment
]

{ #category : 'accessing' }
BioPhyloClade >> comment: aString [
	comment := aString
]

{ #category : 'querying' }
BioPhyloClade >> commonAncestorWith: aClade [
	"Answer the most recent common ancestor of the receiver and aClade, or nil."
	| mine other |
	mine := (Array with: self) , self ancestors.
	other := aClade.
	[ other isNil ] whileFalse: [
		(mine includes: other) ifTrue: [ ^ other ].
		other := other parent ].
	^ nil
]

{ #category : 'accessing' }
BioPhyloClade >> confidence [
	^ confidence
]

{ #category : 'accessing' }
BioPhyloClade >> confidence: aNumber [
	confidence := aNumber
]

{ #category : 'metrics' }
BioPhyloClade >> countTerminals [
	"Answer the number of terminal (leaf) clades under the receiver."
	^ self isLeaf ifTrue: [ 1 ] ifFalse: [ (children collect: #countTerminals) sum ]
]

{ #category : 'metrics' }
BioPhyloClade >> depth [
	"Number of edges from the root to the receiver (root = 0)."
	^ parent ifNil: [ 0 ] ifNotNil: [ parent depth + 1 ]
]

{ #category : 'accessing' }
BioPhyloClade >> descendants [
	^ children flatCollect: [ :c | (OrderedCollection with: c) addAll: c descendants; yourself ] as: Array
]

{ #category : 'accessing' }
BioPhyloClade >> getTerminals [
	"Bio.Phylo compatibility — same as #leaves."
	^ self leaves
]

{ #category : 'initialization' }
BioPhyloClade >> initialize [
	children := OrderedCollection new.
	branchLength := 0.0.
	^ self
]

{ #category : 'testing' }
BioPhyloClade >> isLeaf [
	^ children isEmpty
]

{ #category : 'testing' }
BioPhyloClade >> isRoot [
	^ parent isNil
]

{ #category : 'testing' }
BioPhyloClade >> isTerminal [
	"Alias for isLeaf (Bio.Phylo compatibility)"
	^ self isLeaf
]

{ #category : 'operations' }
BioPhyloClade >> ladderize [
	"Reorder branches so smaller clades face left (Bio.Phylo default ladderize())."
	^ self ladderizeDirection: #left
]

{ #category : 'operations' }
BioPhyloClade >> ladderizeDirection: aSymbol [
	"Reorder children so that (#left -> smallest subtree first, #right -> largest first).
	 Recursively ladderizes each child."
	| sorted |
	sorted := self isLeaf
		ifTrue: [ children ]
		ifFalse: [ children sort: [ :a :b | 
			| da db |
			da := a countTerminals. db := b countTerminals.
			aSymbol = #left
				ifTrue: [ da <= db ]
				ifFalse: [ da >= db ] ] ].
	children := sorted.
	children do: [ :c | c ladderizeDirection: aSymbol ].
	^ self
]

{ #category : 'accessing' }
BioPhyloClade >> leaves [
	"Answer an Array of terminal (leaf) clades in the receiver, in traversal order."
	^ Array streamContents: [ :s | self leavesDo: [ :leaf | s nextPut: leaf ] ]
]

{ #category : 'enumerating' }
BioPhyloClade >> leavesDo: aBlock [
	self isLeaf ifTrue: [ ^ aBlock value: self ].
	children do: [ :c | c leavesDo: aBlock ]
]

{ #category : 'accessing' }
BioPhyloClade >> name [
	^ name
]

{ #category : 'accessing' }
BioPhyloClade >> name: aString [
	name := aString
]

{ #category : 'accessing' }
BioPhyloClade >> parent [
	^ parent
]

{ #category : 'accessing' }
BioPhyloClade >> parent: aClade [
	parent := aClade
]

{ #category : 'printing' }
BioPhyloClade >> printOn: aStream [
	super printOn: aStream.
	name ifNotNil: [ aStream nextPutAll: ' ('; nextPutAll: name; nextPutAll: ')' ].
	self isLeaf ifFalse: [ aStream nextPutAll: ' ['; print: self countTerminals; nextPutAll: ' tips]' ]
]

{ #category : 'removing' }
BioPhyloClade >> removeChild: aClade [
	aClade parent: nil.
	^ children remove: aClade ifAbsent: [ nil ]
]

{ #category : 'metrics' }
BioPhyloClade >> subtreeHeight [
	"Max total branch length from the receiver to its deepest leaf."
	^ self isLeaf ifTrue: [ 0 ] ifFalse: [ (children collect: [ :c | c branchLength + c subtreeHeight ]) max ]
]
