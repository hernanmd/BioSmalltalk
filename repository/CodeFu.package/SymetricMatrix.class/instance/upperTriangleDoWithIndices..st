enumerating
upperTriangleDoWithIndices: aBlock

	1 to: self columnSize do: [ :column |
		1 to: column do: [ :row |
			aBlock value: (self at: row and: column) value: row value: column.
		]
	]