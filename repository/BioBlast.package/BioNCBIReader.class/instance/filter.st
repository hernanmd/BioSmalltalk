accessing filters
filter
	" Answer a filterer for selecting specific results from the receiver "
	
	^ ( self filters isEmpty not and: [ self hasCumulativeFilter ] )
		ifFalse: [ self filterClass newFromReader: self ]
		ifTrue: [ self lastCumulativeFilter ]