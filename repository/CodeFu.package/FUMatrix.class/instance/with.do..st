enumerating
with: aMatrix do: eachOtherBlock

	[ aMatrix hasDimension: self dimension ] assert.
	self withIndices: [ :row :column |
		eachOtherBlock value: (self at: row and: column) value: (aMatrix at: row and: column)
	].