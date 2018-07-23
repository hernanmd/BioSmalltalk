doits
platformFilesUrl
	" Answer a <Collection> of download URLs for the current platform "

	^ Smalltalk os isWin32 
		ifTrue: [ #('https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.zip') ]
		ifFalse: [ #('https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.tar.gz') ].
