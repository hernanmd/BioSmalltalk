tests
testProfileContents3

	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Titulo de Prueba' translated;
		addSampleNumber: 1;
		addDataType: 'DNA';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	self assert: (arFile contents isKindOf: String).
	self assert: arFile contents equals: self profileSample1