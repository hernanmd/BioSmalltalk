accessing
parseFlatDocumentsFrom: aDataSource
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ( self nodesCollectionClass filesFromFlatDirectory: aDataSource ) parseDocuments