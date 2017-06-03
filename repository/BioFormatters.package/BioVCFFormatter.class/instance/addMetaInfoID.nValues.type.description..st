accessing - meta - info
addMetaInfoID: stringID nValues: nValInteger type: stringType description: descriptionString
	" Add the contig line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=';		
		nextPutAll: stringType;
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPut: $>;		
		bioCr