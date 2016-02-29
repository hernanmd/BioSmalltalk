accessing
checkTestWebServer
	^ (BioWebServerEngine hasAnyProvider
		and: [ self confirm: 'Do you want to start a local web server for testing the web adapters?' ])
		ifTrue: [ 
			self startTestWebServer.
			self urlTestAddress ]
		ifFalse: [ 
			(self confirm: 'No web server available, do you agree to use ' , self defaultUrlTestAddress , ' for testing the adapter')
				ifTrue: [ self defaultUrlTestAddress ]
				ifFalse: [ 
					BioObject signalNotFound: 'Unable to test Web Adapters'.
					self nullUrlAddress ] ]