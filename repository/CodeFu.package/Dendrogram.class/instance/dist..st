seriation
dist: dendrogram

	| sum |
	sum := Accumulator sum.
	self elements cross: dendrogram elements do: [ :a :b | sum add: (a dist: b) ].
	^sum average