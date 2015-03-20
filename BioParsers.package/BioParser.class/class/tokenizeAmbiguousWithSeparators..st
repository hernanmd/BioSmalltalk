instance creation
tokenizeAmbiguousWithSeparators: aSequenceString
	" Tokenize aString containing an ambiguous sequence delimited with separators, i.e. [A/C/T] "
	
	^ (BioAmbiguousBaseParser on: aSequenceString) tokenizeWithSeparators