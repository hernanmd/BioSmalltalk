accessing - meta
addMetaSampleID: stringID genomes: genomesIDCollection mixture: mixtureIDCollection description: descriptionCollection
	" Add sample to genome mappings as shown below: 
	##SAMPLE=<ID=S_ID,Genomes=G1_ID;G2_ID; ...;GK_ID,Mixture=N1;N2; ...;NK,Description=S1;S2; ...;SK>
	
	genomeIDCollection, mixtureIDCollection and descriptionCollection should be a <Collection> of <String> "

	self stream
		nextPutAll: '##SAMPLE=<ID=';
		nextPutAll: stringID;
		nextPutAll: ',Genomes=';
		nextPutAll: (genomesIDCollection joinUsing: $;);
		nextPutAll: ',Mixture=';
		nextPutAll: (mixtureIDCollection joinUsing: $;);
		nextPutAll: ',Description=';
		nextPutAll: (descriptionCollection joinUsing: $;);
		nextPut: $>;		
		bioCr