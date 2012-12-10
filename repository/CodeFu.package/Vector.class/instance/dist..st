vector functions
dist: aVector

	| sum |
	sum := 0.
	self with: aVector do: [ :a :b | sum := sum + ((a - b) ** 2) ].
	^sum