testing-tokenizer
testSingleFasta04

	self assert: (( self parserClass tokenizeFasta: self fastaSeq04 ) bioHasEqualElements: #('>YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA')).