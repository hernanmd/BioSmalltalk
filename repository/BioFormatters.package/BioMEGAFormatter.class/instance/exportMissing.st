exporting
exportMissing
	" Write the receiver's missing setting "
	
	self stream
		nextPutAll: 'Missing=';
		nextPut: self missing;
		space