instance creation
newFromCSVFile: csvContents
	" Answer a new instance of the receiver with XML contents from xmlCollection "
	
	^ self withAll: (self readerClass newFromXMLCollection: csvContents).