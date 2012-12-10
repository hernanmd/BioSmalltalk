accessing
at: row and: column put: aNumber

	^array at: ((row - 1) * self columnSize) + column put: aNumber