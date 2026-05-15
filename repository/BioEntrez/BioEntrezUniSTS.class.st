"
Represents the UniSTS (Sequence Tagged Sites) database in the NCBI Entrez system. Provides access to STS marker records.
"
Class {
	#name : 'BioEntrezUniSTS',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezUniSTS class >> dbName [
	" See superimplementor's comment "
	
	^ 'unists'

]
