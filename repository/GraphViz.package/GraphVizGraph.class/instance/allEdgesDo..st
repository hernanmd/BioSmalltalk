enumerating
allEdgesDo: aBlock

	self edges do: aBlock.
	self subgraphs do: [:each | each allEdgesDo: aBlock]