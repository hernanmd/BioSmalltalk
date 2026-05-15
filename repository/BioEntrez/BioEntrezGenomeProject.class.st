"
Represents the Genome Project database in the NCBI Entrez system. Provides access to genome project records.
"
Class {
	#name : 'BioEntrezGenomeProject',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezGenomeProject class >> dbName [
	" See superimplementor's comment "
	
	^ 'genomeprj'

]
