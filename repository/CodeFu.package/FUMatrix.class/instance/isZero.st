testing
isZero
	"Answer if the reciever contains no non-zero numbers."

	self doSparseWithIndices: [ :value :row :column | ^false ].
	^true