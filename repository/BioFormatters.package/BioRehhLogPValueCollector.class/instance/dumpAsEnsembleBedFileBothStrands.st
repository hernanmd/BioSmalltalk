private
dumpAsEnsembleBedFileBothStrands

	| chrStr |
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter 
		outputFilename: self outputFilename;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		addCTrackColorByStrand: { 100 . 50 . 25 . 150 . 200 . 250 };
		setItemRgbOn;
		dumpHeaders.
	self gpeaks pairsDo: [ : s : e |
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator.
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFScore: 960;
			addCFStrand: $-;
			nextPutTerminator ].
	self bedFormatter flush.