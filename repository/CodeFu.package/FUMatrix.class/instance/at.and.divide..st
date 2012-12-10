arithmetic
at: row and: column divide: aNumber
	"Divide the element at row and column by aNumber.  Answer the quotient."

	^self at: row and: column put: ((self at: row and: column) / aNumber)