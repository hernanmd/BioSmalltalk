accessing
at: row and: column

	^array at: ((row - 1) * self columnSize) + column