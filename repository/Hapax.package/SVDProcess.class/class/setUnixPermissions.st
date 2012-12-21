private
setUnixPermissions

	OSPlatform isUnix
		ifTrue: [ (Smalltalk at: #OSProcess) command: ('chmod +x ', self programFilename asString) ]