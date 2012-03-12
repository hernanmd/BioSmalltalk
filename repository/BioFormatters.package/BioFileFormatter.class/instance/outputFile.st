exporting
outputFile
	" Answer a FileStream for a new file in the receiver's configured folder "

	^ outputFile
		ifNil: [ outputFile := self newFileNamed: ( self outputFilename reversed copyUpTo: $\ ) reversed ].