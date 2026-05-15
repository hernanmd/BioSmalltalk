"
Represents the environmental sample nucleotide (env_nt) database in the NCBI system.
"
Class {
	#name : 'BioNCBIEnvNT',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIEnvNT class >> dbName [

	^ 'env_nt'
]

{ #category : 'accessing' }
BioNCBIEnvNT class >> description [

	^ 'Environmental samples: ' , self dbName
]
