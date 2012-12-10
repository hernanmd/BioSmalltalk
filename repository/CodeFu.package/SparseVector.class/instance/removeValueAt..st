private
removeValueAt: anIndex

	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0 
		ifTrue: [ contents removeIndex: spot ].