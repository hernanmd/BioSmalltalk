examples
example2

	| fastaFile |
	
	fastaFile := ''.
	^ BioACANAWrapper new
			runAcana2;
			inSeqFile: fastaFile;
			execute.
