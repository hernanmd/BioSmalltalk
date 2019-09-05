"
These tests should pass if and only if:
- This Squeak image is running on a Unix VM, including Unix, Linux, and Mac OS X systems.
- The Graphviz programs are installed on the underlying operating system, including the 'dot' and 'dot2gxl' programs.
- The Squeak OSProcess package is installed.
- The Squeak CommandShell package is installed.
"
Class {
	#name : #GraphVizOSProcessGeneratorTests,
	#superclass : #GraphVizBaseTests,
	#category : 'GraphViz-Tests'
}

{ #category : #'as yet unclassified' }
GraphVizOSProcessGeneratorTests class >> isAbstract [

	^ [GraphViz defaultGeneratorClass ~= OSProcessGraphVizGenerator]
		on: Warning
		do: [^ true]

]

{ #category : #testing }
GraphVizOSProcessGeneratorTests >> testCreateXmlDocument [
	"Note: This test uses a #match: that should pass regardless of whether
	XMLDOMParser is present in the image."

	| gv xml |
	gv := self historyOfSmalltalk.
	xml := gv asXml.
	self assert: ('*</graph>*</gxl>*' match: (xml asString last: 20))

]

{ #category : #testing }
GraphVizOSProcessGeneratorTests >> testDot2GxlExecutableInstalled [
	"The dot2gxl external program is used to create an XML description of a graph.
	Note: Some versions of the dot2gxl program do not correctly flush 
	output to a pipe or file. This test will fail in that case, with the XML 
	data appearing to have been truncated. If this happens, install a new
	version of the GraphViz package on your system."

	self assert: (ShellSyntax new findExecutablePathFor: 'dot2gxl' inDirectoryPath: nil) notNil
]

{ #category : #testing }
GraphVizOSProcessGeneratorTests >> testDotExecutableInstalled [
	"The dot external program is used to translate dot language files into a
	variety of output formats."

	self assert: (ShellSyntax new findExecutablePathFor: 'dot' inDirectoryPath: nil) notNil
]

{ #category : #testing }
GraphVizOSProcessGeneratorTests >> testGenerateDotOutput [
	"Verify that that extern dot program produced expected output"

	| plain |
	plain := self historyOfSmalltalk asOutputType: #plain.
	self assert: ((plain last: 20) copyWithoutAll: (String cr, String lf)) = '58 solid blackstop'

]

{ #category : #testing }
GraphVizOSProcessGeneratorTests >> testMakeDotFile [

	| gv fileName fs |
	gv := self historyOfSmalltalk.
	fileName := gv generator outputFileNameFor: #plain.
	FileDirectory default deleteFileNamed: fileName ifAbsent: [].
	gv make: #plain.
	fs := FileStream fileNamed: fileName.
	[self assert: ((fs contents last: 20) copyWithoutAll: (String cr, String lf)) = '58 solid blackstop']
		ensure:
			[fs close.
			FileDirectory default deleteFileNamed: fileName ifAbsent: []]

]

{ #category : #testing }
GraphVizOSProcessGeneratorTests >> testOSProcessInstalled [

	self assert: (Smalltalk hasClassNamed: #OSProcess).
	self assert: (Smalltalk hasClassNamed: #CommandShell)
]
