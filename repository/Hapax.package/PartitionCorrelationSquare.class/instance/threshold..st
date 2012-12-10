accessing
threshold: aNumber

	threshold := aNumber.
	aNumber ifNotNil: [ self reinitializePartitionMatrix ].
	^aNumber