accessing
parserNodes
	" See superimplementor's comment "

	^ { #qualifierForAccessionWithVersion .
	#qualifierForAuthor .
	#qualifierForDefinition .
	#qualifierForReferenceJournal } collect: [ : selector | BioGBSeqCollection perform: selector ]
