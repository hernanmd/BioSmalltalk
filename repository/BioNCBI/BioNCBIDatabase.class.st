"
Abstract base class for NCBI database objects. Extends BioDBObject with NCBI-specific database representation.
"
Class {
	#name : 'BioNCBIDatabase',
	#superclass : 'BioDBObject',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIDatabase class >> databaseNames [
	" self databaseNames "
	
	^ self subclasses collect: [ : cls | cls dbName ].

]
