accessing - meta -format
addMetaFormat: formatIdString number: aNumber type: typeString description: descriptionString
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=';
		nextPutAll: typeString;
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		bioCr
