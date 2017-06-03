accessing - meta -format
addMetaFormatString: formatIdString number: aNumber description: descriptionString
	" Add the filter line "

	self stream
		nextPutAll: '##FORMAT=<ID=';
		nextPutAll: formatIdString;
		nextPutAll: ',Number=';
		nextPutAll: aNumber asString;
		nextPutAll: ',Type=String';
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		bioCr
