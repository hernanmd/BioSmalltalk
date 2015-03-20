accessing
parse
	" Parse the receiver expression and answer the header nodes found "

	[ parser atEnd ] whileFalse: [
		| node |
		parser next.
		( node := parser currentNodeUpToAny: self selectedNodes )
			ifNotNil: [ self saveTag: node key value: node value ] ].
	^ self results