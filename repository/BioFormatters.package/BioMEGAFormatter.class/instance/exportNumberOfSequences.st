exporting
exportNumberOfSequences
	" Write the receiver's number of sequences "
	
	self stream
		nextPutAll: 'NSeqs=';
		nextPutAll: self numberOfSequences asString