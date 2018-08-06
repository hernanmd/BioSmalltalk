downloading
download: fileName
	" Download fileName from the remote site. "
	
	self connect
		ifNotNil: [ 
			self prvDownload: fileName.
			self client close.
			self bioLog: 'Downloads completed successfully' translated ]
		ifNil: [ self informMessage: 'Connection failed' translated ].
	
	 