accessing
edges
	" Answer the number of edges in the receiver's graph "
	
	^ self graph
		inject: 0
		into: [ : sum : edge | sum + edge size ]