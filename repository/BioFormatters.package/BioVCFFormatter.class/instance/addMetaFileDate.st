accessing - meta
addMetaFileDate
	" Add the date line "

	self stream
		nextPutAll: '##filedate=';
		nextPutAll: self fileDate;
		bioCr
		