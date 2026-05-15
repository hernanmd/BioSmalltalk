"
Represents the Sample database in the NCBI Entrez system. Provides access to sample records.
"
Class {
	#name : 'BioEntrezSample',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezSample class >> dbName [
	" See superimplementor's comment "
	
	^ 'biosample'

]
