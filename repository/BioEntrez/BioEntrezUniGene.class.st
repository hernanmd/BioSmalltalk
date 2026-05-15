"
Represents the UniGene database in the NCBI Entrez system. Provides access to gene-oriented sequence cluster records.
"
Class {
	#name : 'BioEntrezUniGene',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezUniGene class >> dbName [
	" See superimplementor's comment "
	
	^ 'unigene'

]
