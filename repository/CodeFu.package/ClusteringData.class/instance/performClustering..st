clustering
performClustering: linkageSelector

	(indices size - 1) timesRepeat: [
		IncrementNotification signalWith: indices size.
	 	self findMinimum.
		self perform: linkageSelector ].
	^self dendrogram