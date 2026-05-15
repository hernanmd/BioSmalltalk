"
Represents the MeSH (Medical Subject Headings) database in the NCBI Entrez system. Provides access to controlled vocabulary thesaurus records.
"
Class {
	#name : 'BioEntrezMeSH',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezMeSH class >> dbName [
	" See superimplementor's comment "
	
	^ 'mesh'

]
