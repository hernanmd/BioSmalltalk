enumerating
withIndices: aBlock

	1 to: self rowSize do: [ :row |
		1 to: self columnSize do: [ :column |
			aBlock value: row value: column
		]
	]