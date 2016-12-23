accessing
chromosomes
	" Answer a <Collection> of <BioChromosome> for the receiver "

	^ chromosomes
		ifNil: [ chromosomes := self collectionClass new ]