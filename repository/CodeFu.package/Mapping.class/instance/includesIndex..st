testing
includesIndex: index

	self keyOf: index ifAbsent: [ ^false ].
	^true