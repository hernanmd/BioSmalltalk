testing
test03PutSettings

	| cmd |
	
	cmd := self ncbiClient nucleotide
			query: '555';
			hitListSize: 10;
			filterLowComplexity;
			expectValue: 10;
			blastn;
			blastPlainService.
	self assert: cmd client downloadUrl = 'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555&HITLIST_SIZE=10&FILTER=L&EXPECT=10&PROGRAM=blastn&SERVICE=plain'.
