convenience-filesystem
dumpToFileNamed: filename contents: anObject
	" Write anObject to a file named filename in the current directory "
	
	| fs |
	fs := [ 
		self newFileNamed: filename.
		anObject dumpToStream: fs 
	] ensure: [ fs close ].