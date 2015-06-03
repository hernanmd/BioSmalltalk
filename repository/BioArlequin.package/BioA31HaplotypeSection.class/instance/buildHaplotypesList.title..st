accessing
buildHaplotypesList: params title: groupTitle

	^ BioA31SampleCollection forDNA
		iniFile: self iniFile;
		identifiers: params identifiers;
		sequences: params haplotypeSequences;
		yourself
