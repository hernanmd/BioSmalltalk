"
Represents the Cancer Chromosomes database in the NCBI Entrez system. Provides access to cancer chromosome data records.
"
Class {
	#name : 'BioEntrezCancerChromosomes',
	#superclass : 'BioEntrezDatabase',
	#category : 'BioEntrez-Databases',
	#package : 'BioEntrez',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioEntrezCancerChromosomes class >> dbName [
	" See superimplementor's comment "
	
	^ 'cancerchromosomes'

]
