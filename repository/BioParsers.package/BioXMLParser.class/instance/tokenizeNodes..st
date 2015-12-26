accessing
tokenizeNodes: aCollection
	" Parse the receiver expression and answer the header nodes found "

	self selectNodes: aCollection.
	[ self parser atEnd ]
		whileFalse:
			[ parser next.
			(parser currentNodeUpToAny: self selectedNodes)
				ifNotNil: [ :node | self saveTag: node key value: node value ] ].
	^ self results