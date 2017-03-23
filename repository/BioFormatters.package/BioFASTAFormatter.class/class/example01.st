examples
example01
	" The following example shows how to create a collection of fasta records and write them to a FASTA timestamped file "

	| myFASTAWriter fastaCollection |
	fastaCollection := BioFastaMultiRecord new.
	fastaCollection sequences
		add: (BioFastaRecord named: 'seqA' sequence: 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCA');
		add: (BioFastaRecord named: 'seqB' sequence: 'CAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGA');
		add: (BioFastaRecord named: 'seqC' sequence: 'GAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA
TAATATGCCTATGCCGCATAATTTTTATATCTTTCTCCTAACAAAACATTCGCTTGTAAA');
		yourself.
	myFASTAWriter := BioFASTAFormatter new.
	myFASTAWriter exportFrom: fastaCollection sequences.