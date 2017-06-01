exporting
exportNumberOfSynonymsWithSequences
	" Write the receiver's number of synonyms "
	
	self stream
		nextPutAll: 'NTaxa=';
		nextPutAll: self numberOfSynonymsWithSequences asString