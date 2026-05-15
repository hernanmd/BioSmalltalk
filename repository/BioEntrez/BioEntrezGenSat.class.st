"
Represents the GenSat database in the NCBI Entrez system. Provides access to gene expression atlas data.
"
Class {
	#name : 'BioEntrezGenSat',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezGenSat class >> dbName [
	" See superimplementor's comment "
	
	^ 'gensat'

]
