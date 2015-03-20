filesystem
outputToFile: filename contents: anObject
	" Write anObject to a file named filename in the current directory "
	
	| fs |
	[ fs := self newFileNamed: filename.
	fs wantsLineEndConversion: false.
	anObject outputTo: fs ] ensure: [ fs close ].