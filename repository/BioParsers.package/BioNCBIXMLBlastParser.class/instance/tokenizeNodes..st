accessing
tokenizeNodes: aCollection
	" Parse the receiver expression and answer the header nodes found "

	parser := XMLPullParser parse: self expression.
	self selectNodes: aCollection.
	[ parser atEnd not ] whileTrue: [
		| node |
		parser next.
		( node := parser currentNodeUpToAny: self selectedNodes )
			ifNotNil: [ self saveTag: node key value: node value ] ].
	^ self results