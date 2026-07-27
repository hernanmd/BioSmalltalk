"
Parse phyloXML (http://www.phyloxml.org) into BioPhyloTree objects using a DOM-style reader over the XMLParser library (a full XML grammar in SmaCC was not practical; DOM is robust for this nested format). I support the common subset: <phylogeny> (multiple per file), <clade> recursion, branch_length (attribute or <branch_length> child), <name>, <taxonomy><scientific_name>, <confidence> (support values), and <sequence>/<property> metadata (stored in the clade comment).

```
| trees |
trees := BioPhyloXMLParser parseString: xml.   ""Array of BioPhyloTree""
trees := BioPhyloXMLParser parseFile: aFileReference.
```

Intentionally unsupported (ignored, not an error): <distribution>, <date>, <reference>, <events>, <clade_relation>, binary/annotations elements. 

Unrooted phylogenies are read but rooted at their first <clade>.
"
Class {
	#name : 'BioPhyloXMLParser',
	#superclass : 'Object',
	#category : 'BioPhylogenetics-Parsers',
	#package : 'BioPhylogenetics',
	#tag : 'Parsers'
}

{ #category : 'parsing' }
BioPhyloXMLParser class >> parseFile: aFileReference [
^ self new parseFile: aFileReference
]

{ #category : 'parsing' }
BioPhyloXMLParser class >> parseString: aString [
^ self new parseString: aString
]

{ #category : 'helpers' }
BioPhyloXMLParser >> branchLengthOf: cladeEl [
	"branch_length attribute takes precedence; otherwise a <branch_length> child element; default 0.0."
	| attr child |
	attr := cladeEl attributeAt: #branch_length ifAbsent: [ nil ].
	attr ifNotNil: [ ^ attr asNumber ].
	child := self firstChildNamed: #branch_length in: cladeEl.
	child ifNotNil: [ ^ child contentString trimBoth asNumber ].
	^ 0.0
]

{ #category : 'building' }
BioPhyloXMLParser >> buildCladeFrom: cladeEl [
	"Recursively build a BioPhyloClade from a phyloXML <clade> element: name (from <name> or <taxonomy><scientific_name>), branch_length (attribute or child), confidence, and child clades. Sequence/property metadata is stored in the clade comment."
	| clade nameEl tax sn |
	clade := BioPhyloClade new.
	nameEl := self firstChildNamed: #name in: cladeEl.
	nameEl ifNotNil: [ clade name: nameEl contentString trimBoth ] ifNil: [
		tax := self firstChildNamed: #taxonomy in: cladeEl.
		tax ifNotNil: [
			sn := self firstChildNamed: #scientific_name in: tax.
			sn ifNotNil: [ clade name: sn contentString trimBoth ] ] ].
	clade branchLength: (self branchLengthOf: cladeEl).
	(self firstChildNamed: #confidence in: cladeEl) ifNotNil: [ :conf |
		clade confidence: conf contentString trimBoth asNumber ].
	(cladeEl elements select: [ :e | e localName = #clade ]) do: [ :child |
		clade addChild: (self buildCladeFrom: child) ].
	clade comment: (self metadataOf: cladeEl).
	^ clade
]

{ #category : 'building' }
BioPhyloXMLParser >> buildTreeFromPhylogeny: phyloEl [
	| tree rootClade nameEl rootedAttr |
	tree := BioPhyloTree new.
	nameEl := self firstChildNamed: #name in: phyloEl.
	nameEl ifNotNil: [ tree name: nameEl contentString trimBoth ].
	rootedAttr := phyloEl attributeAt: #rooted ifAbsent: [ nil ].
	rootedAttr ifNotNil: [ tree rooted: rootedAttr asString = 'true' ].
	rootClade := self firstChildNamed: #clade in: phyloEl.
	rootClade ifNil: [ self error: '<phylogeny> has no root <clade> element' ].
	tree root: (self buildCladeFrom: rootClade).
	^ tree
]

{ #category : 'building' }
BioPhyloXMLParser >> buildTreesFrom: anXMLDocument [
	| phylos |
	phylos := anXMLDocument allElementsNamed: #phylogeny.
	phylos ifEmpty: [ self error: 'No <phylogeny> element found in phyloXML document' ].
	^ phylos collect: [ :el | self buildTreeFromPhylogeny: el ] as: Array
]

{ #category : 'helpers' }
BioPhyloXMLParser >> firstChildNamed: aSymbol in: parentEl [
	"Answer the first direct child element whose local name equals aSymbol, or nil."
	^ parentEl elements detect: [ :e | e localName = aSymbol asString ] ifNone: [ nil ]
]

{ #category : 'helpers' }
BioPhyloXMLParser >> metadataOf: cladeEl [
	"Collect sequence accession and <property> key=value pairs as a comma-separated metadata string (or nil)."
	| parts |
	parts := OrderedCollection new.
	(self firstChildNamed: #sequence in: cladeEl) ifNotNil: [ :seq |
		(self firstChildNamed: #accession in: seq) ifNotNil: [ :acc |
			parts add: 'accession=' , acc contentString trimBoth ] ].
	(cladeEl elements select: [ :e | e localName = #property ]) do: [ :prop |
		| ref |
		ref := prop attributeAt: #ref ifAbsent: [ nil ].
		ref ifNil: [ ref := 'property' ].
		parts add: ref , '=' , prop contentString trimBoth ].
	^ parts isEmpty ifTrue: [ nil ] ifFalse: [ String streamContents: [ :s | parts do: [ :p | s nextPutAll: p ] separatedBy: [ s nextPutAll: ', ' ] ] ]
]

{ #category : 'parsing' }
BioPhyloXMLParser >> parseFile: aFileReference [
	"Parse a phyloXML file (FileReference or path string) and answer an Array of BioPhyloTree."
	^ self parseString: aFileReference asFileReference contents
]

{ #category : 'parsing' }
BioPhyloXMLParser >> parseString: aString [
	"Parse a phyloXML string and answer an Array of BioPhyloTree (one per <phylogeny>)."
	| doc |
	[ doc := (XMLDOMParser on: aString readStream) parseDocument ]
		on: Error
		do: [ :ex | self error: 'Invalid phyloXML document: ' , ex messageText ].
	^ self buildTreesFrom: doc
]
