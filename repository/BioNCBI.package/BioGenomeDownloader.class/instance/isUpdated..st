accessing
isUpdated: fileName
	" Answer <true> if modification time of remote fileName is newer
	than modification time of receiver's copy of fileName "

	| fullName |
		
	fullName := (FileSystem workingDirectory / fileName) fullName.
	^ (self fileExists: fullName)
		and: [ (self openFileNamed: fileName) directoryEntry modificationTime < (self client getMdtm: fileName) ]