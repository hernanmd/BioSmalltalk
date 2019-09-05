Class {
	#name : #BioEntrezEST,
	#superclass : #BioESSGSSDb,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezEST class >> dbName [
	" See superimplementor's comment "
	
	^ 'nucest'

]

{ #category : #'accessing - qualifiers' }
BioEntrezEST >> qualifierForESTId [
	" Answer a <String> qualifier. Legacy dbEST unique identifier provided by NCBI "

	^ '[EST ID]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezEST >> qualifierForESTName [
	" Answer a <String> qualifier. The name given to the EST record by the submitters "

	^ '[EST Name]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezEST >> qualifierForLibraryName [
	" Answer a <String> qualifier. The name given to the cDNA library that is the source of the clone, provided by the submitter and taken verbatim from the record. May contain useful information about the cell, tissue, or organ source. "

	^ '[Library Name]'
]

{ #category : #accessing }
BioEntrezEST >> setEst [
	" Set the receiver's retrieval type to EST Report format "
	
	self retrievalType: 'est'
]
