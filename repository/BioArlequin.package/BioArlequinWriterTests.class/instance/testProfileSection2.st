testing
testProfileSection2
	
	arFile := self arlequinFileClass new.
	arFile newProfileSection 
			at: 'Title' put: 'Fake HLA data';
			at: 'NbSamples' put: '4';
			at: 'GenotypicData' put: '1';
			at: 'GameticPhase' put: '0';
			yourself.

	self assert: arFile contents = self profileSample2.
	self assert: ((arFile section: 'Profile') at: 'Title') = 'Fake HLA data'.
	self assert: ((arFile section: 'Profile') at: 'NbSamples') = '4'.
	self assert: ((arFile section: 'Profile') at: 'GenotypicData') = '1'.
	self assert: ((arFile section: 'Profile') at: 'GameticPhase') = '0'.