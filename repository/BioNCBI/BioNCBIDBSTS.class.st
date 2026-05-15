"
Represents the dbSTS (Database of Sequence Tagged Sites) in the NCBI system. Provides access to STS marker records.
"
Class {
	#name : 'BioNCBIDBSTS',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIDBSTS class >> dbName [

	^ 'dbsts'
]

{ #category : 'accessing' }
BioNCBIDBSTS class >> description [

	^ 'Sequence tagged sites: ' , self dbName
]
