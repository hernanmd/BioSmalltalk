downloading
verifyMD5checksum: fileName
	" Answer <true> if receiver's checksum file exists and remote digest is the same as the receiver's downloaded 
	fileName digest (is not corrupted) "
	
	| remoteMD5File remoteMD5 localMD5 localMD5File |
	
	remoteMD5File := self prvDownloadFileNamed: fileName , '.md5' binary: false.
	remoteMD5 := remoteMD5File contents copyUpTo: Character space.
	
	localMD5File :=  ( self openFileNamed: fileName ) binary.
	localMD5 := ( MD5 new hashMessage: localMD5File contents ) hex.
	
	^ remoteMD5 = localMD5