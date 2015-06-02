private
addSampleData: aSampleCollection
	" Add aSampleCollection to the receiver "

	self iniFile 
		section: self class notation
		at: ''
		put: aSampleCollection.
