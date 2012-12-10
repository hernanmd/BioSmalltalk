private
switch: matrix caseCoercion: coercionBlock caseVector: vectorBlock

	^(matrix isKindOf: VectorCoercion)
		ifTrue: [ coercionBlock value ]
		ifFalse: [ vectorBlock value ]