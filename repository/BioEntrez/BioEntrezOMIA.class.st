"
Represents the OMIA (Online Mendelian Inheritance in Animals) database in the NCBI Entrez system. Provides access to inherited animal disorder records.
"
Class {
	#name : 'BioEntrezOMIA',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezOMIA class >> dbName [
	" See superimplementor's comment "
	
	^ 'omia'

]
