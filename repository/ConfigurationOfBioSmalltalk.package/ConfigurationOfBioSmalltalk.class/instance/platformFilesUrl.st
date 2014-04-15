doits
platformFilesUrl
	" Answer test files download URL "

	^ Smalltalk os isWin32 
		ifTrue: [ 'http://dl.dropboxusercontent.com/s/mepb9j3fitjgc34/BioSmalltalkTestFiles.zip' ]
		ifFalse: [ 'http://dl.dropboxusercontent.com/s/pklf9kce56bbgqg/BioSmalltalkTestFiles.tar.gz' ].