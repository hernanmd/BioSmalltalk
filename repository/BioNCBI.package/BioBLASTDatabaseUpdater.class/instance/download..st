downloading
download: fileName
	" Download fileName from the remote site. "
	
	self connect
		ifNotNil: [ 
			self prvDownload: fileName.
			self client close.
			self gtLog: 'Downloads completed successfully' ]
		ifNil: [ self inform: 'Connection failed' translated ].
	
	 