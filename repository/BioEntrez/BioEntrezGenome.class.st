"
Represents the Genome database in the NCBI Entrez system. Provides access to genome sequence records.
"
Class {
	#name : 'BioEntrezGenome',
	#superclass : 'BioESeqDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezGenome class >> dbName [
	" See superimplementor's comment "
	
	^ 'genome'

]
