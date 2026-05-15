"
Represents the HomoloGene database in the NCBI Entrez system. Provides access to homologous gene sets across species.
"
Class {
	#name : 'BioEntrezHomoloGene',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezHomoloGene class >> dbName [
	" See superimplementor's comment "
	
	^ 'homologene'

]
