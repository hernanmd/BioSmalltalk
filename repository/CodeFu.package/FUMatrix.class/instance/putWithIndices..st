enumerating
putWithIndices: rowColumnBlock

	self withIndices: [ :row :column |
		self at: row and: column put: (rowColumnBlock value: row value: column)
	].
	^self