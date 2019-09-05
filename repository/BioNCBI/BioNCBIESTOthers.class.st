Class {
	#name : #BioNCBIESTOthers,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIESTOthers class >> dbName [

	^ 'est_others'
]

{ #category : #accessing }
BioNCBIESTOthers class >> description [

	^ 'Non-human, non-mouse ESTs: ' , self dbName
]
