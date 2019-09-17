Extension { #name : #ZnBufferedReadStream }

{ #category : #'*BioPharo7' }
ZnBufferedReadStream >> name [
	" Answer a <String> identifying the receiver "

	^ self wrappedStream name.
]

{ #category : #'*BioPharo7' }
ZnBufferedReadStream >> reset [ 

	stream reset.
	self position: 0.
]
