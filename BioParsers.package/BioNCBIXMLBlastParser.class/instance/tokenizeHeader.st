accessing
tokenizeHeader
	" Parse the receiver expression and answer the header nodes found "

	self formatter: BioXMLDictionary new.
	[ parser isStartTag: 'BlastOutput_iterations' ]
       whileFalse:[
			| node |	
			parser next.
			(node := parser textWhileNotTag: 'BlastOutput_iterations')
				ifNotNil: [ self saveTag: node key value: node value ] ].
	^ self results