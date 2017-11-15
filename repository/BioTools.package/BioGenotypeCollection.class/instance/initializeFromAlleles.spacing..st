initialization
initializeFromAlleles: aString spacing: aCharacter
	" Private - See class instance creation comment "

	self genotypes: (self collectionClass new: (aString size / 2) rounded).
	(aString findTokens: aCharacter)
		pairsDo: [ : a : b |
			self genotypes add: (BioGenotype new
				alleleA: a;
				alleleB: b;
				yourself) ]