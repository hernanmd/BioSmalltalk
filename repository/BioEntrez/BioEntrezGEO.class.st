"
Represents the GEO (Gene Expression Omnibus) database in the NCBI Entrez system. Provides access to gene expression profiles.
"
Class {
	#name : 'BioEntrezGEO',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezGEO class >> dbName [
	" See superimplementor's comment "
	
	^ 'geo'

]
