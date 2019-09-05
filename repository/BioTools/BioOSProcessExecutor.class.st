"
OSProcess provides access to operating system functions, including pipes and child process creation. It is implemented using pluggable primitives in a shared library for Unix or Linux, and a DLL for Windows. The Smalltalk code, including the classes which implement pluggable primitives for Unix or Win32 operating system functions, may be loaded into any Squeak image, but the primitives are only useful on Unix and Windows systems

See http://wiki.squeak.org/squeak/708 for details

"
Class {
	#name : #BioOSProcessExecutor,
	#superclass : #BioExecutionEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioOSProcessExecutor class >> executeCommand: aCommandName [
	" See superimplementor's comment "
	
	^ [ self executeOSProcessCommand: aCommandName ]
		on: Warning "AioPlugin not present"
		do: [ : ex | ex resume ]
]

{ #category : #accessing }
BioOSProcessExecutor class >> executeCommand: aCommandName parameter: parameterName [
	" See superimplementor's comment "

	^ ((self classFor: self providerClass) 
			command: aCommandName , String space , parameterName) output.
]

{ #category : #accessing }
BioOSProcessExecutor class >> executeMonitoring: aCommandName [
	" See superimplementor's comment "
	
	| p |
	
	p := (self classFor: self providerClass) command: aCommandName.
	[ p isComplete ] whileFalse: [
		(Delay forSeconds: self monitoringDelay) wait.
		Transcript show: Time now asString; cr ].
	^ p output
	
]

{ #category : #accessing }
BioOSProcessExecutor class >> executeOSProcessCommand: aCommandName [
	" Private - Execute aCommandName and answer a <String> with any output returned "

	| osProcess teeCmd |
	
	teeCmd := 'tee -a last.run'.
	osProcess := ((self classFor: self providerClass) command: aCommandName) | teeCmd.
	^ osProcess outputAndError
]

{ #category : #testing }
BioOSProcessExecutor class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ self isRunningInUnix
]

{ #category : #accessing }
BioOSProcessExecutor class >> providerClass [
	" Private - See superimplementor's comment "

	^ #PipeableOSProcess
]
