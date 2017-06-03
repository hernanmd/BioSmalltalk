accessing - meta
addMetaPedigreeDB: pedigreeDBUrl
	" Add record relationships between genomes as link to pedigreeDBUrl "

	self stream 
		nextPutAll: '##pedigreeDB=<';
		nextPutAll: pedigreeDBUrl; 
		nextPut: $>;		
		bioCr