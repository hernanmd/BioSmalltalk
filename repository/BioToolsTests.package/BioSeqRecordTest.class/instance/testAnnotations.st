testing
testAnnotations

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	seqRecord annotations: ( Dictionary new at: 'evidence' put: 'Invented evidence'; yourself ).
	
	self assert: ( seqRecord annotations isKindOf: Dictionary ).
	self assert: seqRecord annotations size = 1.
	self assert: ( seqRecord annotations at: 'evidence' ) = 'Invented evidence'.
	self should: [ seqRecord annotations at: 'invalidAnnKey' ] raise: Exception.
	self should: [ seqRecord annotations at: 1 ] raise: Exception.
	
	seqRecord annotations at: 'newEvidence' put: 'New invented evidence'.
	self assert: seqRecord annotations size = 2.
	self assert: ( seqRecord annotations at: 'newEvidence' ) = 'New invented evidence'.

	seqRecord annotations at: 'evidence' put: 'more new evidence'.
	self assert: seqRecord annotations size = 2.
	self assert: ( seqRecord annotations at: 'evidence' ) = 'more new evidence'.

	seqRecord removeAnnotationsAt: 'newEvidence'.
	self assert: seqRecord annotations size = 1.
	self should: [ seqRecord annotations at: 'newEvidence' ] raise: Error.	
										
	seqRecord removeAnnotations.
	self assert: ( seqRecord annotations isKindOf: Dictionary ).
	self assert: seqRecord annotations size = 0.

	seqRecord annotations: ( Dictionary new at: 'evidence' put: 'New evidence'; yourself ).
	self assert: ( seqRecord annotations isKindOf: Dictionary ).
	self assert: seqRecord annotations size = 1.
	self assert: ( seqRecord annotations at: 'evidence' ) = 'New evidence'.
	