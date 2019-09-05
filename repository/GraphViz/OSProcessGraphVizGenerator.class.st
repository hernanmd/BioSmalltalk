Class {
	#name : #OSProcessGraphVizGenerator,
	#superclass : #GraphVizGenerator,
	#category : 'GraphViz-Generators'
}

{ #category : #converting }
OSProcessGraphVizGenerator >> createMorph [
	"builds and returns a morph"

	^ (PNGReadWriter createAFormFrom: (self generateType: #png)) first asMorph

]

{ #category : #converting }
OSProcessGraphVizGenerator >> createXMLDocument [
	"builds and returns an XMLDocument"
	"Warning: Some versions of the dot2gxl program do not correctly flush 
	output to a pipe or file. This method will fail in that case, with the XML 
	data appearing to have been truncated. If this happens, install a new
	version of the GraphViz package on your system."

	| dot2gxlProcess xml parser |
	dot2gxlProcess := self externalCommand: 'dot2gxl'.
	[xml := dot2gxlProcess
		nextPutAll: (self generateType: #dot);
		close;
		output]
			on: Error
			do: [self notify: dot2gxlProcess errorPipelineContents.
				^ xml ifNil: ['']].
	dot2gxlProcess succeeded ifFalse:
		[self notify: dot2gxlProcess errorPipelineContents].
	parser := Smalltalk at: #XMLDOMParser ifAbsent: [].
	^ parser
		ifNil: [xml]
		ifNotNil: [parser parseDocumentFrom: xml readStream]
]

{ #category : #generating }
OSProcessGraphVizGenerator >> dotSourceWithLineFeedTerminators [
	"The external programs expect <lf> line terminators on Unix systems"

	^ self graph dot copyReplaceAll: String cr with: String lf
]

{ #category : #generating }
OSProcessGraphVizGenerator >> evaluateUsing: externalProgram forType: outputFormat [
	"Use OSProcess to run external program (i.e. dot, neato, fdp, twopi) and produce the requested output type.
	See the documentation for dot for a list of supported output types. No external
	files are produced. Answer the completed PipeableOSProcess."

	^ (self externalCommand: externalProgram, ' -T', outputFormat)
		nextPutAll: self dotSourceWithLineFeedTerminators;
		close
]

{ #category : #generating }
OSProcessGraphVizGenerator >> externalCommand: commandString [
	"Use OSProcess to evaluate an external command in a PipeableOSProcess.
	Answer the PipeableOSProcess. The sender can obtain output streams and
	exit status from the completed PipeableOSProcess as required."

	^ (Smalltalk
		at: #PipeableOSProcess
		ifAbsent: [self notify: 'OSProcess and CommandShell packages not loaded in this image'])
			command: commandString
]

{ #category : #generating }
OSProcessGraphVizGenerator >> generateType: outputTypeString [
	"Use OSProcess to run dot and produce the requested output type. See the
	documentation for dot for a list of supported output types. No external
	files are produced."

	| dotProcess outputString |
	dotProcess := self
		evaluateUsing: self preferredProgram 
		forType: outputTypeString.
	outputString := dotProcess output.
	dotProcess succeeded
		ifFalse: [self notify: dotProcess errorPipelineContents].
	^ outputString

]

{ #category : #generating }
OSProcessGraphVizGenerator >> make: outputFormat [

	"makes the requested output format on disk and returns full filename to output file 
	e.g. write a SVG output file and returns full path to the output file"

	| fileName fs |
	fileName := self outputFileNameFor: outputFormat.
	fs := FileStream newFileNamed: fileName.
	[fs nextPutAll: (self generateType: outputFormat)] ensure: [fs close].
	^ fileName

]
