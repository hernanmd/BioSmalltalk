"
Represents the Conserved Domains database in the NCBI Entrez system. Provides access to conserved protein domain records.
"
Class {
	#name : 'BioEntrezConservedDomains',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezConservedDomains class >> dbName [
	" See superimplementor's comment "
	
	^ 'cdd'

]
