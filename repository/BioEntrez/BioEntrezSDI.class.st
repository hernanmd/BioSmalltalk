"
Represents the SDI (Selective Dissemination of Information) database in the NCBI Entrez system. Provides access to saved search records.
"
Class {
	#name : 'BioEntrezSDI',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezSDI class >> dbName [
	" See superimplementor's comment "
	
	^ 'domains'

]
