accessing-dna
dnaInterleaveLineTokenizer

	^ ( self dnaInterleaveSequenceTokenizer , #newline asParser ) star