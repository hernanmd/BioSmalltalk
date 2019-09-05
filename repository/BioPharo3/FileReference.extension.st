Extension { #name : #FileReference }

{ #category : #'*BioPharo3' }
FileReference >> contents [
	"Answer a <String> with all of the contents of the receiver."

	^ self readStream contents asString
]

{ #category : #'*BioPharo3' }
FileReference >> sizeInMegabytes [
	" Answer a <Number> of the receiver size in Megabytes "

	^ (self size / 1048576) asFloat roundTo: 0.01
]
