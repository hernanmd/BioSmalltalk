filesystem
dumpToDOSFileNamed: filename contents: anObject
	" Write anObject to a DOS file named filename representing a full path "
	
	| fs |
	[ fs := self newFullFileNamed: filename.
		fs lineEndConvention: #crlf.
		anObject dumpToStream: fs ] 
	ensure: [ fs close ].