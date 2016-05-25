accessing
softwareListClassifications
	" Answer a <Collection> of <BioSoftwareItem> "
	
	^ (self classifications reject: #isEmpty) asSortedCollection 
	