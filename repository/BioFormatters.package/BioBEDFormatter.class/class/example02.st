examples
example02
	" Example writing multiple tracks "
	
	| bedFormatter track1 track2 |
	
	track1 := self testFilesFullDirectoryName / '1E-5_Track1.tsv'.
	track2 := self testFilesFullDirectoryName / '1E-5_Track2.tsv'.

	bedFormatter := BioBEDFormatter new
		outputFilename: '1E-5.bed';
		yourself.
		
	bedFormatter	
		addCTrackName: 'ER';
		addCTrackDescription: 'estrogen receptor ChIP-chip';
		addCTrackColor: { 150 . 50 . 150 };
		dumpCTrack;
		yourself.
	
	 track1 readStreamDo: [ : stream | 
		(NeoCSVReader on: stream)
			separator: Character tab;		
			do: [ : r | 
				bedFormatter 
					addCFChr: r first start: r second end: r third;
					addCFName: r fourth;
					nextPutTerminator ] ].

	bedFormatter	
		addCTrackName: 'Pol';
		addCTrackDescription: 'polymerase II ChIP-chip';
		addCTrackColor: { 50 . 100 . 50 };
		dumpCTrack;
		yourself.
		
	track2 readStreamDo: [ : stream | 
		(NeoCSVReader on: stream)
			separator: Character tab;		
			do: [ : r | 
				bedFormatter 
					addCFChr: r first start: r second end: r third;
					addCFName: r fourth;
					nextPutTerminator ] ].
	bedFormatter flush.
