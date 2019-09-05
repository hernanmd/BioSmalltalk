Class {
	#name : #BioNCBIDatabase,
	#superclass : #BioDBObject,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIDatabase class >> databaseNames [
	" self databaseNames "
	
	^ self subclasses collect: [ : cls | cls dbName ].

]
