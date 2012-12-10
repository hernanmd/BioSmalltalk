enumerating
collect: aBlock

	| newMatrix |
	newMatrix := self copyEmpty.
	self withIndices: [ :row :column |
		newMatrix at: row and: column put: (aBlock value: (self at: row and: column))
	].
	^newMatrix