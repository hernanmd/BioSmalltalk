downloading
filesToDownload
	" Answer a Collection with the files to download "
		
	^ self connect
		ifNotNil: [ self fileList ]
		ifNil: [ self informMessage: 'Connection failed' translated ]