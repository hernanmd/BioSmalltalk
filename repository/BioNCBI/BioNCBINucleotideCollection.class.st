Class {
	#name : #BioNCBINucleotideCollection,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBINucleotideCollection class >> dbName [

	^ 'nr'
]

{ #category : #accessing }
BioNCBINucleotideCollection class >> description [

	^ 'Nucleotide collection (nr/nt)'
]
