accessing
stopWebServer
	" Stop the web server "

	(self classFor: #HttpService) 
		ifNotNilDo: [ : httpClass | httpClass shutDown ]