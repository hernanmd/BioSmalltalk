"
Represents the dbGaP (database of Genotypes and Phenotypes) in the NCBI Entrez system. Provides access to genotype-phenotype association records.
"
Class {
	#name : 'BioEntrezDBGap',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezDBGap class >> dbName [
	" See superimplementor's comment "
	
	^ 'gap'

]
