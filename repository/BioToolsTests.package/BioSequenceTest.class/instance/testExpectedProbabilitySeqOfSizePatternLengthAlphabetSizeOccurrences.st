testing
testExpectedProbabilitySeqOfSizePatternLengthAlphabetSizeOccurrences

	" What is the expected number of occurrences of a 9-mer in 500 sequences, each of length 1000? 
	Assume that the sequences are formed by selecting each nucleotide (A, C, G, T) with the same probability (0.25). "
	self assert: (BioSequence expected: 500 probabilitySeqOfSize: 1000 patternLength: 9 alphabetSize: 4 occurrences: 1) equals: 1.89208984375