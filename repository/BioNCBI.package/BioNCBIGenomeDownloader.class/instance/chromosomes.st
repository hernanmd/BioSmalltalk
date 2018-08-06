accessing
chromosomes
	" Answer a <Collection> of <String> each one representing a chromosome name to download "

	^ chromosomes
		ifNil: [ chromosomes := self defaultChromosomes ]
