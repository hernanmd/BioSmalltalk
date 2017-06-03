accessing - meta
addMetaFilter: filterIdString description: descriptionString
	" Add the filter line "

	self stream
		nextPutAll: '##FILTER=<ID=';
		nextPutAll: filterIdString;
		nextPutAll: ',Description=';
		nextPutAll: descriptionString;
		nextPut: $>;		
		bioCr
