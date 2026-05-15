"
Represents alternative EST database entries in NCBI for EST division-specific queries.
"
Class {
	#name : 'BioNCBIESTOthers',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIESTOthers class >> dbName [

	^ 'est_others'
]

{ #category : 'accessing' }
BioNCBIESTOthers class >> description [

	^ 'Non-human, non-mouse ESTs: ' , self dbName
]
