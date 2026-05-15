"
An Entrez literature database. Provides actions specific to literature search databases such as PubMed.
"
Class {
	#name : 'BioELitDatabase',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'actions' }
BioELitDatabase >> fetch [
	" Answer the result of the command applied on the receiver "

	^ self client fetchLiterature
]
