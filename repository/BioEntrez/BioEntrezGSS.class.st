Class {
	#name : #BioEntrezGSS,
	#superclass : #BioESSGSSDb,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezGSS class >> dbName [
	" See superimplementor's comment "
	
	^ 'nucgss'

]

{ #category : #'accessing - qualifiers' }
BioEntrezGSS >> qualifierForGSSId [
	" Answer a <String> qualifier. Legacy dbGSS unique identifier provided by NCBI. "

	^ '[GSS ID]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezGSS >> qualifierForGSSName [
	" Answer a <String> qualifier. The name given to the GSS record by the submitters "

	^ '[GSS Name]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezGSS >> qualifierForLibraryClass [
	" Answer a <String> qualifier. Legacy dbGSS unique identifier provided by NCBI. "

	^ '[Library Class]'
]

{ #category : #accessing }
BioEntrezGSS >> setGss [
	" Set the receiver's retrieval type to GSS Report format "
	
	self retrievalType: 'gss'
]
