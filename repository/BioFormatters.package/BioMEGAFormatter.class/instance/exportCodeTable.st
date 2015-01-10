exporting
exportCodeTable
	" Write the receiver's code table setting "
	
	self stream
		nextPutAll: 'CodeTable=';
		nextPut: self codeTable