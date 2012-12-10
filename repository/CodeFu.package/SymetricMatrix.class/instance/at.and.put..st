accessing
at: row and: column put: aNumber

	^row < column 
		ifTrue: [ (partialColumns at: column) at: row put: aNumber ]
		ifFalse: [ (partialColumns at: row) at: column put: aNumber ]