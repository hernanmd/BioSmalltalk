accessing
genes
	" Answer a <Collection> of <BioGene> "

	^ genes
		ifNil: [ genes := OrderedCollection new ]