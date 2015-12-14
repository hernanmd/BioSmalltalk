examples
example1

	| fastaFile |
	
	fastaFile := (self testFilesFullDirectoryName / 'acana' / 'acana_test.fa') fullName.
	^ BioACANAWrapper new
			runAcana;
			inSeqFile: fastaFile;
			execute.