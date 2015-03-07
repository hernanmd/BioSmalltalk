accessing
test01ParseBasic

	| results current |
	
	results := BioParser parseNcbiXmlGBSeq: self gbSet01.
	self assert: results size = 1.
	current := results first.
	self assert: (current at: BioGBSeqCollection qualifierForAccessionWithVersion) = 'HQ184032.1'.
	self assert: (current at: BioGBSeqCollection qualifierForDefinition) = 'Bos taurus isolate Chi597 mitochondrion, complete genome'.
	self assert: (current at: BioGBSeqCollection qualifierForReferenceJournal) =  'Submitted (25-AUG-2010) Dipartimento di Genetica e Microbiologia, University of Pavia, Via Ferrata, 1, Pavia 27100, Italy'