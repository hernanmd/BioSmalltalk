testing
testDotExecutableInstalled
	"The dot external program is used to translate dot language files into a
	variety of output formats."

	self assert: (ShellSyntax new findExecutablePathFor: 'dot' inDirectoryPath: nil) notNil