Class {
	#name : #BioNCBIDBSTS,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIDBSTS class >> dbName [

	^ 'dbsts'
]

{ #category : #accessing }
BioNCBIDBSTS class >> description [

	^ 'Sequence tagged sites: ' , self dbName
]
