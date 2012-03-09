accessing
webEnv: aWebEnvString
	" Append aWebEnvString for setting the remote web environment "

	aWebEnvString isEmpty
		ifFalse: [ self addParameters: '&WebEnv=' , aWebEnvString ]