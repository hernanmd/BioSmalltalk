accumulate
enumerate: aMatrix atAll: rowIndices andAll: columnIndices

	rowIndices do: [ :row |
		columnIndices do: [ :column |
			self accumulate: (aMatrix at: row and: column) ] ].
	^value