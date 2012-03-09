instance creation
newFromXMLCollection: aCollectionOfXMLs
	" Answer a new instance of the receiver with XML contents
	from aCollectionOfXMLs "
	
	^ self withAll: ( self readerClass newFromXMLCollection: aCollectionOfXMLs ).