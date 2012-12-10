accessing
at: row and: column

	^row < column 
		ifTrue: [ (partialColumns at: column) at: row ]
		ifFalse: [ (partialColumns at: row) at: column ]