SVD decomposing
documentCorrelation: rank

	| svd items |
	svd := self decomposition.
	items := ((svd V: rank) *~ (svd S: rank)) rows.
	items := items collectWithIndex: [ :vector :index | 
		VectorItem with: (documentMap atKey: index) and: (UnitVector on: vector) ].
	^PartitionCorrelationSquare on: items.