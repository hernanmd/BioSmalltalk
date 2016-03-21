downloading
filesToDownload
	" Answer a Collection with the files to download "

	^ self connect
		ifNotNil: [ :arg | self fileList ]
		ifNil: [ self inform: 'Connection failed' translated ]