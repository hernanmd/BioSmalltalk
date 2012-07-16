accessing
hspMidLines
	" Answer a filter with the receiver's HSP identity nodes "

	| collection |
	
	collection := self hits collect: [: node | node hspMidLines ].
	^ self addFilteredResultsFrom: collection