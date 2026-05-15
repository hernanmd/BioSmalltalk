"
Represents the Peptidome database in the NCBI Entrez system. Provides access to peptide data repository records.
"
Class {
	#name : 'BioEntrezPeptidome',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezPeptidome class >> dbName [
	" See superimplementor's comment "
	
	^ 'peptidome'

]
