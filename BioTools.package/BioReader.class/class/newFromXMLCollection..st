instance creation
newFromXMLCollection: xmlCollection
	" Answer a Collection of readers iterating over the XML Strings at aCollectionOfXMLs "

	^ xmlCollection collect: [ : rsObject | self newFromXML: rsObject  result]