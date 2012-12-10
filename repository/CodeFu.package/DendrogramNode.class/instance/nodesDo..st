enumerating
nodesDo: aBlock

	aBlock value: self.
	left nodesDo: aBlock.
	right nodesDo: aBlock.