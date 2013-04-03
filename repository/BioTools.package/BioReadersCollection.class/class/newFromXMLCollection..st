instance creation
newFromXMLCollection: xmlCollection
	" Answer a new instance of the receiver with XML contents from xmlCollection "
	
	^ self withAll: (self readerClass newFromXMLCollection: xmlCollection).