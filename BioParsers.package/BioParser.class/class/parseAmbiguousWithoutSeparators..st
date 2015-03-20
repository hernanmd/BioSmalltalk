instance creation
parseAmbiguousWithoutSeparators: aSequenceString
	" Parse aSequenceString containing an ambiguous sequence "
	
	^ ( BioAmbiguousBaseParser on: aSequenceString ) parseWithoutSeparators