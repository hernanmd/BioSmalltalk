generating
generateType: outputTypeString
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
