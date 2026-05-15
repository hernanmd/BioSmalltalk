"
Represents the PDB (Protein Data Bank) database in the NCBI system.
"
Class {
	#name : 'BioNCBIPDB',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIPDB class >> dbName [

	^ 'pdb'
]

{ #category : 'accessing' }
BioNCBIPDB class >> description [

	^ 'Protein Data Bank: ' , self dbName
]
