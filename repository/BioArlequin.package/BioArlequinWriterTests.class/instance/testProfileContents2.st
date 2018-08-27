tests
testProfileContents2
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'mtDNA sequences Old Type' translated;
		addSampleNumber: '1';
		unsetGenotypicData;
		yourself.
	self assert: arFile contents equals: self profileSample3.