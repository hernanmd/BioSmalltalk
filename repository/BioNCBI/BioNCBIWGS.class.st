"
Represents the WGS (Whole Genome Shotgun) database in the NCBI system.
"
Class {
	#name : 'BioNCBIWGS',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIWGS class >> dbName [

	^ 'wgs'
]

{ #category : 'accessing' }
BioNCBIWGS class >> description [

	^ 'Whole-genome shotgun reads: ' , self dbName
]
