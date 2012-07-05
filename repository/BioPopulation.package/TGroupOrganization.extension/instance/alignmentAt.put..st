*biopopulation
alignmentAt: accession put: sequenceString

	| found cls |
	
	found := self contents 
				detect: [: classificationGroup |
					cls := classificationGroup classifications
								detect: [: classification | ( classification at: 'GBSeq_accession-version' ) = accession ] 
								ifNone: [ nil ].
					cls isNil not ]
				ifNone: [ nil ].
	found 
		ifNotNil: [
			cls at: 'GBSeq_alignment' put: sequenceString. ]
