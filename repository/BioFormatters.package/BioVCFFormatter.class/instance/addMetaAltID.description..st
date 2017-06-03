accessing - meta
addMetaAltID: stringID description: descriptionString
	" Add the Alternative allele eld format "

	self deny: (stringID includesAnyOf: String space).
	self stream
		nextPutAll: '##ALT=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Description=';
		nextPutAll: (descriptionString surroundedBy: $");
		bioCr