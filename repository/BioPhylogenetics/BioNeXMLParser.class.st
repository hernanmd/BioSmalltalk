"
It parses a NeXML (http://www.nexml.org) into BioPhyloTree objects using a DOM-style reader over XMLParser. 

It supports the common subset used by DendroPy/Mesquite: <otus>/<otu> (taxon labels) and rooted <tree> elements built from <node> + <edge> (edge source->target = parent->child, edge length = branch length, node otu= ref -> leaf name). Multiple <tree> elements per file are supported.

```
| trees |
""Array of BioPhyloTree""
trees := BioNeXMLParser parseString: xml.
trees := BioNeXMLParser parseFile: aFileReference.
```

Root detection: the `<node>` with root=true, otherwise the node never used as an edge target. 

Intentionally unsupported: <network> (unrooted) raises an error; <characters> blocks (alignments) are not parsed here.
"
Class {
	#name : 'BioNeXMLParser',
	#superclass : 'Object',
	#category : 'BioPhylogenetics-Parsers',
	#package : 'BioPhylogenetics',
	#tag : 'Parsers'
}

{ #category : 'parsing' }
BioNeXMLParser class >> parseFile: aFileReference [
^ self new parseFile: aFileReference
]

{ #category : 'parsing' }
BioNeXMLParser class >> parseString: aString [
^ self new parseString: aString
]

{ #category : 'building' }
BioNeXMLParser >> buildOtuMapFrom: anXMLDocument [
	"Answer a Dictionary mapping OTU id -> label (label defaults to the id)."
	| map |
	map := Dictionary new.
	(anXMLDocument allElementsNamed: #otu) do: [ :otuEl |
		| id label |
		id := otuEl attributeAt: #id ifAbsent: [ nil ].
		label := otuEl attributeAt: #label ifAbsent: [ nil ].
		label ifNil: [ label := id ].
		id ifNotNil: [ map at: id put: label ] ].
	^ map
]

{ #category : 'building' }
BioNeXMLParser >> buildTreeFromTreeElement: treeEl otus: otuMap [
	"Build a BioPhyloTree from a NeXML <tree> element: nodes become clades, edges define parent/child + branch length, OTU refs map to leaf names. Root = the node with root='true', else the node that is never an edge target."
	| nodes edges nodeClades targets rootEl rootClade tree |
	nodes := treeEl elements select: [ :e | e localName = #node ].
	edges := treeEl elements select: [ :e | e localName = #edge ].
	nodes ifEmpty: [ self error: '<tree> has no <node> elements' ].
	nodeClades := Dictionary new.
	targets := Set new.
	nodes do: [ :nEl | | id otuRef clade |
		id := nEl attributeAt: #id ifAbsent: [ nil ].
		clade := BioPhyloClade new.
		otuRef := nEl attributeAt: #otu ifAbsent: [ nil ].
		otuRef ifNotNil: [ clade name: (otuMap at: otuRef ifAbsent: [ otuRef ]) ].
		id ifNotNil: [ nodeClades at: id put: clade ] ].
	edges do: [ :eEl | | src tgt len child parent |
		src := eEl attributeAt: #source ifAbsent: [ nil ].
		tgt := eEl attributeAt: #target ifAbsent: [ nil ].
		len := (eEl attributeAt: #length ifAbsent: [ nil ]) ifNil: [ 0.0 ] ifNotNil: [ :v | v asNumber ].
		child := nodeClades at: tgt ifAbsent: [ nil ].
		parent := nodeClades at: src ifAbsent: [ nil ].
		(child notNil and: [ parent notNil ]) ifTrue: [
			child branchLength: len.
			parent addChild: child ].
		tgt ifNotNil: [ targets add: tgt ] ].
	rootEl := nodes detect: [ :nEl | (nEl attributeAt: #root ifAbsent: [ nil ]) = 'true' ] ifNone: [
		nodes detect: [ :nEl | (targets includes: (nEl attributeAt: #id ifAbsent: [ nil ])) not ] ifNone: [ nil ] ].
	rootClade := rootEl ifNil: [ nil ] ifNotNil: [ :nEl | nodeClades at: (nEl attributeAt: #id ifAbsent: [ nil ]) ifAbsent: [ nil ] ].
	rootClade ifNil: [ self error: 'Could not determine root node of NeXML tree' ].
	tree := BioPhyloTree new.
	tree name: (treeEl attributeAt: #label ifAbsent: [ nil ]).
	tree root: rootClade.
	^ tree
]

{ #category : 'building' }
BioNeXMLParser >> buildTreesFrom: anXMLDocument [
	| trees otuMap |
	trees := anXMLDocument allElementsNamed: #tree.
	trees ifEmpty: [ self error: 'No <tree> element found in NeXML document (unrooted <network> is not supported)' ].
	otuMap := self buildOtuMapFrom: anXMLDocument.
	^ trees collect: [ :el | self buildTreeFromTreeElement: el otus: otuMap ] as: Array
]

{ #category : 'parsing' }
BioNeXMLParser >> parseFile: aFileReference [
	"Parse a NeXML file (FileReference or path string) and answer an Array of BioPhyloTree."
	^ self parseString: aFileReference asFileReference contents
]

{ #category : 'parsing' }
BioNeXMLParser >> parseString: aString [
	"Parse a NeXML string and answer an Array of BioPhyloTree (one per <tree>). Only rooted <tree> elements are supported; <network> is not."
	| doc |
	[ doc := (XMLDOMParser on: aString readStream) parseDocument ]
		on: Error
		do: [ :ex | self error: 'Invalid NeXML document: ' , ex messageText ].
	^ self buildTreesFrom: doc
]
