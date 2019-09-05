Extension { #name : #FileReference }

{ #category : #'*biopharo' }
FileReference >> contents [
	"Answer a <String> with all of the contents of the receiver."

	^ self readStream contents asString
]
