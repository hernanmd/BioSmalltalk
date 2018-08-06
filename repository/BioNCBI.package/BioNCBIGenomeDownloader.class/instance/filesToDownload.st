downloading
filesToDownload
	" Answer a Collection with the files to download "

	^ self connect
		ifNotNil: [ :arg | self buildFileList ]
		ifNil: [ self informMessage: 'Connection failed' translated ]