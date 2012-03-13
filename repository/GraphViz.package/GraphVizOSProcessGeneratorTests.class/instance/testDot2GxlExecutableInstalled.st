testing
testDot2GxlExecutableInstalled
	"The dot2gxl external program is used to create an XML description of a graph.
	Note: Some versions of the dot2gxl program do not correctly flush 
	output to a pipe or file. This test will fail in that case, with the XML 
	data appearing to have been truncated. If this happens, install a new
	version of the GraphViz package on your system."

	self assert: (ShellSyntax new findExecutablePathFor: 'dot2gxl' inDirectoryPath: nil) notNil