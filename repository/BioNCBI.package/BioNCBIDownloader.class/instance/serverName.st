initialize-release
serverName
	" Answer a String with the receiver's server name "
	
	^ self connectionSettings serverAddress
