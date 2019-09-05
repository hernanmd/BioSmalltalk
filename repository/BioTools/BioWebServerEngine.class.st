"
BioWebServerEngine is the superclass for HTTP servers.

"
Class {
	#name : #BioWebServerEngine,
	#superclass : #BioAbstractAdapter,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioWebServerEngine class >> documentRootDirectory [
	" Answer a <String> specifying the directory where web server document root will be located "

	^ self fileDirectoryClass default fullName , self testFilesDirectoryName
]

{ #category : #accessing }
BioWebServerEngine class >> isRunning [
	" Answer <true> if the receiver is in execution state "
	
	self subclassResponsibility
]

{ #category : #testing }
BioWebServerEngine class >> isRunningTestWebServer [
	" Answer <true> if system is running a web server "
	
	| socket |
	
	self hasAnyProvider ifFalse: [ ^ false ].
	socket := [ Socket pingPorts: self localPorts
		on: NetNameResolver localHostName
		timeOutSecs: 10 ]
	on: ConnectionTimedOut
	do: [ : ex | ex pass ].
	socket isArray
		ifTrue: [ self notify: 'System is running local web server'.
				^ true ].
	^ false

]

{ #category : #accessing }
BioWebServerEngine class >> isStopped [
	" Answer <true> if the receiver is in stopped state "

	self subclassResponsibility
]

{ #category : #testing }
BioWebServerEngine class >> localPorts [
	" Answer a <Collection> of <Number> representing known ports where a web server could be running "
	
	^ #(80 81 443 2082 7777 8080 8081 8888 9090 51969)
]

{ #category : #accessing }
BioWebServerEngine class >> port [
	" Answer a <String> with the default web server port "

	^ '8081'

]

{ #category : #accessing }
BioWebServerEngine class >> serverRootDirectory [
	" Answer a <String> specifying the directory where web server files are located "

	^ self fileDirectoryClass default fullName , self testFilesDirectoryName
]

{ #category : #accessing }
BioWebServerEngine class >> startWebServer [
	" Start a web server "

	self adapterClass startWebServer
]

{ #category : #accessing }
BioWebServerEngine class >> stopWebServer [
	" Stop the web server "

	(self classFor: #HttpService)
		ifNotNil: [ :httpClass | httpClass shutDown ]
]
