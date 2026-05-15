"
Represents the Journals database in the NCBI Entrez system. Provides access to journal records indexed in NCBI.
"
Class {
	#name : 'BioEntrezJournals',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezJournals class >> dbName [
	" See superimplementor's comment "
	
	^ 'journals'

]
