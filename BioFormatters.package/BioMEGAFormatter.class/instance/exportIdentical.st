exporting
exportIdentical
	" Write the receiver's identical setting "
	
	self stream
		nextPutAll: 'Identical=';
		nextPut: self identical