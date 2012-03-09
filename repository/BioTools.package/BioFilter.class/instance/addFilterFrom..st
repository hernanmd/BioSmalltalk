accessing
addFilterFrom: collection
	" Private -  Create a new result from aCollection and link the receiver to its reader "
	
	| filterResult |
	
	self gtLog: 'Filtering...'.
	filterResult := self newFilteredResult: collection.
	self isCumulativeFilter
		ifFalse: [ 
			self contents ifNotNil: [ self gtLog: 'Updating previous filtered result...' ].
			self contents: filterResult.
			self reader addFilter: self ]
		ifTrue: [ 
			| newFilter |
			( newFilter := self class newFromReader: self reader ) contents: filterResult.
			self reader addFilter: newFilter ].
	^ filterResult