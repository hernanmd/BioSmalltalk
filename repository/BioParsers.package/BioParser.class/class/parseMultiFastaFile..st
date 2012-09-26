parse-fasta
parseMultiFastaFile: aFastaFullFileLocation
	" Parser aFastaString representing a MultiFASTA sequence.
	Answer a FastaMultiRecord object "
	
	^ ( BioFASTAMultiParser on: ( self openFullFileNamed: aFastaFullFileLocation ) contents ) parse