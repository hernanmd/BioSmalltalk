accessing-adapters
validAdapters
	" Answer a Collection with all the subclasses for which there is a provider installed in this system "
	
	^ self allSubclasses select: #providerIsAvailable