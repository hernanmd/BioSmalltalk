private
switch: matrix caseCoercion: coercionBlock caseMatrix: matrixBlock

	^(matrix isKindOf: MatrixCoercion)
		ifTrue: [ coercionBlock value ]
		ifFalse: [ matrixBlock value ]