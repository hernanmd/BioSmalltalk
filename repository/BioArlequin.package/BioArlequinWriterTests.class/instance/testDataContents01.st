testing
testDataContents01
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Sample Title' translated;
		addSampleNumber: 1;
		addDataType: 'FREQUENCY';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	arFile newDataSection sampleSubsection
		addSampleName: 'Tharu';
		addSampleSize: '91';
		addSampleData: self frequency01Sample01;
		addSampleName: 'Oriental';
		addSampleSize: '46';
		addSampleData: self frequency01Sample02;
		addSampleName: 'Wolof';
		addSampleSize: '110';
		addSampleData: self frequency01Sample03;
		yourself.
	self assert: (arFile contents isKindOf: String).
	"self assert: arFile contents equals: self profileSample4."