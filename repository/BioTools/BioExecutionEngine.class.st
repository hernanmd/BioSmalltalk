"
Abstracts different types of Operating System ""executor"" classes.

"
Class {
	#name : #BioExecutionEngine,
	#superclass : #BioAbstractAdapter,
	#classInstVars : [
		'programLocation',
		'monitoringDelay'
	],
	#category : #'BioTools-Adapters'
}

{ #category : #defaults }
BioExecutionEngine class >> defaultMonitoringDelay [
	" Answer a <Number> of seconds to wait between progress update on execution "
	
	^ 2
]

{ #category : #accessing }
BioExecutionEngine class >> execNameFor: programName [
	" Answer a String with the fully qualified name for programName, i.e. if programName is 'blast' then in Windows family the answer will be 'blast.exe' " 
	
	^ BioOSInterfaceEngine execNameFor: programName
]

{ #category : #accessing }
BioExecutionEngine class >> execute: programName [
	" Execute programName and answer a resulting <String> "
	
	^ self adapterClass executeCommand: programName
]

{ #category : #accessing }
BioExecutionEngine class >> executeCommand: aCommandName [
	" Execute aCommandName. Answer an empty <String> if aCommandName is not found, otherwhise answer the aCommandName output "

	^ self adapterClass executeCommand: aCommandName
]

{ #category : #accessing }
BioExecutionEngine class >> executeCommand: aCommandName parameter: parameterName [
	" Execute aCommandName with parameterName, Answer an empty String if aCommandName is not found , otherwhise answer the aCommandName output "
	
	^ self adapterClass executeCommand: aCommandName parameter: parameterName
]

{ #category : #accessing }
BioExecutionEngine class >> executeCygWin: programName [
	" Execute programName in a cygwin environment and answer a resulting <String> "

	| cmdParts cmdLine cmdParams |
	cmdParts := programName findTokens: Character space.
	cmdLine := cmdParts collect: [ :cmdPart | cmdPart copyReplaceAll: '\' with: '/' ].
	cmdLine := cmdLine collect: [ : cmdPart | cmdPart copyReplaceAll: ':' with: '' ].
	cmdParams := cmdLine	allButFirst collect: [ : par | 
			(par beginsWith: '-') ifTrue: [ par ] ifFalse: [ '/cygdrive/' , par ] ].
	cmdLine := (OrderedCollection with: cmdParts first) 	addAll: cmdParams; yourself.
	^ self adapterClass executeCommand: (cmdLine joinUsing: Character space)
]

{ #category : #accessing }
BioExecutionEngine class >> executeMonitoring: aCommandName [
	" Execute aCommandName monitoring its output. Answer an empty <String> if aCommandName is not found, otherwhise answer the aCommandName output "

	^ self adapterClass executeMonitoring: aCommandName
]

{ #category : #accessing }
BioExecutionEngine class >> locateProgram: programName [
	" Answer a <String> with the full qualified path to programName if can be located by the which command "
	
	^ self adapterClass locateProgram: programName
]

{ #category : #accessing }
BioExecutionEngine class >> monitoringDelay [
	" Answer a <Number> of seconds to wait between progress update on execution "

	^ monitoringDelay
		ifNil: [ monitoringDelay := self defaultMonitoringDelay ]
]

{ #category : #accessing }
BioExecutionEngine class >> monitoringDelay: anObject [
	monitoringDelay := anObject
]

{ #category : #accessing }
BioExecutionEngine class >> notifyExecutionEnd [
	" Send a <String> notifying progress update on the receiver's command "
	
	Transcript show: Time now asString , ' finalized'; cr
]

{ #category : #accessing }
BioExecutionEngine class >> notifyExecutionProgress [
	" Send a <String> notifying progress update on the receiver's command "
	
	Transcript show: Time now asString , ' executing'; cr
]

{ #category : #accessing }
BioExecutionEngine class >> programLocation [
	^ programLocation
		ifNil: [ programLocation := String empty ]
]

{ #category : #accessing }
BioExecutionEngine class >> programLocation: aString [
	" Set the receiver's aString as non-standard location "

	programLocation := aString
]
