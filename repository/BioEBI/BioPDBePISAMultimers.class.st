"
Client for PDBe PISA multimer data. Extends BioDBObject with methods to access protein assembly multimer predictions.
"
Class {
	#name : 'BioPDBePISAMultimers',
	#superclass : 'BioDBObject',
	#category : 'BioEBI-PDBePISA',
	#package : 'BioEBI',
	#tag : 'PDBePISA'
}

{ #category : 'accessing' }
BioPDBePISAMultimers class >> dbName [
	" See superimplementor's comment "
	
	^ 'multimers.pisa'

]

{ #category : 'accessing' }
BioPDBePISAMultimers >> idCollectionClass [

	^ BioPDBePISACollection
]

{ #category : 'accessing' }
BioPDBePISAMultimers >> pdbCodes: aCollection [
	" Set the receiver PDB codes "

	(self idCollectionClass withAll: aCollection asLowercase) addParametersTo: self client.

]
