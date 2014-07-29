accessing
parseXMLDocumentsFromCollection: aCollection
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ((BioGBSeqCollection newFromXMLCollection: aCollection) 
			parser: self parser;
			parseDocuments)