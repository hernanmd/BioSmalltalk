accessing - meta -format
addMetaFormatInteger: formatIdString number: aNumber description: descriptionString
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=Integer';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr
