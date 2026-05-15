"
Represents the Protein Clusters database in the NCBI Entrez system. Provides access to protein cluster (conserved domain) records.
"
Class {
	#name : 'BioEntrezProteinClusters',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezProteinClusters class >> dbName [
	" See superimplementor's comment "
	
	^ 'proteinclusters'

]
