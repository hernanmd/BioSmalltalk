"
Represents the PubChem Compound database in the NCBI Entrez system. Provides access to chemical compound records.
"
Class {
	#name : 'BioEntrezPCCompound',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezPCCompound class >> dbName [
	" See superimplementor's comment "
	
	^ 'pccompound'

]
