sections-profile
profileSample1

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="Titulo de Prueba"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=1';
			nextPutTerminator;
			nextPutAll: '	DataType=DNA';
			nextPutTerminator;			
			nextPutAll: '	GenotypicData=1';
			nextPutTerminator;
			nextPutAll: '	LocusSeparator=WHITESPACE';
			nextPutTerminator ]
