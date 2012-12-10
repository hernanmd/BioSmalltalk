private
ensureBinary

	| program binary |
	self checkCygwinAvailableUnderWindows.
	program := self programFilename.
	program exists ifFalse: [ 
		binary := self programBinary.
		program writeStream binary
			nextPutAll: binary;
			close.
		self setUnixPermissions. ].