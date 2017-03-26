private
invalidPlatform
	" Perform an action after an invalid platform for the receiver was detected.
	Override if necessary "
	
	self informMessage: self softwareName , ' is not supported in the current platform: ' , Smalltalk os name.