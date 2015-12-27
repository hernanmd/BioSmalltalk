accessing
tokenizeHeader
	" Parse the receiver expression and answer the header nodes found "

	self formatter: BioXMLDictionary new.
	[ parser isStartTag: 'BlastOutput_iterations' ]
		whileFalse: [ 
			parser next.
			(parser textWhileNotTag: 'BlastOutput_iterations')
				ifNotNil: [ : node | self saveTag: node key value: node value ] ].
	^ self results