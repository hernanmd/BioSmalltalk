accessing
parseXMLDocumentsFrom: aDataSource
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ((BioGBSeqCollection filesFromXMLDirectory: aDataSource) 
			parser: self parser;
			parseDocuments)