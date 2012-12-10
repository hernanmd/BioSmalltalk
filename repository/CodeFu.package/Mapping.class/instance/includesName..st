testing
includesName: name

	self at: name ifAbsent: [ ^false ].
	^true