"
Abstract class to group common querying properties

Fields taken from https://www.ncbi.nlm.nih.gov/books/NBK49540/
"
Class {
	#name : #BioESSGSSDb,
	#superclass : #BioESeqCommonDb,
	#category : 'BioEntrez-Databases'
}

{ #category : #'accessing - qualifiers' }
BioESSGSSDb >> qualifierForCloneID [
	" Answer a <String> qualifier. The clone identifier provided by the submitter of the EST or GSS records "

	^ '[Clone ID]'
]

{ #category : #'accessing - qualifiers' }
BioESSGSSDb >> qualifierForSubmitterName [
	" Answer a <String> qualifier. Submitter name of EST and GSS records. Unlike [Author Name], the Submitter Name content is not controlled and is verbatim from the EST or GSS record "

	^ '[Submitter Name]'
]
