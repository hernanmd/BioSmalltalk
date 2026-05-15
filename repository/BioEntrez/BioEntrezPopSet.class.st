"
Represents the PopSet (Population Set) database in the NCBI Entrez system. Provides access to population study sequence records.
"
Class {
	#name : 'BioEntrezPopSet',
	#superclass : 'BioESeqCommonDb',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezPopSet class >> dbName [
	" See superimplementor's comment "
	
	^ 'popset'

]
