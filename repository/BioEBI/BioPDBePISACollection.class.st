Class {
	#name : #BioPDBePISACollection,
	#superclass : #BioWebCollection,
	#category : 'BioEBI-PDBePISA'
}

{ #category : #accessing }
BioPDBePISACollection >> baseUrl [ 
	" Private - Answer a String specifying a valid concatenation of receiver's contents for its service "
	
	^ String streamContents: [: str | 
		self isEmpty ifFalse: [
			str 
				nextPutAll: '?';
				nextPutAll: ($, join: self) ] ]
]
