initialize-release
initialize: vectorA and: vectorB using: aDistanceBlock

	items := nil.
	distanceBlock := aDistanceBlock.
	partialColumns doWithIndex: [ :vector :column |
		vector putWithIndex: [ :row | 
			distanceBlock value: (vectorA at: column) value: (vectorB at: row) ]]