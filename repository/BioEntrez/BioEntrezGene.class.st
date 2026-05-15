"
Represents the Gene database in the NCBI Entrez system. Provides access to gene-centered information records.
"
Class {
	#name : 'BioEntrezGene',
	#superclass : 'BioESeqDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezGene class >> dbName [
	" See superimplementor's comment "
	
	^ 'gene'

]
