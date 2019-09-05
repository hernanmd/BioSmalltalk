"
This is a helper class and should not be used directly. Use the BioTolWebClient instead.

GroupSearch example:

http://tolweb.org/onlinecontributors/app?service=external&page=xml/GroupSearchService&group=xxx 


"
Class {
	#name : #BioTolGroupSearchCommand,
	#superclass : #BioTolWebCommand,
	#category : 'BioTolWeb-Commands'
}

{ #category : #accessing }
BioTolGroupSearchCommand class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ '/GroupSearchService'
]

{ #category : #accessing }
BioTolGroupSearchCommand >> execute [
	" Private - See superimplementor's comment "

	self group: self client groupName.
	^ self parseNodeIdFromXML: super execute result.
]

{ #category : #accessing }
BioTolGroupSearchCommand >> group: aGroupId [
	" Set ther receiver's group for the group service "

	self url queryAt: 'group' put: aGroupId asString
]

{ #category : #'accessing - private' }
BioTolGroupSearchCommand >> parseNodeIdFromXML: aXMLString [ 
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
