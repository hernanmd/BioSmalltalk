accessing - private
parseNodeIdFromXML: aXMLString 
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