generating
writeDotFileNamed: aString

	| fileName file |
	fileName := aString.
	(aString endsWith: self dotExtension) ifFalse: [fileName := fileName, self dotExtension].
	
	file := self outputFileDirectory forceNewFileNamed: fileName.
	[file nextPutAll: self graph dot] ensure: [file close]