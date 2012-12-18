instance creation
newFromXMLCollection: aCollectionOfXMLs
	" Answer a Collection of readers iterating over the XML Strings at aCollectionOfXMLs "

	^ aCollectionOfXMLs	collect: [: string | self newFromXML: string ]