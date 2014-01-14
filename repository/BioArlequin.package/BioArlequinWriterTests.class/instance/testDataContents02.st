testing
testDataContents02
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Sample Title' translated;
		addSampleNumber: 1;
		addDataType: 'DNA';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	arFile newSamplesSection
		addSampleName: '"BOVINOS"';
		addSampleSize: '8';
		addSampleData: self sequenceSample3;
		addSampleName: '"TEST2"';
		addSampleSize: '8';
		addSampleData: self sequenceSample3;
		yourself.
	self assert: (arFile contents isKindOf: String)