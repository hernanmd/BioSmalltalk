enumerating
with: aMatrix collect: eachOtherBlock

	| newMatrix |
	[ aMatrix hasDimension: self dimension ] assert.
	newMatrix := self copyEmpty: self dimension.
	newMatrix putWithIndices: [ :row :column |
		eachOtherBlock value: (self at: row and: column) value: (aMatrix at: row and: column)
	].
	^newMatrix