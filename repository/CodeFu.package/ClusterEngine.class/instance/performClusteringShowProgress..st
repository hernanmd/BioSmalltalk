clustering
performClusteringShowProgress: linkageSelector

	 self performClustering: linkageSelector.
"	Notice 
		showProgress: ('Clustering <1p> items, please wait.' expandMacrosWith: distanceMatrix columnSize)
		complete: (distanceMatrix columnSize * (distanceMatrix columnSize - 1)) / 2
		while: [ self performClustering: linkageSelector ]
		title: 'Clustering'."

	"IncrementNotification signalWith: numberOfTicks"