Class {
	#name : #BioPDBePISACmd,
	#superclass : #BioCommandObject,
	#category : 'BioEBI-PDBePISA'
}

{ #category : #accessing }
BioPDBePISACmd >> execute [
	"Execute the receiving action. Answer a BioInitialResult "

	^ self client execute

]
