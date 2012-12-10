testing
includesKey: key

	self atKey: key ifAbsent: [ ^false ].
	^true