"
Represents the OMIM (Online Mendelian Inheritance in Man) database in the NCBI Entrez system. Provides access to human genetic disorder records.
"
Class {
	#name : 'BioEntrezOMIM',
	#superclass : 'BioELitDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezOMIM class >> dbName [
	" See superimplementor's comment "
	
	^ 'omim'

]
