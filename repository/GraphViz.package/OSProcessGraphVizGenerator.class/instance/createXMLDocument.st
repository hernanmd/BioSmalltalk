converting
createXMLDocument
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