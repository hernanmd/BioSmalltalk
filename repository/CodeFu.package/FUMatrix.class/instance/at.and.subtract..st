arithmetic
at: row and: column subtract: aNumber
	"Subtract aNumber from the element at row and column.  Answer the difference."

	^self at: row and: column put: ((self at: row and: column) - aNumber)