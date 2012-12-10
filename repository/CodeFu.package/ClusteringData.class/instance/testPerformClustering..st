private
testPerformClustering: linkageSelector

	(indices size - 1) timesRepeat: [
		IncrementNotification signalWith: indices size.
	 	self testFindMinimum.
		self perform: linkageSelector ].
	^self dendrogram