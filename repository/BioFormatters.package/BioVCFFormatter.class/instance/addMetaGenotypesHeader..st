accessing - meta
addMetaGenotypesHeader: sampleNames
	" Add the genotype names header line "

	self stream
		nextPutAll: 'FORMAT';
		tab.
	sampleNames do: [ : sampleName |
		self stream 	
				nextPutAll: sampleName;
				tab ].
	self stream
		back;
		bioCr
