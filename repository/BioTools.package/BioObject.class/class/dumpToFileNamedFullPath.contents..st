convenience-filesystem
dumpToFileNamedFullPath: filename contents: anObject
	" Write anObject to a file named filename representing a full path "
	
	| fs |
	[ fs := self newFullFileNamed: filename.
	fs wantsLineEndConversion: false.
	anObject dumpToStream: fs ] ensure: [ fs close ].