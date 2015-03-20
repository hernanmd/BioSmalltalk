instance creation
parseAmbiguousWithSeparators: aSequenceString
	" Parse aSequenceString containing an ambiguous sequence "
	
	^ ( BioAmbiguousBaseParser on: aSequenceString ) parseWithSeparators