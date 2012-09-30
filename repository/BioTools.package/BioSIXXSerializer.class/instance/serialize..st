accessing
serialize: anObject
	"anObject sixxString"
	
	| stream |
	stream := (Smalltalk at: #SixxWriteStream) newFileNamed: self location.
	stream nextPut: anObject.
	stream close.