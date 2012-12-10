actions
performSeriation

	| clusty newOrder |
	clusty := ClusterEngine withDistanceMatrix: self.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	dendrogram := clusty dendrogram.
	newOrder := self dendrogram orderLeafs asArray.
	self rearrange: newOrder.