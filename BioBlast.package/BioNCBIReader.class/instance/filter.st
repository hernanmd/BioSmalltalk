accessing filters
filter
	" Answer a filterer for selecting specific results from the receiver "
	
	^ ( self filters notEmpty and: [ self hasCumulativeFilter ] )
		ifFalse: [ self filterClass newFromReader: self ]
		ifTrue: [ self lastCumulativeFilter ]