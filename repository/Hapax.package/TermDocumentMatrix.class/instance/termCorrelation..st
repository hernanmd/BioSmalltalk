SVD decomposing
termCorrelation: rank

	| svd items |
	svd := self decomposition.
	items := ((svd U: rank) *~ (svd S: rank)) rows.
	items := items collectWithIndex: [ :vector :index | 
		VectorItem with: (termMap atKey: index) and: (UnitVector on: vector) ].
	^PartitionCorrelationSquare on: items.