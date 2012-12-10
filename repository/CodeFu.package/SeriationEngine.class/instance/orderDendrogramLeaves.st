algorithm
orderDendrogramLeaves

	| clusty |
	clusty := ClusterEngine with: elements.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	^clusty dendrogram orderLeafs asArray.