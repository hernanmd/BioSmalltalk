accessing
serialize: anObject
	" See superimplementor's comment "
	"anObject sixxString"
	
	Cursor write showWhile: [ 	
		| stream |
		stream := (Smalltalk at: #SixxWriteStream) newFileNamed: self location.
		stream nextPut: anObject.
		stream close ].