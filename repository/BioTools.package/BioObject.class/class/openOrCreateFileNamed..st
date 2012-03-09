filesystem
openOrCreateFileNamed: fileName
	" Answer a FileStream for fileName in the image directory. "
	
	| fs |
	
	fs := ( self fileExists: fileName )
			ifFalse: [ self newFileNamed: fileName ]
			ifTrue: [ self openFileNamed: fileName ].
	^ fs readWrite
	