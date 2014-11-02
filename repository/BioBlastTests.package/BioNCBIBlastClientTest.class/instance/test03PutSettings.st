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
	self assert: (cmd tokenizeParameters includes: 'DATABASE=nr').
	self assert: (cmd tokenizeParameters includes: 'QUERY=555').
	self assert: (cmd tokenizeParameters includes: 'HITLIST_SIZE=10').
	self assert: (cmd tokenizeParameters includes: 'FILTER=L').
	self assert: (cmd tokenizeParameters includes: 'EXPECT=10').
	self assert: (cmd tokenizeParameters includes: 'PROGRAM=blastn').
	self assert: (cmd tokenizeParameters includes: 'SERVICE=plain').

