Extension { #name : #ZnEncodedStream }

{ #category : #'*BioPharo7' }
ZnEncodedStream >> nextPutTerminator [
	" Append a line ending terminator to the receiver "

	self wrappedStream nextPutAll: (String perform: self platformTerminator)
]
