doits
platformFilesUrl
	" Answer test files download URL "

	^ Smalltalk os isWin32 
		ifTrue: [ 'http://www.dropbox.com/s/mepb9j3fitjgc34/BioSmalltalkTestFiles.zip' ]
		ifFalse: [ 'http://www.dropbox.com/s/pklf9kce56bbqqq/BioSmalltalkTestFiles.tar.gz' ].