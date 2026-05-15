"
Represents the SNP (Single Nucleotide Polymorphism) database in the NCBI Entrez system. Provides access to SNP records.
"
Class {
	#name : 'BioEntrezSNP',
	#superclass : 'BioESeqDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezSNP class >> dbName [
	" See superimplementor's comment "
	
	^ 'snp'

]
