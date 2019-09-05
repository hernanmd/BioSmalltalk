Class {
	#name : #BioEntrezTaxonomy,
	#superclass : #BioERetDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezTaxonomy class >> dbName [
	" See superimplementor's comment "
	
	^ 'taxonomy'

]

{ #category : #actions }
BioEntrezTaxonomy >> fetch [
	" Answer the result of the command applied on the receiver "

	^ self client fetchTaxonomy
]
