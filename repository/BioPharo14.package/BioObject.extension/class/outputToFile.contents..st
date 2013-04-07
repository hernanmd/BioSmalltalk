*biopharo14
outputToFile: nameString contents: anObject
	" Outputs contentsString to a file named nameString "
	| fs |
	
	fs := self newFileNamed: nameString.
	fs wantsLineEndConversion: true.
	[ anObject outputTo: fs ] ensure: [ fs close ].	