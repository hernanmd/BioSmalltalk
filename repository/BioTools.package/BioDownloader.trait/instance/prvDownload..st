downloading
prvDownload: fileName
	" Private - Download fileName in the receiver's repository "

	((self isUpdated: fileName) not or: [ self forceDownload ]) 
		ifTrue: [
			self prvDownloadFileNamed: fileName binary: true.
			self checkMD5 and: [ (self verifyMD5checksum: fileName)
				ifFalse: [ self error: 'Checksum failed' ] ] ]
		ifFalse: [
			self bioLog: 'Skipping download, file is updated: ' , fileName ]
