filesystem
outputToFullFile: nameString contents: anObject
	" Outputs contentsString to a file named nameString "
	| fs |
	
	fs := self newFullFileNamed: nameString.
	fs wantsLineEndConversion: true.
	[ anObject outputTo: fs ] ensure: [ fs close ].	