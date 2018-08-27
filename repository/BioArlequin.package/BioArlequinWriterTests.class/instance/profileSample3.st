as yet unclassified
profileSample3

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="mtDNA sequences Old Type"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=1';
			nextPutTerminator;
			nextPutAll: '	GenotypicData=0';
			nextPutTerminator ]
