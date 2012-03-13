accessing
defaultGeneratorClass

	"GraphViz defaultGeneratorClass"

	| platform className |
	platform := (SmalltalkImage current platformName copyWithout: Character space) capitalized.
	className := (platform , #GraphVizGenerator)  asSymbol.

	"Issue a warning for special case of Mac OS prior to the OS X operating system"
	(platform = 'MacOS' and: [ SmalltalkImage current osVersion asNumber < 1000])
		ifTrue: [self notify: 'GraphViz on Mac OS prior to OS X may not function correctly. ',
					'You may proceed, but errors are possible. Please notify author ',
					' if you are able to confirm GraphViz working on your Mac OS system.'].

	"Use the specific concrete subclass for this platform if implemented"
	(Smalltalk hasClassNamed: className) ifTrue: [^ Smalltalk at: className].

	"Otherwise use OSProcess if possible"
	(platform = 'Unix') ifTrue:
		 [(Smalltalk hasClassNamed: #PipeableOSProcess)
			ifTrue: [^ OSProcessGraphVizGenerator]
			ifFalse: [self notify:
					'Class ' , className , ' not implemented for this platform. ',
					'Load OSProcess and CommandShell to enable GraphViz on ',
					'Unix, Linux, or Mac OS X with Unix VM.'].
					^ nil].

	self notify: SmalltalkImage current platformName, ' is is not yet supported for the GraphViz package for Squeak'.
	^ nil