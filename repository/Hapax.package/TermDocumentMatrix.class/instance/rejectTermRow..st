removing
rejectTermRow: aBlock

	| keep |
	keep := OrderedCollection new: matrix rowSize.
	matrix rows doWithIndex: [ :row :index || term |
		term := (termMap atKey: index).
		(aBlock value: term value: row) 
			ifFalse: [ keep add: term -> row ]
	].
	keep := keep collectAssocations.
	matrix := SparseRowMatrix onRows: keep value.
	termMap := BidirectionalMap withIndicesAndElements: keep key.