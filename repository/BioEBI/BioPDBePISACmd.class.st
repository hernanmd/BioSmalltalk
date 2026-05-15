"
Command object for PDBe PISA (Protein Interfaces Surfaces and Assemblies) API requests. Extends BioCommandObject with PISA-specific access methods.
"
Class {
	#name : 'BioPDBePISACmd',
	#superclass : 'BioCommandObject',
	#category : 'BioEBI-PDBePISA',
	#package : 'BioEBI',
	#tag : 'PDBePISA'
}

{ #category : 'accessing' }
BioPDBePISACmd >> execute [
	"Execute the receiving action. Answer a BioInitialResult "

	^ self client execute

]
