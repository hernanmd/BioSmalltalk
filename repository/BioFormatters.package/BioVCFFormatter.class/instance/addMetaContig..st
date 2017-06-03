accessing - meta
addMetaContig: contigString
	" Add the contig line (not required) "

	self stream
		nextPutAll: '##contig=';
		nextPutAll: contigString;
		bioCr
		