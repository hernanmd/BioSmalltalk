accessing
startWebServer
	" See superimplementor's comment "

	((self classFor: self providerClass) startOn: self port)
		delegate: (ZnStaticFileServerDelegate new
			directory: self documentRootDirectory asFileReference;
			prefixFromString: 'static-files';
			yourself).
