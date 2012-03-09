instance creation
parseMultiFasta: aFastaString
	" Parser aFastaString representing a MultiFASTA sequence.
	Answer a FastaMultiRecord object "
	
	^ ( BioFASTAMultiParser on: aFastaString ) parse