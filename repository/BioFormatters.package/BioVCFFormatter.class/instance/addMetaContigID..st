accessing - meta - contig
addMetaContigID: contigStringID
	" Add the contig line (not required) "

	self stream
		nextPutAll: '##contig=<ID=';
		nextPutAll: contigStringID;
		nextPut: $>;
		bioCr
		