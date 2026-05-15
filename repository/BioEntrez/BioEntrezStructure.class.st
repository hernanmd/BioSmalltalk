"
Represents the Structure (Molecular Modeling Database) in the NCBI Entrez system. Provides access to 3D macromolecular structure records.
"
Class {
	#name : 'BioEntrezStructure',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezStructure class >> dbName [
	" See superimplementor's comment "
	
	^ 'structure'

]
