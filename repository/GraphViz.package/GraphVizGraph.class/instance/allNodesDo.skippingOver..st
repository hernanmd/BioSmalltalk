private
allNodesDo: aBlock skippingOver: nodeList

	| effectiveNodes |
	effectiveNodes := nodes reject: [:each | nodeList includes: each].	
	effectiveNodes valuesDo: aBlock.
	
	nodeList addAll: effectiveNodes.
	self subgraphs do: [:each | each allNodesDo: aBlock skippingOver: nodeList]