accessing - meta
addMetaFixedHeader
	" Add the header line "

	self stream
		nextPutAll: '#CHROM';
		tab;
		nextPutAll: 'POS';
		tab;
		nextPutAll: 'ID';
		tab;
		nextPutAll: 'REF';
		tab;
		nextPutAll: 'ALT';
		tab;
		nextPutAll: 'QUAL';
		tab;
		nextPutAll: 'FILTER';
		tab;
		nextPutAll: 'INFO'
		