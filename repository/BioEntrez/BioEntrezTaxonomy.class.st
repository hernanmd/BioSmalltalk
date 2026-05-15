"
Represents the Taxonomy database in the NCBI Entrez system. Provides access to organism taxonomy records and supports taxonomy-specific actions.
"
Class {
	#name : 'BioEntrezTaxonomy',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezTaxonomy class >> dbName [
	" See superimplementor's comment "
	
	^ 'taxonomy'

]

{ #category : 'actions' }
BioEntrezTaxonomy >> fetch [
	" Answer the result of the command applied on the receiver "

	^ self client fetchTaxonomy
]
