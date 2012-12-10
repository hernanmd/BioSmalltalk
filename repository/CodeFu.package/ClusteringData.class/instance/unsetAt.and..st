private
unsetAt: row and: column

	^row < column 
		ifTrue: [ (partialColumns at: column) unsetAt: row ]
		ifFalse: [ (partialColumns at: row) unsetAt: column ]