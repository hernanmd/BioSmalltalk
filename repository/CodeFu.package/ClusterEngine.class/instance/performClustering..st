clustering
performClustering: linkageSelector

	| data |
	data := ClusteringData onDistanceSquare: distanceMatrix.
	data performClustering: linkageSelector.
	^dendrogram := data dendrogram