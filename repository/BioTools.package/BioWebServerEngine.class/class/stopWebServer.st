accessing
stopWebServer
	" Stop the web server "

	(self classFor: #HttpService)
		ifNotNil: [ :httpClass | httpClass shutDown ]