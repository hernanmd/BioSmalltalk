accessing-private
dnaInterleaveLineTokenizer

	^ ( self dnaInterleaveSequenceTokenizer , #newline asParser ) star