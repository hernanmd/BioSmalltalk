exporting
exportIndel
	" Write the receiver's indel setting "
	
	self stream
		nextPutAll: 'Indel=';
		nextPut: self indel;
		space.