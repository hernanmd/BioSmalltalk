testing
testDataContents01
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Sample Title' translated;
		addSampleNumber: 1;
		addDataType: 'FREQUENCY';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	arFile dataSection sampleSubsection
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
	self
		assert:
			arFile contents
				=
					'[Profile]
	Title="Sample Title"
	NbSamples=1
	DataType=FREQUENCY
	GenotypicData=1
	LocusSeparator=WHITESPACE

[Data]
[[Samples]]
	SampleName="Tharu"
	SampleSize=91
	SampleData={
1 48 
8 2 
9 5 
13 23 
28 2 
47 2 
48 2 
49 1 
50 1 
51 1 
52 2 
53 1 
54 1 }
	SampleName="Oriental"
	SampleSize=46
	SampleData={
1 32 
6 1 
8 2 
9 4 
12 2 
13 2 
27 1 
28 1 
29 1 }
	SampleName="Wolof"
	SampleSize=110
	SampleData={
1 23 
2 39 
7 29 
10 2 
27 2 
39 5 
52 2 
64 2 
65 1 
66 1 
67 1 
68 2 
71 1 }'