enumerating
do: aBlock

	self withIndices: [ :row :column | aBlock value: (self at: row and: column) ].
	^self