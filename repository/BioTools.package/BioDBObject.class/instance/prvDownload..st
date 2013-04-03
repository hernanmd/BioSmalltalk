downloading
prvDownload: fileName
	" Private - Download fileName in the receiver's repository "
	
	((self isUpdated: fileName) not or: [ forceDownload ]) 
		ifTrue: [
			self prvDownloadFileNamed: fileName binary: true.
			checkMD5 and: [ 
				(self verifyMD5checksum: fileName)
					ifFalse: [ self error: 'Checksum failed' ] ] ]
		ifFalse: [
			self bioLog: 'Skipping download, file is updated: ' , fileName ]
	
	 