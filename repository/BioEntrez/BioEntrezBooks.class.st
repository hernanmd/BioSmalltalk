"
Represents the Books database in the NCBI Entrez system. Provides access toNCBI Bookshelf records.
"
Class {
	#name : 'BioEntrezBooks',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezBooks class >> dbName [
	" See superimplementor's comment "
	
	^ 'books'

]
