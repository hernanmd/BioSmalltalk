updating
filesToDownload
	" Answer a Collection with the files to download "
		
	^ self connect
		ifNotNil: [ 
			self extractFileNames: self client getFileList.			
			self fileNames asSortedCollection ]
		ifNil: [ self inform: 'Connection failed' translated ]