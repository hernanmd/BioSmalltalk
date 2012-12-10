initialize-release
reinitializePartitionMatrix
	| topics clusters color |
	clusters := self dendrogram breakAtThreshold: self threshold negated.
	topics := clusters collect: [:each | Topic in: self withAll: each].

	color := self defaultColors readStream.
	topics do: [ :topic | topic color: color next ].

	^partitionMatrix := CorrelationSquare on: topics