testing
testLetterAnnotations

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	seqRecord letterAnnotations: ( Dictionary new at: 'phredQuality' put: #(20 30 50 10); yourself ).
	
	self assert: ( seqRecord letterAnnotations isKindOf: Dictionary ).
	self assert: seqRecord letterAnnotations size = 1.
	self assert: ( ( seqRecord letterAnnotations at: 'phredQuality' ) isKindOf: Collection ).
	self assert: ( seqRecord letterAnnotationsAt: 'phredQuality' ) = #(20 30 50 10).
	
	seqRecord letterAnnotationsAt: 'testAnnotation' put: 'abcd'.
	self assert: seqRecord letterAnnotations size = 2.
	self assert: ( ( seqRecord letterAnnotationsAt: 'testAnnotation' ) isKindOf: Collection ).
	self assert: ( seqRecord letterAnnotationsAt: 'testAnnotation' ) = 'abcd'.
	
	self should: [ seqRecord letterAnnotationsAt: 'unmatchedLengthSequence' put: #(20 50 40) ] 		raise: BioErrorSpecificationObject.
	self should: [ seqRecord letterAnnotationsAt: 'unmatchedLengthSequence' put: #(20 50 40 78 43) ] 	raise: BioErrorSpecificationObject.
	self should: [ seqRecord letterAnnotationsAt: 'unmatchedLengthSequence' put: 'seqString' ]		raise: BioErrorSpecificationObject.
	
	seqRecord removeLetterAnnotationsAt: 'testAnnotation'.
	self assert: seqRecord letterAnnotations size = 1.
	self should: [ seqRecord letterAnnotationsAt: 'testAnnotation' ] 									raise: Error.	
										
	seqRecord removeLetterAnnotations.
	self assert: ( seqRecord letterAnnotations isKindOf: Dictionary ).
	self assert: seqRecord letterAnnotations size = 0.