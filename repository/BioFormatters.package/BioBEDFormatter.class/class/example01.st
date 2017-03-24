examples
example01
	" Example writing one track "
	
	| bedFormatter |
	
	bedFormatter := BioBEDFormatter new
		outputFilename: 'Test1.bed';
		addCTrackName: 'Test Track';
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders;
		yourself.
	
	13 to: 15 do: [ : chrNum | 
		self gpeaks pairsDo: [ : s : e |
			bedFormatter 
				addCFChr: chrNum asString start: s third end: e third;
				addCFScore: 960;
				addCFStrand: $+;
				nextPutTerminator ] ].

	bedFormatter flush.

	bedFormatter 