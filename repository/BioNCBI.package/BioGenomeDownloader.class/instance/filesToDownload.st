downloading
filesToDownload
	" Answer a Collection with the files to download "
		
	^ self connect
		ifNotNil: [ self fileList ]
		ifNil: [ self inform: 'Connection failed' translated ]