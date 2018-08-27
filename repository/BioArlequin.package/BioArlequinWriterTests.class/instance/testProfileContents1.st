tests
testProfileContents1

	arFile := self arlequinFileClass new.
	arFile newProfileSection
		at: 'Title' put: 'mtDNA sequences Old Type';
		at: 'NbSamples' put: '1';
		at: 'GenotypicData' put: '0';
		yourself.
	self assert: arFile contents equals: self profileSample3.