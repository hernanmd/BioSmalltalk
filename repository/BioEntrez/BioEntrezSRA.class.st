"
Represents the SRA (Sequence Read Archive) database in the NCBI Entrez system. Provides access to next-generation sequencing data records.
"
Class {
	#name : 'BioEntrezSRA',
	#superclass : 'BioERetDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezSRA class >> dbName [
	" See superimplementor's comment "
	
	^ 'sra'

]
