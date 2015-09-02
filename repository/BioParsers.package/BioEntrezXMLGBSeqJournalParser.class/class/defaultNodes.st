accessing
defaultNodes

	^ { #qualifierForAccessionWithVersion .
	#qualifierForAuthor .
	#qualifierForXRefId .
	#qualifierForReferenceJournal } collect: [ : selector | BioGBSeqCollection perform: selector ]
