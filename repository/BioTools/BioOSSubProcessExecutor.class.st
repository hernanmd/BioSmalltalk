Class {
	#name : #BioOSSubProcessExecutor,
	#superclass : #BioExecutionEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioOSSubProcessExecutor class >> executeCommand: aCommandName [
	" See superimplementor's comment "
	
	^ [ self executeOSSubProcessCommand: aCommandName ]
		on: Warning
		do: [ : ex | ex resume ]
]

{ #category : #accessing }
BioOSSubProcessExecutor class >> executeMonitoring: aCommandName [
	" See superimplementor's comment "
	
	| totalStdout page playground cmd args |
	
	cmd := (aCommandName findTokens: ' ') first.
	args := (aCommandName findTokens: ' ') allButFirst.
	totalStdout := String new writeStream.
	"These first lines just open a Pharo Playground with an initial content"
	(page := GTPlayPage new) saveContent: 'initial content'.
	(playground := GTPlayground new) openOn: page.
	[
		self providerClass new
			command: cmd;
			arguments: args;
			redirectStdout;
			redirectStderr;
			runAndWaitPollingEvery: (Delay forSeconds: self monitoringDelay)
			doing: [ :process :outStream :errStream |  
				| read |
				read := outStream upToEnd.
				"Next 2 lines is to simply update the Playground"
				page saveContent: (page content, read).
				playground update.
				totalStdout nextPutAll: read.
				errStream upToEnd.
			]
			onExitDo: [ :process :outStream :errStream  |
				process closeAndCleanStreams.
				Transcript show: 'Total stdout: ', totalStdout contents ]
		] fork
]

{ #category : #accessing }
BioOSSubProcessExecutor class >> executeOSSubProcessCommand: aCommandName [
	" Private - Execute aCommandName and answer a <String> with any output returned "

	| osSubProcess teeCmd |
	
	osSubProcess := (self classFor: self providerClass) new shellCommand: aCommandName.
	^ osSubProcess run
]

{ #category : #testing }
BioOSSubProcessExecutor class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ self isRunningInUnix
]

{ #category : #accessing }
BioOSSubProcessExecutor class >> providerClass [
	" Private - See superimplementor's comment "

	^ #OSSUnixSubprocess
]
