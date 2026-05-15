"
Represents the PubChem BioAssay database in the NCBI Entrez system. Provides access to bioactivity screening records.
"
Class {
	#name : 'BioEntrezPCAssay',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezPCAssay class >> dbName [
	" See superimplementor's comment "
	
	^ 'pcassay'

]
