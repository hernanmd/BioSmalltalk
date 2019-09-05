Class {
	#name : #BioNCBIPDB,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIPDB class >> dbName [

	^ 'pdb'
]

{ #category : #accessing }
BioNCBIPDB class >> description [

	^ 'Protein Data Bank: ' , self dbName
]
