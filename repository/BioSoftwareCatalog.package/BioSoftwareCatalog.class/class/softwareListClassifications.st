accessing
softwareListClassifications
	" Answer a <Collection> of <BioSoftwareItem> "
	
	^ (self initializeClassifications reject: #isEmpty) asSortedCollection 
	