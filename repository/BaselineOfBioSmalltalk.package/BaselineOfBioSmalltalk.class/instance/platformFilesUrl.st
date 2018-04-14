doits
platformFilesUrl
	" Answer a <Collection> of download URLs for the current platform "

	^ Smalltalk os isWin32 
		ifTrue: [ #(
			'https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.zip'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.zip') ]
		ifFalse: [ #(
			'https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.tar.gz'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.tar.gz') ].