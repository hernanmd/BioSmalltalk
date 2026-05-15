"
Represents the PubChem Substance database in the NCBI Entrez system. Provides access to chemical substance records.
"
Class {
	#name : 'BioEntrezPCSubstance',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezPCSubstance class >> dbName [
	" See superimplementor's comment "
	
	^ 'pcsubstance'

]
