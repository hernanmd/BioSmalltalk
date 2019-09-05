Class {
	#name : #BioEntrezGene,
	#superclass : #BioESeqDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezGene class >> dbName [
	" See superimplementor's comment "
	
	^ 'gene'

]
