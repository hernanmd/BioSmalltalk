"
Client for PDBe PISA interfaces data. Extends BioDBObject with methods to access protein-protein interface predictions.
"
Class {
	#name : 'BioPDBePISAInterfaces',
	#superclass : 'BioDBObject',
	#category : 'BioEBI-PDBePISA',
	#package : 'BioEBI',
	#tag : 'PDBePISA'
}

{ #category : 'accessing' }
BioPDBePISAInterfaces class >> dbName [
	" See superimplementor's comment "
	
	^ 'interfaces.pisa'

]

{ #category : 'accessing' }
BioPDBePISAInterfaces >> idCollectionClass [

	^ BioPDBePISACollection
]

{ #category : 'accessing' }
BioPDBePISAInterfaces >> pdbCodes: aCollection [
	" Set the receiver PDB codes "

	(self idCollectionClass withAll: aCollection asLowercase) addParametersTo: self client.

]
