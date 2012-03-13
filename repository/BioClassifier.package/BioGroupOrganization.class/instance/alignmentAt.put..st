proof
alignmentAt: accession put: sequenceString

	self contents detect: [: classificationGroup | 
		| found |
		found := classificationGroup 
					detect: [: classification | ( classification at: 'GBSeq_accession-version' ) = accession ] 
					ifNone: [ nil ].
		found 
			ifNotNil: [ found at: 'GBSeq_alignment' put: sequenceString ] ]
	ifNone: [ self halt. ]