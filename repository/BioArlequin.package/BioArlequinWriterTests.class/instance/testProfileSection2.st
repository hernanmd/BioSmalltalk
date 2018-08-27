testing
testProfileSection2
	
	arFile := self arlequinFileClass new.
	arFile newProfileSection 
			at: 'Title' put: 'Fake HLA data';
			at: 'NbSamples' put: '4';
			at: 'GenotypicData' put: '1';
			at: 'GameticPhase' put: '0';
			yourself.

	self assert: arFile contents equals: self profileSample2.
	self assert: ((arFile section: 'Profile') at: 'Title') equals: 'Fake HLA data'.
	self assert: ((arFile section: 'Profile') at: 'NbSamples') equals: '4'.
	self assert: ((arFile section: 'Profile') at: 'GenotypicData') equals: '1'.
	self assert: ((arFile section: 'Profile') at: 'GameticPhase') equals: '0'.