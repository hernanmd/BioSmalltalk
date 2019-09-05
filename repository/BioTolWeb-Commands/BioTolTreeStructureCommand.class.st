"
This is a helper class and should not be used directly. Use the BioTolWebClient instead.

TreeStructure example

http://tolweb.org/onlinecontributors/app?service=external&page=xml/TreeStructureService&node_id=2459


"
Class {
	#name : #BioTolTreeStructureCommand,
	#superclass : #BioTolWebCommand,
	#category : 'BioTolWeb-Commands'
}

{ #category : #accessing }
BioTolTreeStructureCommand class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ '/TreeStructureService'
]

{ #category : #accessing }
BioTolTreeStructureCommand >> execute [
	" Private - See superimplementor's comment "

	self halt.
	self nodeId: self client nodeId.
	^ self parseTreeOfLifeFromXML: super execute result.
]

{ #category : #accessing }
BioTolTreeStructureCommand >> nodeId: nodeId [
	" Set ther receiver's client node id "

	self url queryAt: 'node_id' put: nodeId asString
]

{ #category : #'accessing - private' }
BioTolTreeStructureCommand >> parseTreeOfLifeFromXML: aXMLString [ 
	| nodeIdName nodes parser |
	
	nodeIdName := 'NODE'.
	nodes := OrderedCollection new.
	parser := XMLPullParser parse: aXMLString.
	parser reset.
	[ parser isStartTag: nodeIdName ] whileFalse: [ | text |
		parser next.
		(text := parser textWhileNotTag: nodeIdName) notNil ifTrue: [ nodes add: text ] ].
	(parser isStartTag: nodeIdName)
		ifTrue: [ ^ (parser 
						at: 'ID' 
						ifNone: [ self error: 'Node not found' ]) ].
	self error: 'Unknown error'
]
