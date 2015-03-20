testing
isRunningTestWebServer
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
