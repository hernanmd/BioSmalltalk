accessing
partitionMatrix

	^partitionMatrix ifNil: [self reinitializePartitionMatrix]