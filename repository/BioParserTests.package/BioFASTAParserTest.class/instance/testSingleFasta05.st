testing-tokenizer
testSingleFasta05

	self assert: ( ( self parserClass tokenizeFasta: self fastaSeq05 ) bioHasEqualElements: #('>YAL068C-7235.2170 Putative promoter sequence' 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA') ).