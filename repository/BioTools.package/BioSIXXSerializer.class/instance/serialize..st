accessing
serialize: anObject

	| stream |
	"anObject sixxString"

	stream := ( Smalltalk at: #SixxWriteStream ) newFileNamed: self location.
	stream nextPut: anObject.
	stream close.