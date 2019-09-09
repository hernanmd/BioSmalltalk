Extension { #name : #ZnBufferedReadStream }

{ #category : #'*BioPharo7' }
ZnBufferedReadStream >> reset [ 

	stream reset.
	self position: 0.
]
