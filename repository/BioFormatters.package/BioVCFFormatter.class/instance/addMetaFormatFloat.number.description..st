accessing - meta -format
addMetaFormatFloat: formatIdString number: aNumber description: descriptionString
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=Float';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr
