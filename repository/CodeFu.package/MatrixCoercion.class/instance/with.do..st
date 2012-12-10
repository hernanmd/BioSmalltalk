enumerating
with: matrix do: aBlock

	^self switch: matrix
		caseCoercion: [ aBlock value: number value: matrix asNumber ]
		caseMatrix: [ matrix with: self do: [ :a :b | aBlock value: b value: a ]].