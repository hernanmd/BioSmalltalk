instance creation
tokenizeAmbiguousWithoutSeparators: aSequenceString
	" Tokenize aString containing an ambiguous sequence without separators, i.e. [ACT] "
	
	^ ( BioAmbiguousBaseParser on: aSequenceString ) tokenizeWithoutSeparators