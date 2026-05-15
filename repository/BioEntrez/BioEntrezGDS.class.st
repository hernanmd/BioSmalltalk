"
Represents the GEO DataSets database in the NCBI Entrez system. Provides access to gene expression and hybridization data sets.
"
Class {
	#name : 'BioEntrezGDS',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezGDS class >> dbName [
	" See superimplementor's comment "
	
	^ 'gds'

]
