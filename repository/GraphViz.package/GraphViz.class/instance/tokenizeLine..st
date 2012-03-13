layout
tokenizeLine: line

	| tokens tokenSoFar insideQuote |
	tokens := OrderedCollection new.
	tokenSoFar := ''.
	insideQuote := false.
	
	line do:
		[:char |
		char = $" ifTrue: [insideQuote := insideQuote not].
		tokenSoFar := (char = Character space and: [insideQuote not])
			ifTrue: [tokenSoFar isEmpty ifFalse: [tokens add: tokenSoFar]. String new]
			ifFalse: [tokenSoFar, char asString]].
	
	tokenSoFar isEmpty ifFalse: [tokens add: tokenSoFar].
	^ tokens collect: [:each | (each beginsWith: '"') ifTrue: [each allButFirst allButLast] ifFalse: [each]]