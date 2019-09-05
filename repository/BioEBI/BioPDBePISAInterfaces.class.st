Class {
	#name : #BioPDBePISAInterfaces,
	#superclass : #BioDBObject,
	#category : 'BioEBI-PDBePISA'
}

{ #category : #accessing }
BioPDBePISAInterfaces class >> dbName [
	" See superimplementor's comment "
	
	^ 'interfaces.pisa'

]

{ #category : #accessing }
BioPDBePISAInterfaces >> idCollectionClass [

	^ BioPDBePISACollection
]

{ #category : #accessing }
BioPDBePISAInterfaces >> pdbCodes: aCollection [
	" Set the receiver PDB codes "

	(self idCollectionClass withAll: aCollection asLowercase) addParametersTo: self client.

]
