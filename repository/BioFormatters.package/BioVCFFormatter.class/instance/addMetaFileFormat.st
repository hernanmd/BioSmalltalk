accessing - meta
addMetaFileFormat
	" Add the required first line "

	self stream
		nextPutAll: '##fileformat=';
		nextPutAll: self formatVersion;
		bioCr
		