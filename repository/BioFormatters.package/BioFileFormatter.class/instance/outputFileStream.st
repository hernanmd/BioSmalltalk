exporting
outputFileStream
	" Answer a <FileStream> for a new file in the receiver's configured folder "

	^ outputFileStream
		ifNil: [ outputFileStream := self newFullFileNamed: (self outputFilename reversed copyUpTo: $\) reversed ].