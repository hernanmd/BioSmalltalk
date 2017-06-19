private
dumpAsEnsembleBedFile

	| chrStr |
	
	chrStr := 'chr' , self chrNumber asString.
	self bedFormatter
		outputFilename: self outputFilename;
		addCTrackName: chrStr;
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders.
	self dumpUCSCBedPeaks: chrStr