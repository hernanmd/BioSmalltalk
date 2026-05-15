"
Represents the Protein database in the NCBI Entrez system. Provides access to protein sequence records with protein-specific qualifiers.
"
Class {
	#name : 'BioEntrezProtein',
	#superclass : 'BioESeqCommonDb',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezProtein class >> dbName [
	" See superimplementor's comment "
	
	^ 'protein'

]

{ #category : 'accessing' }
BioEntrezProtein >> setGp [
	" Set the receiver's retrieval type to GenPept report format "
	
	self retrievalType: 'gp'
]

{ #category : 'accessing' }
BioEntrezProtein >> setGpc [
	" Set the receiver's retrieval type to INSDSeq structured flat file format "
	
	self retrievalType: 'gpc'
]
