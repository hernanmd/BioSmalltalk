enumerating
with: matrix collect: aBlock

	^self switch: matrix
		caseCoercion: [ MatrixCoercion with: (aBlock value: number value: matrix asNumber) ]
		caseMatrix: [ matrix with: self collect: [ :a :b | aBlock value: b value: a ]].