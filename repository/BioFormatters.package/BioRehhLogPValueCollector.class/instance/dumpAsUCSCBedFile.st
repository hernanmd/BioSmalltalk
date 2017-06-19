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
	self dumpUCSCBedPeaks: chrStr