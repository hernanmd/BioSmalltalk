arithmetic
at: row and: column multiply: aNumber
	"Multiply aNumber with the element at row and column.  Answer the product."

	^self at: row and: column put: ((self at: row and: column) * aNumber)