Class {
	#name : #BioNCBIEnvNT,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIEnvNT class >> dbName [

	^ 'env_nt'
]

{ #category : #accessing }
BioNCBIEnvNT class >> description [

	^ 'Environmental samples: ' , self dbName
]
