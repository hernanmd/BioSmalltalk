private
execute: aProgramPath parameters: parameters
	" Execute aProgramPath with parameters and answer a String
	with the corresponding output if successfully,
	otherwise raise an exception "
	
	| shellCommand |
	
	( self validateParameters: parameters )
		ifFalse: [ ^ self signalInvalidObject: 'Invalid or incompatible parameters : ' , parameters ].
	shellCommand := self executing: aProgramPath parameters: parameters.
	self process useStdout.
	self process startWithShellCommand: shellCommand.
	^ self process upToEnd

	