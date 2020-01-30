"
Abstract class for specific BioSmalltalk XML parsers. It provides a formatter to propertly convert nodes and a nodes, a <Collection> of <String> representing each a node (tag name) we have interest.


"
Class {
	#name : #BioXMLParser,
	#superclass : #BioAbstractParser,
	#instVars : [
		'formatter',
		'nodes'
	],
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioXMLParser class >> defaultNodes [

	self subclassResponsibility
]

{ #category : #accessing }
BioXMLParser class >> parse: anObject [

	^ (self on: anObject readStream) parse
]

{ #category : #accessing }
BioXMLParser class >> parserNodes [

	^ self defaultNodes
]

{ #category : #accessing }
BioXMLParser >> defaultFormatterClass [

	^ BioXMLDictionaryMap
]

{ #category : #accessing }
BioXMLParser >> defaultNodes [

	^ self class defaultNodes

]

{ #category : #accessing }
BioXMLParser >> formatter [

	^ formatter
		ifNil: [ formatter := self defaultFormatterClass new ]
]

{ #category : #accessing }
BioXMLParser >> formatter: anObject [
	formatter := anObject
]

{ #category : #accessing }
BioXMLParser >> nodes [
	^ nodes
]

{ #category : #accessing }
BioXMLParser >> nodes: anObject [
	nodes := anObject
]

{ #category : #accessing }
BioXMLParser >> parse [
	" Parse the receiver expression and answer the header nodes found "

	[ parser atEnd ] whileFalse: [
		| node |
		parser next.
		(node := parser currentNodeUpToAny: self selectedNodes)
			ifNotNil: [ self saveTag: node key value: node value ] ].
	^ self results
]

{ #category : #accessing }
BioXMLParser >> parser [

	^ parser
		ifNil: [ parser := XMLPullParser parse: self expression ]
]

{ #category : #accessing }
BioXMLParser >> resultClass [
	" Answer a default class for storing the receiver's parsing results "
	
	^ self formatter resultClass
]

{ #category : #accessing }
BioXMLParser >> saveTag: tagName value: tagValueString [
	" Private - Save the matched tagNameString with its tagValueString in the receiver's result "

	self formatter 
			saveTag: tagName
			value: tagValueString 
			in: self results
]

{ #category : #accessing }
BioXMLParser >> selectNodes: aCollection [
	" Set aCollection being a <Collection> of <String> representing node names as the receiver's selected nodes "

	nodes := aCollection
]

{ #category : #accessing }
BioXMLParser >> selectedNodes [

	^ nodes
		ifNil: [ nodes := self defaultNodes ]
]

{ #category : #accessing }
BioXMLParser >> tokenizeNodes [
	" Parse the receiver expression and answer the result nodes found "

	^ self tokenizeNodes: self selectedNodes
]

{ #category : #accessing }
BioXMLParser >> tokenizeNodes: tagCollection [
	" Parse the receiver expression and answer the header nodes found "

	self selectNodes: tagCollection.
	[ self parser atEnd ]
		whileFalse: [ 
			(parser textOfAny: self selectedNodes)
				ifNotNil: [ : node | self saveTag: node key value: node value ].
			(parser isDocumentTag and: [ tagCollection includes: parser tag name ])
				ifFalse: [ parser next ] ].
	^ self results

]
