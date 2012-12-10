private
findMinimum
	"This method is written such that it uses primitives only."

	| columnVector |
	value := Float infinity .
	2 to: indices size do: [ :column |
		columnVector := (partialColumns at: (indices at: column)).
		columnVector min < value ifTrue: [
			value := columnVector min.
			foundB0 := (indices at: column).
			foundA0 := columnVector found.
		].
	].