exporting
exportDataType
		
	self stream
		nextPutAll: 'DataType=';
		nextPutAll: self formatType;
		space 