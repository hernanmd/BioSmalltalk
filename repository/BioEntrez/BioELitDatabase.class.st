Class {
	#name : #BioELitDatabase,
	#superclass : #BioERetDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #actions }
BioELitDatabase >> fetch [
	" Answer the result of the command applied on the receiver "

	^ self client fetchLiterature
]
