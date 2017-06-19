private
dumpAsUCSCBedFile

	| chrStr |
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter 
		outputFilename: self outputFilename;
		setCTrackBrowserShowAll;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders.
	self gpeaks pairsDo: [ : s : e |
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator ].
	self bedFormatter flush.