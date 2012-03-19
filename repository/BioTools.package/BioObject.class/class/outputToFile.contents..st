filesystem
outputToFile: nameString contents: anObject
	" Outputs contentsString to a file named nameString "
	| fs |
	
	[ fs := self newFileNamed: nameString.
	fs wantsLineEndConversion: false.
	anObject outputTo: fs ] ensure: [ fs close ].	