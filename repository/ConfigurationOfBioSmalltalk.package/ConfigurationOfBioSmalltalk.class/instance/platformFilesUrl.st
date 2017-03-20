doits
platformFilesUrl
	" Answer a <Collection> of download URLs for the current platform "

	^ Smalltalk os isWin32 
		ifTrue: [ #('http://www.dropbox.com/s/2ch3l4oi1yl8kj5/BioSmalltalkTestFiles.zip'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.zip') ]
		ifFalse: [ #('https://www.dropbox.com/s/mowezz5mscmp2tw/BioSmalltalkTestFiles.tar.gz'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.tar.gz') ].