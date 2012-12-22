filesystem
fileDirectoryContentsFor: aDirectoryString
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	| fs path |
	path := (FilePath pathName: aDirectoryString isEncoded: true) asSqueakPathName.
	^ (FileReference
		fileSystem: (fs := FileSystem disk)
		path: (fs pathFromString: path)) allFiles.
	