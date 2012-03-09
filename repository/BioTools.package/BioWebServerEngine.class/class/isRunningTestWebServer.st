testing
isRunningTestWebServer
	" Answer <true> if system is running a web server "
	
	| socket |
	
	BioWebServerEngine hasAnyProvider ifFalse: [ ^ false ].
	socket := [ Socket pingPorts: self localPorts
		on: NetNameResolver localHostName
		timeOutSecs: 10 ]
	on: ConnectionTimedOut
	do: [: ex | ].
	socket isArray
		ifTrue: [ self notify: 'System is running local web server'.
				^ true ].
	^ false
