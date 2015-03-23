accessing
parseFlatDocumentsFrom: aDataSource
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	self contents: ((BioGBSeqCollection filesFromFlatDirectory: aDataSource) 
			parser: self classifier parserClass;
			parseDocuments)