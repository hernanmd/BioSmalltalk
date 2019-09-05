"
BioEntrezUIDCollection is a collection of identifiers which are formatted to be passed as valid parameters to the Entrez Utilities service provided by the NCBI.

"
Class {
	#name : #BioEntrezUIDCollection,
	#superclass : #BioWebCollection,
	#category : 'BioEntrez-Commands'
}

{ #category : #accessing }
BioEntrezUIDCollection >> baseUrl [ 
	" Private - Answer a String specifying a valid concatenation of receiver's contents for its service "
	
	^ String streamContents: [: str | 
		self isEmpty ifFalse: [
			str nextPutAll: ($, join: self) ] ]
]
