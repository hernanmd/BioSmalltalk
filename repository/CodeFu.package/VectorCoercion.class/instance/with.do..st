enumerating
with: vector do: aBlock

	^self switch: vector
		caseCoercion: [ aBlock value: number value: vector asNumber ]
		caseVector: [ vector with: self do: [ :a :b | aBlock value: b value: a ]].