convenience-utilities
ftpClientClass
	" Answer a class for handling FTP connections "

	^ Smalltalk at: #FTPClient ifAbsent: [ self error: 'FTP client was not found in the system' ]