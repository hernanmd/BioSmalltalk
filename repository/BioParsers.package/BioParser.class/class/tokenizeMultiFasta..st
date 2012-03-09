instance creation
tokenizeMultiFasta: aString
	" Tokenize aString representing a MultiFASTA sequence "
	
	^ ( BioFASTAMultiParser on: aString ) tokenize