"
Execution engine backed by GToolkit subprocess API for running shell commands and retrieving output.
"
Class {
	#name : 'BioGtUnixSubprocess',
	#superclass : 'BioExecutionEngine',
	#category : 'BioTools-Adapters',
	#package : 'BioTools',
	#tag : 'Adapters'
}

{ #category : 'executing' }
BioGtUnixSubprocess class >> executeCommand: aCommandName [
	"See superimplementor's comment"

	^ [ self executeGtSubprocessCommand: aCommandName ]
		on: Warning
		do: [ :ex | ex resume ]
]

{ #category : 'executing' }
BioGtUnixSubprocess class >> executeCommand: aCommandName parameter: parameterName [
	"See superimplementor's comment"

	^ self executeGtSubprocessCommand: (String streamContents: [ :stream |
		stream
			<< aCommandName trimBoth;
			space;
			<< parameterName trimBoth ])
]

{ #category : 'private' }
BioGtUnixSubprocess class >> executeGtSubprocessCommand: aCommandName [
	"Private - Execute aCommandName and answer a <String> with any output returned"

	| subprocess |

	subprocess := (self classFor: self providerClass) new
		shellCommand: aCommandName;
		runAndWait;
		yourself.

	^ (subprocess stderr ifNotEmpty: [ subprocess stderr ] ifEmpty: [ subprocess stdout ]) trimBoth
]

{ #category : 'executing' }
BioGtUnixSubprocess class >> executeMonitoring: aCommandName [
	"See superimplementor's comment"

	^ self executeCommand: aCommandName
]

{ #category : 'testing' }
BioGtUnixSubprocess class >> isPreferredAdapter [
	"Private - See superimplementor's comment"

	^ self isRunningInUnix
]

{ #category : 'accessing' }
BioGtUnixSubprocess class >> locateProgram: programName [
	"Answer a <String> with the full qualified path to programName if can be located by the which command"

	^ self programLocation isEmpty
		ifTrue: [ self locateProgramNamed: programName ]
		ifFalse: [ self programLocation ]
]

{ #category : 'accessing' }
BioGtUnixSubprocess class >> locateProgramNamed: programName [
	"Answer a <String> with the path to programName, if located, or an empty String otherwise"

	| subprocess |

	subprocess := GtSubprocessWithInMemoryOutput new
		shellCommand: 'where ' , programName;
		runAndWait;
		yourself.

	^ (subprocess stderr ifNotEmpty: [ subprocess stderr ] ifEmpty: [ subprocess stdout ]) trimBoth
]

{ #category : 'private' }
BioGtUnixSubprocess class >> providerClass [
	"Private - See superimplementor's comment"

	^ #GtUnixSubprocess
]
