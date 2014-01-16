downloading
download
	" Download the requested files only if they are missing or if they are newer in the remote site. "
	
	[ self filesToDownload do: [: fileName | self prvDownload: fileName ].
	self bioLog: 'Downloads completed successfully' ] 
		forkAt: Processor userBackgroundPriority 
		named: 'BLAST updater'.

	 