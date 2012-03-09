accessing
parseXMLDocumentsFrom: aDataSource
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ( self nodesCollectionClass filesFromXMLDirectory: aDataSource ) parseDocuments