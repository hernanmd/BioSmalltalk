accessing
tokenizeHeader
	" Parse the receiver expression and answer the header nodes found "

	parser := XMLPullParser parse: self expression.
	self formatter: BioXMLDictionary new.
	[ parser isStartTag: 'BlastOutput_iterations' ]
       whileFalse:[
			| node |	
			parser next.
			(node := parser currentNodeUpTo: 'BlastOutput_iterations')
				ifNotNil: [ self saveTag: node key value: node value ] ].
	^ self results