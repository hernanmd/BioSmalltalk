samples
addSampleData: aSampleCollection
	" Add aSampleCollection to the receiver "

	self iniFile 
		section: self sampleKeyNumber
		at: self class sampleDataId key
		put: aSampleCollection.

