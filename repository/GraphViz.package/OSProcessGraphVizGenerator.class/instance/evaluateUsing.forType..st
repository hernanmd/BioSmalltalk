generating
evaluateUsing: externalProgram forType: outputFormat
	"Use OSProcess to run external program (i.e. dot, neato, fdp, twopi) and produce the requested output type.
	See the documentation for dot for a list of supported output types. No external
	files are produced. Answer the completed PipeableOSProcess."

	^ (self externalCommand: externalProgram, ' -T', outputFormat)
		nextPutAll: self dotSourceWithLineFeedTerminators;
		close