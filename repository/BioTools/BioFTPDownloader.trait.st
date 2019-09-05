Trait {
	#name : #BioFTPDownloader,
	#traits : 'BioDownloader',
	#classTraits : 'BioDownloader classTrait',
	#category : 'BioTools-Helpers'
}

{ #category : #downloading }
BioFTPDownloader >> connect [
	" Private - Connect the receiver's to download databases "
	
	[ self client: (self ftpClientClass openOnHostNamed: self serverName).
	self client loginUser: self serverUser password: self serverPassword ]
	on: NetworkError, LoginFailedException
	do: [ : ex | 
		self connectionRetry 
				ifFalse: [ self error: 'Connection failed.'. ^ nil ] ].
	self client changeDirectoryTo: self serverDirectory.
	self client binary.
]

{ #category : #downloading }
BioFTPDownloader >> ftpClientClass [
	" Answer a class for handling FTP connections "

	^ Smalltalk at: #FTPClient ifAbsent: [ self error: 'FTP client was not found in the system' ]
]
