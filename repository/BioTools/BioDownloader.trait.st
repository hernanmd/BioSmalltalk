"
Trait user shoul provide:

- client 
- connectionSettings
- checkMD5
- forceDownload
- workingDirectory 

Client must implement

- loginUser:password:
- getFileNamed:

"
Trait {
	#name : #BioDownloader,
	#category : #'BioTools-Helpers'
}

{ #category : #downloading }
BioDownloader >> connect [
	" Private - Connect the receiver's to download databases "
	
	[ self client: (self ftpClientClass openOnHostNamed: self serverName).
	self client loginUser: self serverUser password: self serverPassword ]
	on: NetworkError, LoginFailedException
	do: [ : ex | self connectionRetry 
				ifFalse: [ self error: 'Connection failed.'. ^ nil ] ].

]

{ #category : #defaults }
BioDownloader >> defaultPassword [
	" Answer a <String> with the password to connect "
	
	^ 'anonymous'

]

{ #category : #defaults }
BioDownloader >> defaultUser [
	" Answer a String with the user name to connect "
	
	^ 'anonymous'

]

{ #category : #downloading }
BioDownloader >> download [
	" Download the requested files only if they are missing or if they are newer in the remote site. "
	
	self filesToDownload do: [ : fileName | self prvDownload: fileName ].
	self bioLog: 'Downloads completed successfully'.

]

{ #category : #downloading }
BioDownloader >> download: fileName [
	" Download fileName from the remote site. "
	
	self connect
		ifNotNil: [ 
			self prvDownload: fileName.
			self client close.
			self bioLog: 'Downloads completed successfully' translated ]
		ifNil: [ self informMessage: 'Connection failed' translated ].
	
	 
]

{ #category : #downloading }
BioDownloader >> downloadUrl [
	" Answer a <String> with the URL to fetch to the server "

	^ self url downloadUrl
]

{ #category : #downloading }
BioDownloader >> fetch [
	" Answer the result of the command applied on the receiver "

	^ self client fetch
]

{ #category : #downloading }
BioDownloader >> info [
	" Answer the result of the command applied on the receiver "

	^ self client info
]

{ #category : #downloading }
BioDownloader >> isUpdated: fileName [
	" Answer <true> if modification time of remote fileName is newer than modification time of receiver's copy of fileName "

	| fullName |
		
	self workingDirectory asFileReference exists
		ifFalse: [ 
			self newDirectory: self workingDirectory.
			self isUpdated: fileName ].
	fullName := self fullFileNameFor: fileName.
	^ (self fileExists: fullName)
		and: [ (self openFileNamed: fileName) directoryEntry modificationTime < (self client getMdtm: fileName) ]
]

{ #category : #downloading }
BioDownloader >> prvDownload: fileName [
	" Private - Download fileName in the receiver's repository "

	((self isUpdated: fileName) not or: [ self forceDownload ]) 
		ifTrue: [
			self prvDownloadFileNamed: fileName binary: true.
			self checkMD5 and: [ (self verifyMD5checksum: fileName)
				ifFalse: [ self error: 'Checksum failed' ] ] ]
		ifFalse: [
			self bioLog: 'Skipping download, file is updated: ' , fileName ]

]

{ #category : #downloading }
BioDownloader >> prvDownloadFileNamed: fileName binary: boolean [
	" Private - Download fileName in the receiver's repository "

	| stream |

	self bioLog: 'Started download of ' , fileName.			
	stream := [ self newFileNamed: fileName ]
	on: FileExistsException
	do: [ : ex | ^ self ].
	boolean ifTrue: [ stream binary ].
	self flag: #needsWork. " on: TelnetProtocolError  ....: Could not enter passive mode: 421 Idle timeout (420 seconds): closing control connection "
	[ stream nextPutAll: (self client getFileNamed: fileName) ]
		ensure: [ stream close ].
	self bioLog: 'Completed download of ' , fileName.
	^ stream
]

{ #category : #downloading }
BioDownloader >> search [
	" Answer the result of the command applied on the receiver "

	^ self client search
]

{ #category : #downloading }
BioDownloader >> url [
	" Answer a Http Url with the receiver's configured URL "

	^ self client url
]

{ #category : #downloading }
BioDownloader >> verifyMD5checksum: fileName [
	" Answer <true> if receiver's checksum file exists and remote digest is the same as the receiver's downloaded 
	fileName digest (is not corrupted) "
	
	| remoteMD5File remoteMD5 localMD5 localMD5File |
	
	remoteMD5File := self prvDownloadFileNamed: fileName , '.md5' binary: false.
	remoteMD5 := remoteMD5File contents copyUpTo: Character space.
	
	localMD5File :=  (self openFileNamed: fileName) binary.
	localMD5 := (MD5 new hashMessage: localMD5File contents) hex.
	
	^ remoteMD5 = localMD5
]
