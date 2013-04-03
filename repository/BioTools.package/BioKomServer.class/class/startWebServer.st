accessing
startWebServer
	" See superimplementor's comment "

	| ma |
	ma := (self classFor: #ModuleAssembly) core.
	ma serverRoot: self serverRootDirectory.
	ma documentRoot: self documentRootDirectory.
	ma directoryIndex: 'index.html index.htm'.
	ma serveFiles.
	[ ((self classFor: self providerClass) startOn: 8081 named: 'httpd') plug: ma rootModule ]
	on: Error
	do: [ : ex | self notify: ex messageText ]