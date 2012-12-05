accessing
preGenerateForOptions
	" Private - Configure system receiver's internal settings before compilation "
	
	self initializeCodeStream.
	self disableCompilationLogging.
	self cleanTarget.	
	self setAuthoring.
	self generateMethodHeader.
	self generateOptionMethodBody.