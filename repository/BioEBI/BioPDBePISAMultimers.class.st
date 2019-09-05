Class {
	#name : #BioPDBePISAMultimers,
	#superclass : #BioDBObject,
	#category : 'BioEBI-PDBePISA'
}

{ #category : #accessing }
BioPDBePISAMultimers class >> dbName [
	" See superimplementor's comment "
	
	^ 'multimers.pisa'

]

{ #category : #accessing }
BioPDBePISAMultimers >> idCollectionClass [

	^ BioPDBePISACollection
]

{ #category : #accessing }
BioPDBePISAMultimers >> pdbCodes: aCollection [
	" Set the receiver PDB codes "

	(self idCollectionClass withAll: aCollection asLowercase) addParametersTo: self client.

]
