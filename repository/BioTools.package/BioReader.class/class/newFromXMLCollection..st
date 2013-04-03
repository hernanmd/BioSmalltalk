instance creation
newFromXMLCollection: xmlCollection
	" Answer a Collection of readers iterating over the XML Strings at aCollectionOfXMLs "

	^ xmlCollection collect: [ : string | self newFromXML: string ]