accessing
nodesCollectionClass

	^ nodesCollectionClass
		ifNil: [ nodesCollectionClass := BioGBSeqCollection ]