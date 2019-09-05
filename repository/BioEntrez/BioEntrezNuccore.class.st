"
The Nucleotide Database
"
Class {
	#name : #BioEntrezNuccore,
	#superclass : #BioESeqCommonDb,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezNuccore class >> databaseNames [
	" See superimplementor's comment "
	
	^ #('nuccore' 'nr' 'nt')

]

{ #category : #accessing }
BioEntrezNuccore class >> dbName [
	" See superimplementor's comment "
	
	^ 'nuccore'

]

{ #category : #accessing }
BioEntrezNuccore class >> description [

	^ 'Nucleotide collection (nr/nt)'
]

{ #category : #'accessing public' }
BioEntrezNuccore >> setGb [
	" Set the receiver's retrieval type to GenBank GBSeq XML "
	
	self retrievalType: 'gb'
]

{ #category : #'accessing public' }
BioEntrezNuccore >> setGbc [
	" Set the receiver's retrieval type to INSDSeq XML "
	
	self retrievalType: 'gbc'
]
