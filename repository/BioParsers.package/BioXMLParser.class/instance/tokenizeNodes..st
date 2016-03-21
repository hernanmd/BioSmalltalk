accessing
tokenizeNodes: tagCollection
	" Parse the receiver expression and answer the header nodes found "

	self selectNodes: tagCollection.
	[ self parser atEnd ]
		whileFalse: [ 
			(parser textOfAny: self selectedNodes)
				ifNotNil: [ : node | self saveTag: node key value: node value ].
			(parser isDocumentTag and: [ tagCollection includes: parser tag name ])
				ifFalse: [ parser next ] ].
	^ self results
