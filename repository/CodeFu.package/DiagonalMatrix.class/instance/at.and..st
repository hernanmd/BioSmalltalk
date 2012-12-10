accessing
at: row and: column 

	^row = column 
		ifTrue: [ partialColumns at: column ]	
		ifFalse: [ 0 ]