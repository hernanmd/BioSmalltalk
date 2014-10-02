doits
platformFilesUrl
	" Answer a <Collection> of download URLs for the current platform "

	^ Smalltalk os isWin32 
		ifTrue: [ #('http://dl.dropboxusercontent.com/u/103833630/BioSmalltalkTestFiles.zip'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.zip') ]
		ifFalse: [ #('http://dl.dropboxusercontent.com/u/103833630/BioSmalltalkTestFiles.tar.gz'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.tar.gz') ].