initialization
initialize
	" Private - Initialize receiver's settings "
	
	super initialize.
	forceDownload := false.
	checkMD5 := false.
	self beChrFileZeroPrefixed.
	self beChrDirZeroPrefixed.
	self connectionSettings
			user: self defaultUser;
			password: self defaultPassword;
			serverAddress: self defaultServerName