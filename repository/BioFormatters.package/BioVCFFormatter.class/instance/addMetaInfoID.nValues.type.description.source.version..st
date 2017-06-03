accessing - meta - info
addMetaInfoID: stringID nValues: nValInteger type: stringType description: descriptionString source: sourceString version: versionString
	" Add info line (not required) "

	self stream
		nextPutAll: '##INFO=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Number=';
		nextPutAll: nValInteger asString;
		nextPutAll: ',Type=';		
		nextPutAll: stringType;		
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		nextPutAll: ',Source=';
		nextPutAll: sourceString;
		nextPutAll: ',Version=';
		nextPutAll: versionString;
		nextPut: $>;		
		bioCr.
