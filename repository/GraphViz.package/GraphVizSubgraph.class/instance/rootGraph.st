accessing
rootGraph

	^ parent isSubgraph
		ifTrue: [parent rootGraph]
		ifFalse: [parent]