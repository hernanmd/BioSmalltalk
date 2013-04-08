accessing
buildDNASample: params title: groupTitle

	| bioA31SamplesSection |
	
	bioA31SamplesSection := self sampleSubsection.
	bioA31SamplesSection
			addSampleName: groupTitle;
			addSampleSize: params frequenciesSize;	
			addSampleData: (BioA31SampleCollection forDNA
					identifiers: params identifiers;
					frequencies: params frequencies;
					sequences: params sequences
					yourself);
			yourself.