initialization
initializeFromAlleles: aCollection
	" Private - See class instance creation comment "

	self genotypes: (self collectionClass new: aCollection size).
	self genotypes addAll: (self findAllelesFrom: aCollection)