*BioPharo3
filesIn: pathString
	" Answer a <Collection> of file references contained in pathString "
	
	| fs |
	^ (FileReference fileSystem: (fs := FileSystem disk) path: (fs pathFromString: pathString)) allFiles.
	