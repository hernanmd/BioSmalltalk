accessing
parseXMLDocumentsFromDirectory: aDataSource
	" Parse documents located at aDataSource and update the receiver's contents with the result "
	
	[ self validateXMLDataSource: aDataSource ]
	on: BioErrorSpecificationObject 
	do: [ : ex | ^ self contents: BioGBSeqCollection new ].
	self contents: ((BioGBSeqCollection filesFromXMLDirectory: aDataSource) 
			parser: self parser;
			parseDocuments)