"
Represents the Entrez Web Site database in the NCBI Entrez system. Provides access to Entrez web-linkable resources.
"
Class {
	#name : 'BioEntrezWebSite',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezWebSite class >> dbName [
	" See superimplementor's comment "
	
	^ 'ncbisearch'

]
