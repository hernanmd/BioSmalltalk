private
dumpUCSCBedPeaks: chrStr

	| index |
	index := 1.
	self gpeaks pairsDo: [ : s : e |
		self bedFormatter 
			addCFChr: chrStr start: s third end: e third;
			addCFName: 'PR_' , index asString;
			addCFScore: 960;
			addCFStrand: $+;
			nextPutTerminator.
		index := index + 1 ].
	self bedFormatter flush.