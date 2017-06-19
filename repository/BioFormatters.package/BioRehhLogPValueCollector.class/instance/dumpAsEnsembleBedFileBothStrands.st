private
dumpAsEnsembleBedFileBothStrands

	| chrStr index |
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter 
		outputFilename: self outputFilename;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		addCTrackColorByStrand: { 100 . 50 . 25 . 150 . 200 . 250 };
		setItemRgbOn;
		dumpHeaders.
	index := 1.
	self gpeaks pairsDo: [ : s : e |
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFName: 'PR_' , index asString;			
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator.
		index := index + 1.			
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFName: 'PR_' , index asString;			
			addCFScore: 960;
			addCFStrand: $-;
			nextPutTerminator.
		index := index + 1 ].
	self bedFormatter flush.