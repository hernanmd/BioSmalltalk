accessing - meta
addMetaSource: sourceString
	" Add the source line "

	self stream
		nextPutAll: '##source=';
		nextPutAll: sourceString;
		bioCr
		