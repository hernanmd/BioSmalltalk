examples
example1

	| fastaFile |
	
	fastaFile := ''.
	^ BioACANAWrapper new
			runAcana;
			inSeqFile: fastaFile;
			execute.