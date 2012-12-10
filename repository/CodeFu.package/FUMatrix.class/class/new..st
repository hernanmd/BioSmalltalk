instance creation
new: numberOrPoint
	"Create a new square matrix with the given dimension."

	| point |
	point := numberOrPoint asPoint.
	^self rows: point x columns: point y