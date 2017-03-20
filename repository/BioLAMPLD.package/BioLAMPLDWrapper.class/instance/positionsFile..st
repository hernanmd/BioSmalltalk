options
positionsFile: aFilename
	" Configure receiver's positions file name "

	self positionsFileName: aFilename.
	self parameters at: 3 put: aFilename