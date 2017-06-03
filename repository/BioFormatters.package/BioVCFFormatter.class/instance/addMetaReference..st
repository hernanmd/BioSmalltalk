accessing - meta
addMetaReference: refString
	" Add the reference line "

	self stream
		nextPutAll: '##reference=';
		nextPutAll: refString;
		bioCr
		