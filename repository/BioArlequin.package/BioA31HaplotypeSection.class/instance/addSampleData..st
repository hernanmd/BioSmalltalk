private
addSampleData: aSampleCollection
	" Add aSampleCollection to the receiver "

	self iniFile 
		section: self class notation
		at: self class haplotypeListId
		put: aSampleCollection.
