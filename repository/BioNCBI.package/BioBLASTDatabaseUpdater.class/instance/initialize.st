initialize-release
initialize
	" Private - Initialize receiver's settings "
	
	super initialize.
	forceDownload := false.
	checkMD5 := true.
	self connectionSettings
			user: self defaultUser;
			password: self defaultPassword;
			serverAddress: self defaultServerName;
			serverDirectory: self defaultDirectory.