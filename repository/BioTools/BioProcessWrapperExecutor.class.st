"
ProcessWrapper is a plugin + wrapper code for Win32 process execution with non-blocking stdin, stdout and stderr support. 

The project aims to give features similar to OSProcess, but it's not related to it in any other way.

Most programs should be located in a standard directory and be reachable by the PATH variable.
If programName <String> is NOT in the PATH variable, then  #which: will not be able to locate the complete path to the program,
"
Class {
	#name : #BioProcessWrapperExecutor,
	#superclass : #BioExecutionEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioProcessWrapperExecutor class >> executeCommand: aCommandName [
	" See superimplementor's comment "

	| process output answer |

	process := (self classFor: self providerClass) new.
	output := process 
		useStdout;
		useStderr;
		startWithShellCommand: aCommandName;
		upToEnd.
	^ (answer := process errorUpToEnd) isEmpty not "process exitCode = 0"
			ifTrue: [ answer ]
			ifFalse: [ output ]
]

{ #category : #accessing }
BioProcessWrapperExecutor class >> executeCommand: aCommandName parameter: parameterName [
	" See superimplementor's comment "

	| process |

	process := (self classFor: self providerClass) new.
	^ process 
		useStdout;
		startWithShellCommand: aCommandName , String space , parameterName;
		upToEnd.
]

{ #category : #testing }
BioProcessWrapperExecutor class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ self isRunningInWindows
]

{ #category : #accessing }
BioProcessWrapperExecutor class >> locateProgram: programName [
	" Answer a <String> with the full qualified path to programName if can be located by the which command "
	
	^ self programLocation isEmpty
		ifTrue: [ self locateProgramNamed: programName ]
		ifFalse: [ self programLocation ].

]

{ #category : #accessing }
BioProcessWrapperExecutor class >> locateProgramNamed: programName [

	| cmdResult |
			
	(cmdResult := self locateProgramStandard: programName) isEmpty
		ifTrue: [ ^ self signalNotFound: programName , ' in PATH' ].
	^ cmdResult trimRight

]

{ #category : #accessing }
BioProcessWrapperExecutor class >> locateProgramStandard: programName [
	" Try to locate programName in standard PATH.
	
	NBWin32Shell getPathEntries "

	^ self executeCommand: 'where' parameter: programName
]

{ #category : #accessing }
BioProcessWrapperExecutor class >> providerClass [
	" See superimplementor's comment "

	^ #ProcessWrapper
]
