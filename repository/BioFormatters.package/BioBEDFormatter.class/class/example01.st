examples
example01
	" Example writing one track "
	
	| bedFormatter chrString peaks |
	
	chrString := 'chr12'.
	peaks := { 131838 . 1498174 . 1598174 . 1698174 }.
	bedFormatter := BioBEDFormatter new
		outputFilename: 'Test1.bed';
		addCTrackName: 'Test Track';
		addCTrackVisibility: 2;
		setItemRgbOn;
		dumpHeaders;
		yourself.
	peaks pairsDo: [ : s : e |
		bedFormatter 
			addCFChr: chrString start: s end: e ;
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator ].
	bedFormatter flush.
