Extension { #name : #ZnEncodedStream }

{ #category : #'*BioPharo7' }
ZnEncodedStream >> nextPutTerminator [
	" Append a line ending terminator to the receiver "

	self wrappedStream nextPutAll: (String perform: self platformTerminator)
]

{ #category : #'*BioPharo7' }
ZnEncodedStream >> reset [

	self position: 0
]
