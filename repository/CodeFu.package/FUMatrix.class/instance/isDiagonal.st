testing
isDiagonal
	"Answer if the reciever is a diagonal matrix."

	self isSquare ifFalse: [ ^false ].
	self doSparseWithIndices: [ :value :row :column |
		row = column ifFalse: [ ^false ]
	].
	^true