accessing - meta
addMetaPedigreeNames: pedigreeNameCollection
	" Add record relationships between genomes. 
	##PEDIGREE=<Name_0=G0-ID,Name_1=G1-ID,...,Name_N=GN-ID>
	
	genomeIDCollection, mixtureIDCollection and descriptionCollection should be a <Collection> of <String> "

	self stream nextPutAll: '##PEDIGREE=<'.
	pedigreeNameCollection doWithIndex: [ : pName : index |
		self stream 	
				nextPutAll: 'Name_';
				nextPutAll: (index - 1) asString;
				nextPutAll: pName;
				nextPut: $, ].
	self stream
		back;
		nextPut: $>;		
		bioCr