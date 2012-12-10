enumerating
doWithIndices: eachRowColumnBlock 

	self withIndices: [ :row :column |
		eachRowColumnBlock value: (self at: row and: column) value: row value: column
	].