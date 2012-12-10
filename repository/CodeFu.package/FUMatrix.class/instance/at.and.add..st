arithmetic
at: row and: column add: aNumber
	"Add aNumber to the element at row and column.  Answer the sum."

	^self at: row and: column put: ((self at: row and: column) + aNumber)