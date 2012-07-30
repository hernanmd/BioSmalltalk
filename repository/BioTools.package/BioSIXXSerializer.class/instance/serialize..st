accessing
serialize: anObject

	| stream |
	"anObject sixxString"

	stream := SixxWriteStream newFileNamed: self location.
	stream nextPut: anObject.
	stream close.