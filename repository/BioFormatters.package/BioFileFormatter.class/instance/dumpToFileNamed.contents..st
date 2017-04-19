convenience-filesystem
dumpToFileNamed: aFilename contents: contentsString
	" See superimplementor's comment "

	self writeToFile
		ifTrue: [ self dumpToFileNamed: aFilename contents: contentsString ].