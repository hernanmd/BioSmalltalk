accessing
stopWebServer

	( self classFor: #HttpService ) 
		ifNotNilDo: [: httpClass |  httpClass shutDown ]