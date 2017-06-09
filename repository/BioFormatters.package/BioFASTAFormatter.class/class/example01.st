examples
example01
	" The following example shows how to create a collection of fasta records and write them to a FASTA timestamped file "

	| fastaCollection |
	fastaCollection := BioFastaMultiRecord new
		addFastaRecord: (BioFastaRecord named: 'seqA' sequence: 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCA');
		addFastaRecord: (BioFastaRecord named: 'seqB' sequence: 'CAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGA');
		addFastaRecord: (BioFastaRecord named: 'seqC' sequence: 'GAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA
TAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAA');
		yourself.
	BioFASTAFormatter new exportFrom: fastaCollection sequences.