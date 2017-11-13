accessing
genotypes

	^ genotypes
		ifNil: [ genotypes := self collectionClass new ]