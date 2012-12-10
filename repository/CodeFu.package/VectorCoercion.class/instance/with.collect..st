enumerating
with: vector collect: aBlock

	^self switch: vector
		caseCoercion: [ MatrixCoercion with: (aBlock value: number value: vector asNumber) ]
		caseVector: [ vector with: self collect: [ :a :b | aBlock value: b value: a ]].