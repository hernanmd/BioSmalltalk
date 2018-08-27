sections-profile
profileSample2

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="Fake HLA data"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=4';
			nextPutTerminator;
			nextPutAll: '	GenotypicData=1';
			nextPutTerminator;
			nextPutAll: '	GameticPhase=0';
			nextPutTerminator ]