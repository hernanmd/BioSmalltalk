downloading
isUpdated: fileName
	" Answer <true> if modification time of remote fileName is newer
	than modification time of receiver's copy of fileName "

	| fullName |
		
	self workingDirectory asFileReference exists
		ifFalse: [ 
			self newDirectory: self workingDirectory.
			self isUpdated: fileName ].
	fullName := self fullFileNameFor: fileName.
	^ (self fileExists: fullName)
		and: [ (self openFileNamed: fileName) directoryEntry modificationTime < (self client getMdtm: fileName) ]