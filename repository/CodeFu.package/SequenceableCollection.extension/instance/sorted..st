*codefu
sorted: aBlock
	| sortedVersion |
	sortedVersion := self copy.
	SequenceableCollectionSorter sort: sortedVersion using: aBlock.
	^sortedVersion.