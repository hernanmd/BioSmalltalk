enumerating
with: aMatrix affect: eachOtherBlock

	[ aMatrix hasDimension: self dimension ] assert.
	self putWithIndices: [ :row :column |
		eachOtherBlock value: (self at: row and: column) value: (aMatrix at: row and: column)
	].