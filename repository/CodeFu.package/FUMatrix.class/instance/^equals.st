comparing
= matrix 
	"Answer whether the dimension of the receiver is the same as otherMatrix' dimension,
	and each of the receiver's elements equal the corresponding element of otherMatrix."
	^ self == matrix or: 
		[ (matrix isKindOf: FUMatrix) and: 
			[ (matrix hasDimension: self dimension) and: 
				[ self 
					with: matrix
					do: [ : a : b | a = b ifFalse: [ ^ false ] ].
				true ] ] ]