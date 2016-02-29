accessing
urlTestAddress
	" Answer a String representing an URL for testing purposes "

	^ self isRunningTestWebServer
		ifTrue: [ 'http://localhost:' , BioWebServerEngine port ]
		ifFalse: [ self checkTestWebServer ]