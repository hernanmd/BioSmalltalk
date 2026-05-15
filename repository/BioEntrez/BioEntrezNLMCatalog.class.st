"
Represents the NLM Catalog database in the NCBI Entrez system. Provides access to National Library of Medicine catalog records.
"
Class {
	#name : 'BioEntrezNLMCatalog',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezNLMCatalog class >> dbName [
	" See superimplementor's comment "
	
	^ 'nlmcatalog'

]
