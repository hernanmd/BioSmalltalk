graphing
subgraph: anObject do: aBlock

	| subgraph |
	subgraph := currentGraphReceiver addNewSubgraph: anObject.
	currentGraphReceiver := subgraph.
		
	[aBlock value] ensure: [currentGraphReceiver := self]