initialize-release
initialize: someItems using: aDistanceBlock

	items := someItems.
	distanceBlock := aDistanceBlock.
	partialColumns doWithIndex: [ :vector :column |
		vector putWithIndex: [ :row | 
			distanceBlock value: (items at: column) value: (items at: row) ]]