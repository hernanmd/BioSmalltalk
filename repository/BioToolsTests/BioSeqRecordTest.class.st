Class {
	#name : #BioSeqRecordTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'seqRecord'
	],
	#category : 'BioToolsTests-Core'
}

{ #category : #testing }
BioSeqRecordTest >> testAnnotations [

	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'ACGT').
	seqRecord annotations: (Dictionary new at: 'evidence' put: 'Invented evidence'; yourself).
	
	self assert: (seqRecord annotations isKindOf: Dictionary).
	self assert: seqRecord annotations size equals: 1.
	self assert: (seqRecord annotations at: 'evidence') equals: 'Invented evidence'.
	self should: [ seqRecord annotations at: 'invalidAnnKey' ] raise: Exception.
	self should: [ seqRecord annotations at: 1 ] raise: Exception.
	
	seqRecord annotations at: 'newEvidence' put: 'New invented evidence'.
	self assert: seqRecord annotations size equals: 2.
	self assert: (seqRecord annotations at: 'newEvidence') equals: 'New invented evidence'.

	seqRecord annotations at: 'evidence' put: 'more new evidence'.
	self assert: seqRecord annotations size equals: 2.
	self assert: (seqRecord annotations at: 'evidence') equals: 'more new evidence'.

	seqRecord removeAnnotationsAt: 'newEvidence'.
	self assert: seqRecord annotations size equals: 1.
	self should: [ seqRecord annotations at: 'newEvidence' ] raise: Error.	
										
	seqRecord removeAnnotations.
	self assert: (seqRecord annotations isKindOf: Dictionary).
	self assert: seqRecord annotations size equals: 0.

	seqRecord annotations: (Dictionary new at: 'evidence' put: 'New evidence'; yourself).
	self assert: (seqRecord annotations isKindOf: Dictionary).
	self assert: seqRecord annotations size equals: 1.
	self assert: (seqRecord annotations at: 'evidence') equals: 'New evidence'.
	
]

{ #category : #testing }
BioSeqRecordTest >> testAnnotationsClass [

	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'ACGT').
	seqRecord annotations: (Dictionary new at: 'evidence' put: 'Invented evidence'; yourself).
	
	self assert: (seqRecord annotationsClass isKindOf: Behavior).
	
]

{ #category : #testing }
BioSeqRecordTest >> testCopySeqFrom [

	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'MKQHKAMIVALIVICITAVVAALVTRKDLCEVHIRTGQTEVAVF').
	seqRecord
		id: 'YP_025292.1';
		description: 'toxic membrane protein'.
	
	self assert: ((seqRecord copySeqFrom: 9) isKindOf: BioSeqRecord).
	self assert: seqRecord sequence asString equals: 'VALIVICITAVVAALVTRKDLCEVHIRTGQTEVAVF'

]

{ #category : #testing }
BioSeqRecordTest >> testCopySeqTo [

	| editedSeqRecord |
	
	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'MKQHKAMIVALIVICITAVVAALVTRKDLCEVHIRTGQTEVAVF').
	seqRecord
		id: 'YP_025292.1';
		description: 'toxic membrane protein'.
	
	editedSeqRecord := seqRecord copySeqTo: 9.
	self assert: (editedSeqRecord isKindOf: BioSeqRecord).
	self assert: seqRecord sequence asString equals: 'MKQHKAMIV'

]

{ #category : #testing }
BioSeqRecordTest >> testCreate [

	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'ACGT').
	
	self assert: (seqRecord isKindOf: BioSeqRecord).
	self assert: (seqRecord sequence isKindOf: BioSequence).
	self assert: seqRecord sequence asString equals: 'ACGT'.
	self assert: seqRecord id equals: seqRecord nullName.
	
	seqRecord := BioSeqRecord new: (BioUnknownSeq new: 20).
	
	self assert: (seqRecord sequence isKindOf: BioUnknownSeq).
	self assert: seqRecord sequence size equals: 20.
	self assert: seqRecord sequence asString equals: 'NNNNNNNNNNNNNNNNNNNN'.
	
]

{ #category : #testing }
BioSeqRecordTest >> testEquality [

	| tmpSeqRecord |
	
	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).

	self assert: ( seqRecord isKindOf: BioSeqRecord ).
	self assert: ( seqRecord sequence isKindOf: BioSequence ).
	self assert: seqRecord sequence asString = 'ACGT'.

	tmpSeqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACTG' ).
	self deny: tmpSeqRecord = seqRecord description: 'Test different sequence'.
	
	tmpSeqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	tmpSeqRecord id: 'Test2'.
	self deny: tmpSeqRecord = seqRecord description: 'Test different id'.
]

{ #category : #testing }
BioSeqRecordTest >> testLetterAnnotations [

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
]

{ #category : #testing }
BioSeqRecordTest >> testSequence [

	seqRecord := BioSeqRecord new: ( BioSequence newDNA: 'ACGT' ).
	self assert: seqRecord sequence asString = 'ACGT'.
	seqRecord sequence: 'tcga'.
	self assert: seqRecord sequence asString = 'tcga'.
]

{ #category : #testing }
BioSeqRecordTest >> testSetIdAndDescription [

	seqRecord := BioSeqRecord new: (BioSequence newDNA: 'ACGT').
	seqRecord 
		id: 'AC12345';
		description: 'Made up sequence record description'.
	
	self assert: (seqRecord id isKindOf: String).
	self assert: seqRecord id = 'AC12345'.
	self assert: (seqRecord description isKindOf: String).
	self assert: seqRecord description = 'Made up sequence record description'.
	
	seqRecord
		id: String empty;
		description: String empty.

	self assert: (seqRecord id isKindOf: String).
	self assert: seqRecord id = String empty.
	self assert: (seqRecord description isKindOf: String).
	self assert: seqRecord description = String empty.
	
]
