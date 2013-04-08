testing
testProfileContents3
	arFile := self arlequinFileClass new.
	arFile profileSection
		addTitle: 'Titulo de Prueba' translated;
		addSampleNumber: 1;
		addDataType: 'DNA';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	self assert: (arFile contents isKindOf: String).
	self assert: arFile contents = self profileSample1